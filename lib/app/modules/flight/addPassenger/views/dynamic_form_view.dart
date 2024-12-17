import 'package:flightbooking/app/modules/flight/addPassenger/controllers/dynamic_form_controller.dart';
import 'package:flightbooking/app/modules/flight/searchFlight/controllers/search_flight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicForm extends StatelessWidget {
  final Map<String, dynamic> formData; // Fields from the API response
  final DynamicFormController dynamicFormController =
      Get.put(DynamicFormController());

  DynamicForm({Key? key, required this.formData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flightSearchController = Get.put(SearchFlightController());
    int passengerCount = flightSearchController.selectedTravelers.value;

    // Initialize controllers dynamically
    dynamicFormController.initializeControllers(passengerCount, formData);

    return Scaffold(
      appBar: AppBar(title: const Text('Passenger Forms')),
      body: ListView.builder(
        itemCount: passengerCount,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Passenger ${index + 1}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ..._generateFormFields(context, index, 'lead'),
                  const Divider(),
                  ..._generateFormFields(context, index, 'all'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dynamicFormController.submitFormData(passengerCount);
          print('button cliked');
        },
        child: const Icon(Icons.send),
      ),
    );
  }

  // List<Widget> _generateFormFields(
  //     BuildContext context, int passengerIndex, String section) {
  //   List<Widget> formWidgets = [];
  //   Map<String, dynamic> passengerFields =
  //       formData['data']['passsengersForm'][section];

  //   passengerFields.forEach((fieldName, fieldData) {
  //     String fieldType = fieldData[0]['type'];
  //     String fieldCaption = fieldData[0]['caption'];

  //     switch (fieldType) {
  //       case 'text':
  //       case 'email':
  //       case 'phone':
  //         formWidgets.add(
  //           TextField(
  //             controller: dynamicFormController.textControllers[passengerIndex]
  //                 ?[fieldName],
  //             decoration: InputDecoration(
  //               labelText: fieldCaption,
  //               hintText: 'Enter your $fieldCaption',
  //             ),
  //             onChanged: (value) {
  //               print(value);
  //               print(dynamicFormController.textControllers);
  //               print(section);
  //             },
  //           ),
  //         );
  //         break;

  //       case 'select':
  //         Map<String, String> items =
  //             Map<String, String>.from(fieldData[0]['items']);
  //         formWidgets.add(
  //           DropdownButtonFormField<String>(
  //             decoration: InputDecoration(labelText: fieldCaption),
  //             items: items.entries.map((entry) {
  //               return DropdownMenuItem<String>(
  //                 value: entry.key,
  //                 child: Text(entry.value),
  //               );
  //             }).toList(),
  //             onChanged: (value) {
  //               dynamicFormController.selectedValues[passengerIndex]
  //                   ?[fieldName] = value!;
  //             },
  //           ),
  //         );
  //         break;

  //       case 'birthdate':
  //       case 'expirydate':
  //         formWidgets.add(
  //           GestureDetector(
  //             onTap: () async {
  //               DateTime? pickedDate = await showDatePicker(
  //                 context: context,
  //                 initialDate: DateTime.now(),
  //                 firstDate: DateTime(1900),
  //                 lastDate: DateTime(2050),
  //               );
  //               if (pickedDate != null) {
  //                 // Format the selected date
  //                 String formattedDate =
  //                     "${pickedDate.toLocal()}".split(' ')[0];

  //                 // Update the selected date in the controller
  //                 dynamicFormController.selectedDates[passengerIndex]
  //                     ?[fieldName] = formattedDate;

  //                 // Update the TextEditingController
  //                 dynamicFormController
  //                     .textControllers[passengerIndex]?[fieldName]
  //                     ?.text = formattedDate;
  //                 print(
  //                     'Formated Date is : ${dynamicFormController.textControllers[passengerIndex]?[fieldName]?.text = formattedDate}');
  //               }
  //             },
  //             child: AbsorbPointer(
  //               child: TextField(
  //                 controller: dynamicFormController
  //                     .textControllers[passengerIndex]?[fieldName],
  //                 decoration: InputDecoration(
  //                   labelText: fieldCaption,
  //                   hintText: 'Select your $fieldCaption',
  //                 ),
  //               ),
  //             ),
  //           ),

  //           // GestureDetector(
  //           //   onTap: () async {
  //           //     DateTime? pickedDate = await showDatePicker(
  //           //       context: context,
  //           //       initialDate: DateTime.now(),
  //           //       firstDate: DateTime(1900),
  //           //       lastDate: DateTime(2050),
  //           //     );
  //           //     if (pickedDate != null) {
  //           //       dynamicFormController
  //           //               .selectedDates[passengerIndex]![fieldName] =
  //           //           "${pickedDate.toLocal()}".split(' ')[0];
  //           //     }
  //           //   },
  //           //   child: AbsorbPointer(
  //           //     child: TextField(
  //           //       decoration: InputDecoration(
  //           //         labelText: fieldCaption,
  //           //         hintText: dynamicFormController
  //           //                 .selectedDates[passengerIndex]?[fieldName] ??
  //           //             'Select your $fieldCaption',
  //           //       ),
  //           //     ),
  //           //   ),
  //           // ),
  //         );
  //         break;

  //       case 'CountryCode':
  //         Map<String, String> items =
  //             Map<String, String>.from(fieldData[0]['items'] ?? {});
  //         formWidgets.add(
  //           DropdownButtonFormField<String>(
  //             decoration: InputDecoration(labelText: fieldCaption),
  //             items: items.entries.map((entry) {
  //               return DropdownMenuItem<String>(
  //                 value: entry.key,
  //                 child: Text(entry.value),
  //               );
  //             }).toList(),
  //             onChanged: (value) {
  //               dynamicFormController.selectedCountries[passengerIndex] =
  //                   value!;
  //             },
  //           ),
  //         );
  //         break;
  //     }

  //     formWidgets.add(const SizedBox(height: 10));
  //   });

  //   return formWidgets;
  // }

  List<Widget> _generateFormFields(
      BuildContext context, int passengerIndex, String section) {
    List<Widget> formWidgets = [];
    Map<String, dynamic> passengerFields =
        formData['data']['passsengersForm'][section];

    // Add fields dynamically based on formData
    passengerFields.forEach((fieldName, fieldData) {
      String fieldType = fieldData[0]['type'];
      String fieldCaption = fieldData[0]['caption'];

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
                print(dynamicFormController.textControllers);
                print(section);
              },
            ),
          );
          break;
        case 'countryPhoneCode':
          formWidgets.add(
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: fieldCaption),
              items: _getCountryPhoneCodeItems(),
              // items.entries.map((entry) {
              //   return DropdownMenuItem<String>(
              //     value: entry.key,
              //     child: Text(entry.value),
              //   );
              // }).toList(),
              onChanged: (value) {
                dynamicFormController.selectedCountries[passengerIndex] =
                    value!;
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
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050),
                );
                if (pickedDate != null) {
                  // Format the selected date
                  String formattedDate =
                      "${pickedDate.toLocal()}".split(' ')[0];

                  // Update the selected date in the controller
                  dynamicFormController.selectedDates[passengerIndex]
                      ?[fieldName] = formattedDate;

                  // Update the TextEditingController
                  dynamicFormController
                      .textControllers[passengerIndex]?[fieldName]
                      ?.text = formattedDate;
                  print(
                      'Formatted Date is : ${dynamicFormController.textControllers[passengerIndex]?[fieldName]?.text = formattedDate}');
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: dynamicFormController
                      .textControllers[passengerIndex]?[fieldName],
                  decoration: InputDecoration(
                    labelText: fieldCaption,
                    hintText: 'Select your $fieldCaption',
                  ),
                ),
              ),
            ),
          );
          break;

        case 'CountryCode':
          // Map<String, String> items =
          //     Map<String, String>.from(fieldData[0]['items'] ?? {});
          formWidgets.add(
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: fieldCaption),
              items: _getCountryCodeItems(),
              // items.entries.map((entry) {
              //   return DropdownMenuItem<String>(
              //     value: entry.key,
              //     child: Text(entry.value),
              //   );
              // }).toList(),
              onChanged: (value) {
                dynamicFormController.selectedCountries[passengerIndex] =
                    value!;
              },
            ),
          );
          break;
      }

      formWidgets.add(const SizedBox(height: 10));
    });

    // // Add the "Country Code" field (required for every form)
    formWidgets.add(
      DropdownButtonFormField<String>(
        decoration: const InputDecoration(labelText: "Country Code"),
        items:
            _getCountryCodeItems(), // Define this method to provide country codes
        onChanged: (value) {
          dynamicFormController.selectedCountries[passengerIndex] = value!;
        },
      ),
    );
    formWidgets.add(const SizedBox(height: 10));

    return formWidgets;
  }

  List<DropdownMenuItem<String>> _getCountryCodeItems() {
    Map<String, String> countryCodes = {
      '+92': 'Pakistan',
      '+91': 'India',
      '+93': 'Afghanistan',
      '+1': 'United States',
      '+44': 'United Kingdom',
    };

    return countryCodes.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text("${entry.value} (${entry.key})"),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _getCountryPhoneCodeItems() {
    Map<String, String> countryCodes = {
      '+97': 'Pakistan',
      '+118': 'India',
      '+138': 'Afghanistan',
      '+18': 'United States',
      '+41': 'United Kingdom',
    };

    return countryCodes.entries.map((entry) {
      return DropdownMenuItem<String>(
        value: entry.key,
        child: Text("${entry.value} (${entry.key})"),
      );
    }).toList();
  }
}
