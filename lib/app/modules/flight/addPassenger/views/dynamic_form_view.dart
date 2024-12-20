import 'package:flightbooking/app/modules/flight/addPassenger/controllers/dynamic_form_controller.dart';
import 'package:flightbooking/app/modules/flight/searchFlight/controllers/search_flight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DynamicForm extends StatelessWidget {
  final Map<String, dynamic> formData; // Fields from the API response
  final DynamicFormController dynamicFormController =
      Get.put(DynamicFormController());

  DynamicForm({Key? key, required this.formData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flightSearchController = Get.put(SearchFlightController());

    // Fetch the number of adults, children, and infants from GetStorage
    var storage = GetStorage();
    int adultsCount = storage.read('selectedAdults');
    int childrenCount = storage.read('selectedChildrens');
    int infantsCount = storage.read('selectedInfants');
    int passengerCount = (adultsCount + childrenCount + infantsCount);

    // Initialize controllers dynamically based on passenger counts
    dynamicFormController.initializeControllers(
        adultsCount, childrenCount, infantsCount, formData);

    return Scaffold(
      appBar: AppBar(title: const Text('Passenger Forms')),
      body: ListView.builder(
        itemCount: passengerCount,
        itemBuilder: (context, index) {
          // Determine passenger type based on index
          String passengerType = _getPassengerType(
            index,
            adultsCount,
            childrenCount,
          );
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$passengerType ${index + 1}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ..._generateFormFields(context, index, 'lead'),
                  const Divider(),
                  ..._generateFormFields(context, index, 'all'),

                  // FutureBuilder<List<Map<String, dynamic>>>(
                  //   future: dynamicFormController.fetchCountries(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return CircularProgressIndicator(); // Loading indicator
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');
                  //     } else if (snapshot.hasData &&
                  //         snapshot.data!.isNotEmpty) {
                  //       final countries1 = snapshot.data!;
                  //       return DropdownButtonFormField<Map<String, dynamic>>(
                  //         decoration: const InputDecoration(
                  //             labelText: 'Passport Issuing Country'),
                  //         items: countries1.map((country1) {
                  //           return DropdownMenuItem(
                  //             value: country1,
                  //             child: Text(
                  //                 '${country1['title']} (${country1['phone_code'] ?? ''})'),
                  //           );
                  //         }).toList(),
                  //         onChanged: (value) {
                  //           if (value != null) {
                  //             dynamicFormController.selectedCountries[index + 1]
                  //                 ['postrt'] = value;
                  //           }
                  //         },
                  //       );
                  //     } else {
                  //       return Text('No countries available');
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dynamicFormController.submitFormData(
              adultsCount, childrenCount, infantsCount);
          print('new infants value is  $infantsCount');
          print('Form submitted');
          print('total passenger Count isiiii $passengerCount');
        },
        child: const Icon(Icons.send),
      ),
    );
  }

  String _getPassengerType(int index, int adultsCount, int childrenCount) {
    if (index < adultsCount) {
      return 'Adult';
    } else if (index < adultsCount + childrenCount) {
      return 'Child';
    } else {
      return 'Infant';
    }
  }

  List<Widget> _generateFormFields(
      BuildContext context, int passengerIndex, String passengerType) {
    List<Widget> formWidgets = [];
    Map<String, dynamic> passengerFields =
        formData['data']['passsengersForm'][passengerType];

    passengerFields.forEach((fieldName, fieldData) {
      String fieldType = fieldData[0]['type'];
      String fieldCaption = fieldData[0]['caption'];

      // Render appropriate fields based on the type
      switch (fieldType) {
        case 'text':
        case 'email':
        case 'phone':
          formWidgets.add(
            TextField(
              controller: dynamicFormController.textControllers[passengerIndex]
                  ?[fieldName],
              decoration: InputDecoration(
                labelText: fieldCaption,
                hintText: 'Enter your $fieldCaption',
              ),
              onChanged: (value) {
                print(value);
              },
            ),
          );
          break;

        case 'select':
          Map<String, String> items =
              Map<String, String>.from(fieldData[0]['items']);
          formWidgets.add(
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: fieldCaption),
              items: items.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (value) {
                dynamicFormController.selectedValues[passengerIndex]
                    ?[fieldName] = value!;
              },
            ),
          );
          break;

        case 'birthdate':
        case 'expirydate':
          formWidgets.add(
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2050),
                );

                if (pickedDate != null) {
                  String formattedDate =
                      "${pickedDate.toLocal()}".split(' ')[0];

                  dynamicFormController.selectedDates[passengerIndex]
                      ?[fieldName] = formattedDate;

                  dynamicFormController
                      .textControllers[passengerIndex]?[fieldName]
                      ?.text = formattedDate;

                  //to rebuild the UI
                  dynamicFormController.update();
                }
              },
              child: AbsorbPointer(
                child: GetBuilder<DynamicFormController>(
                  builder: (controller) {
                    return TextField(
                      controller: controller.textControllers[passengerIndex]
                          ?[fieldName],
                      decoration: InputDecoration(
                        labelText: fieldCaption,
                        hintText: 'Select your $fieldCaption',
                      ),
                    );
                  },
                ),
              ),
            ),
          );
          break;
        case 'CountryCode':
          formWidgets.add(
            FutureBuilder<List<Map<String, dynamic>>>(
              future: dynamicFormController.fetchCountries(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Loading indicator
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final countries = snapshot.data!;
                  return DropdownButtonFormField<Map<String, dynamic>>(
                    decoration: InputDecoration(labelText: fieldCaption),
                    items: countries.map((country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(
                            '${country['title']} (${country['phone_code'] ?? ''})'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        dynamicFormController
                            .selectedCountries[passengerIndex] = value;
                      }
                    },
                  );
                } else {
                  return Text('No countries available');
                }
              },
            ),
          );
          break;
      }

      formWidgets.add(const SizedBox(height: 10));
    });

    return formWidgets;
  }
}


// class DynamicForm extends StatelessWidget {
//   final Map<String, dynamic> formData; // Fields from the API response
//   final DynamicFormController dynamicFormController =
//       Get.put(DynamicFormController());

//   DynamicForm({Key? key, required this.formData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final flightSearchController = Get.put(SearchFlightController());
//     int passengerCount = flightSearchController.selectedTravelers.value;

//     // Initialize controllers dynamically
//     dynamicFormController.initializeControllers(passengerCount, formData);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Passenger Forms')),
//       body: ListView.builder(
//         itemCount: passengerCount,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.all(10),
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Passenger ${index + 1}',
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   ..._generateFormFields(context, index, 'lead'),
//                   const Divider(),
//                   ..._generateFormFields(context, index, 'all'),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           dynamicFormController.submitFormData(passengerCount);
//           print('button clicked');
//         },
//         child: const Icon(Icons.send),
//       ),
//     );
//   }

//   List<Widget> _generateFormFields(
//       BuildContext context, int passengerIndex, String section) {
//     List<Widget> formWidgets = [];
//     Map<String, dynamic> passengerFields =
//         formData['data']['passsengersForm'][section];

//     // Add fields dynamically based on formData
//     passengerFields.forEach((fieldName, fieldData) {
//       String fieldType = fieldData[0]['type'];
//       String fieldCaption = fieldData[0]['caption'];

//       switch (fieldType) {
//         case 'text':
//         case 'email':
//         case 'phone':
//           formWidgets.add(
//             TextField(
//               controller: dynamicFormController.textControllers[passengerIndex]
//                   ?[fieldName],
//               decoration: InputDecoration(
//                 labelText: fieldCaption,
//                 hintText: 'Enter your $fieldCaption',
//               ),
//               onChanged: (value) {
//                 print(value);
//                 print(dynamicFormController.textControllers);
//                 print(section);
//               },
//             ),
//           );
//           break;

//         case 'select':
//           Map<String, String> items =
//               Map<String, String>.from(fieldData[0]['items']);
//           formWidgets.add(
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(labelText: fieldCaption),
//               items: items.entries.map((entry) {
//                 return DropdownMenuItem<String>(
//                   value: entry.key,
//                   child: Text(entry.value),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 dynamicFormController.selectedValues[passengerIndex]
//                     ?[fieldName] = value!;
//               },
//             ),
//           );
//           break;

//         case 'birthdate':
//         case 'expirydate':
//           formWidgets.add(
//             GestureDetector(
//               onTap: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(1900),
//                   lastDate: DateTime(2050),
//                 );
//                 if (pickedDate != null) {
//                   // Format the selected date
//                   String formattedDate =
//                       "${pickedDate.toLocal()}".split(' ')[0];

//                   // Update the selected date in the controller
//                   dynamicFormController.selectedDates[passengerIndex]
//                       ?[fieldName] = formattedDate;

//                   // Update the TextEditingController
//                   dynamicFormController
//                       .textControllers[passengerIndex]?[fieldName]
//                       ?.text = formattedDate;
//                 }
//               },
//               child: AbsorbPointer(
//                 child: TextField(
//                   controller: dynamicFormController
//                       .textControllers[passengerIndex]?[fieldName],
//                   decoration: InputDecoration(
//                     labelText: fieldCaption,
//                     hintText: 'Select your $fieldCaption',
//                   ),
//                 ),
//               ),
//             ),
//           );
//           break;

//         case 'CountryCode':
//           formWidgets.add(
//             FutureBuilder<List<Map<String, dynamic>>>(
//               future: dynamicFormController.fetchCountries(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator(); // Loading indicator
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//                   // Build the dropdown
//                   final countries = snapshot.data!;
//                   return DropdownButtonFormField<Map<String, dynamic>>(
//                     decoration: InputDecoration(labelText: fieldCaption),
//                     items: countries.map((country) {
//                       return DropdownMenuItem(
//                         value: country,
//                         child: Text(
//                             '${country['title']} (${country['phone_code'] ?? ''})'),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         dynamicFormController
//                             .selectedCountries[passengerIndex] = value;
//                         print('Selected Country ID: ${value['id']}');
//                         print('Selected Phone Code: ${value['phone_code']}');
//                       }
//                     },
//                   );
//                 } else {
//                   return Text('No countries available');
//                 }
//               },
//             ),
//           );
//           break;

        
//       }

//       formWidgets.add(const SizedBox(height: 10));
//     });

//     formWidgets.add(const SizedBox(height: 10));

//     return formWidgets;
//   }

//   List<DropdownMenuItem<String>> getCountryCodeItems() {
//     Map<String, String> countryCodes = {
//       '+92': 'Pakistan',
//       '+91': 'India',
//       '+93': 'Afghanistan',
//       '+1': 'United States',
//       '+44': 'United Kingdom',
//     };

//     return countryCodes.entries.map((entry) {
//       return DropdownMenuItem<String>(
//         value: entry.key,
//         child: Text("${entry.value} (${entry.key})"),
//       );
//     }).toList();
//   }

//   List<DropdownMenuItem<String>> getCountryPhoneCodeItems() {
//     Map<String, String> countryCodes = {
//       '+97': 'Pakistan',
//       '+118': 'India',
//       '+138': 'Afghanistan',
//       '+18': 'United States',
//       '+41': 'United Kingdom',
//     };

//     return countryCodes.entries.map((entry) {
//       return DropdownMenuItem<String>(
//         value: entry.key,
//         child: Text("${entry.value} (${entry.key})"),
//       );
//     }).toList();
//   }
// }
