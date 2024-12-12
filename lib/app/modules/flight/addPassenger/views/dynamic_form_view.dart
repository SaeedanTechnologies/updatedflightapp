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
      appBar: AppBar(title: Text('Passenger Forms')),
      body: ListView.builder(
        itemCount: passengerCount,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Passenger ${index + 1}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ..._generateFormFields(context, index, 'lead'),
                  Divider(),
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
        child: Icon(Icons.send),
      ),
    );
  }

  List<Widget> _generateFormFields(
      BuildContext context, int passengerIndex, String section) {
    List<Widget> formWidgets = [];
    Map<String, dynamic> passengerFields =
        formData['data']['passsengersForm'][section];

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
                print(dynamicFormController.textControllers ??
                    "Controller or value is null");
                print(section);
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

            // GestureDetector(
            //   onTap: () async {
            //     DateTime? pickedDate = await showDatePicker(
            //       context: context,
            //       initialDate: DateTime.now(),
            //       firstDate: DateTime(1900),
            //       lastDate: DateTime(2050),
            //     );
            //     if (pickedDate != null) {
            //       dynamicFormController
            //               .selectedDates[passengerIndex]![fieldName] =
            //           "${pickedDate.toLocal()}".split(' ')[0];
            //     }
            //   },
            //   child: AbsorbPointer(
            //     child: TextField(
            //       decoration: InputDecoration(
            //         labelText: fieldCaption,
            //         hintText: dynamicFormController
            //                 .selectedDates[passengerIndex]?[fieldName] ??
            //             'Select your $fieldCaption',
            //       ),
            //     ),
            //   ),
            // ),
          );
          break;

        case 'CountryCode':
          Map<String, String> items =
              Map<String, String>.from(fieldData[0]['items'] ?? {});
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
                dynamicFormController.selectedCountries[passengerIndex] =
                    value!;
              },
            ),
          );
          break;
      }

      formWidgets.add(SizedBox(height: 10));
    });

    return formWidgets;
  }
}





// class DynamicForm extends StatelessWidget {
//   final Map<String, dynamic> formData; // Fields from the API response

//   DynamicForm({Key? key, required this.formData}) : super(key: key);

//   var selectedDates =
//       <int, Map<String, String>>{}.obs; // Stores date selections
//   var selectedCountries = <int, String>{}.obs;
//   //final SearchFlightController controller = Get.put(SearchFlightController());

//   @override
//   Widget build(BuildContext context) {
//     final flightSearchController = Get.put(SearchFlightController());
//     return Scaffold(
//       appBar: AppBar(title: Text('Passenger Forms')),
//       body: ListView.builder(
//         itemCount: flightSearchController.selectedTravelers.value,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: Padding(
//               padding: EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Passenger ${index + 1}',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   // Generate form fields for 'lead' section
//                   ..._generateFormFields(context, index, 'lead'),
//                   Divider(),
//                   // Generate form fields for 'all' section
//                   ..._generateFormFields(context, index, 'all'),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   List<Widget> _generateFormFields(
//       BuildContext context, int passengerIndex, String section) {
//     List<Widget> formWidgets = [];

//     // Get fields from the specified section ('lead' or 'all')
//     Map<String, dynamic> passengerFields =
//         formData['data']['passsengersForm'][section];

//     passengerFields.forEach((fieldName, fieldData) {
//       String fieldType = fieldData[0]['type'];
//       String fieldCaption = fieldData[0]['caption'];
//       bool isOptional = fieldData[0]['optional'] ?? false;

//       switch (fieldType) {
//         case 'text':
//           formWidgets.add(
//             TextField(
//               decoration: InputDecoration(
//                 labelText: fieldCaption,
//                 hintText: 'Enter your $fieldCaption',
//               ),
//             ),
//           );
//           break;

//         case 'email':
//           formWidgets.add(
//             TextField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 labelText: fieldCaption,
//                 hintText: 'Enter your $fieldCaption',
//               ),
//             ),
//           );
//           break;

//         case 'phone':
//           formWidgets.add(
//             TextField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 labelText: fieldCaption,
//                 hintText: 'Enter your $fieldCaption',
//               ),
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
//               onChanged: (value) {},
//             ),
//           );
//           break;

//         case 'birthdate':
//         case 'expirydate':
//           formWidgets.add(
//             Obx(() {
//               String selectedDate = selectedDates[passengerIndex]?[fieldName] ??
//                   'Select your $fieldCaption';
//               return GestureDetector(
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime(2050),
//                   );
//                   if (pickedDate != null) {
//                     // Store the selected date in the controller
//                     selectedDates[passengerIndex] ??= {};
//                     selectedDates[passengerIndex]![fieldName] =
//                         "${pickedDate.toLocal()}".split(' ')[0];
//                   }
//                 },
//                 child: AbsorbPointer(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: fieldCaption,
//                       hintText: selectedDate,
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           );
//           break;

//         case 'CountryCode':
//           Map<String, String> items =
//               Map<String, String>.from(fieldData[0]['items'] ?? {});
//           formWidgets.add(
//             Obx(() {
//               String selectedCountry = selectedCountries[passengerIndex] ??
//                   'Select your $fieldCaption';
//               return DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: fieldCaption),
//                 value: selectedCountry == 'Select your $fieldCaption'
//                     ? null
//                     : selectedCountry,
//                 items: items.entries.map((entry) {
//                   return DropdownMenuItem<String>(
//                     value: entry.key,
//                     child: Text(entry.value),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     selectedCountries[passengerIndex] = value;
//                   }
//                 },
//               );
//             }),
//           );
//           break;

//         // default:
//         //   formWidgets.add(
//         //     Text('Field type $fieldType not implemented for $fieldCaption'),
//         //   );
//         //   break;
//       }

//       // Add spacing between fields
//       formWidgets.add(SizedBox(height: 10));
//     });

//     return formWidgets;
//   }
// }
