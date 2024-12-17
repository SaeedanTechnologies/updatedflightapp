// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;

// class DynamicFormController1 extends GetxController {
//   var passengers = {
//     'adults': <Map<String, TextEditingController>>[].obs,
//   }.obs;

//   void initializeForms(int adults) {
//     passengers['adults']!.value = List.generate(
//       adults,
//       (_) => {
//         'first_name': TextEditingController(),
//         'last_name': TextEditingController(),
//         'email': TextEditingController(),
//         'phone': TextEditingController(),
//         'gender': TextEditingController(),
//         'birthdate': TextEditingController(),
//         'passport_expiry': TextEditingController(),
//         'passport_number': TextEditingController(),
//       },
//     );
//   }

//   bool validateForms(int passengerCount) {
//     for (int i = 0; i < passengerCount; i++) {
//       final form = passengers['adults']![i];
//       if (form['first_name']!.text.isEmpty ||
//           form['email']!.text.isEmpty ||
//           !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(form['email']!.text)) {
//         Get.snackbar(
//             'Error', 'Please fill all required fields with valid data');
//         return false;
//       }
//     }
//     return true;
//   }

//   Map<String, dynamic> collectFormData(int passengerCount) {
//     final data = <String, dynamic>{
//       'passengers': {'adults': []}
//     };
//     for (int i = 0; i < passengerCount; i++) {
//       final form = passengers['adults']![i];
//       data['passengers']['adults'].add({
//         'first_name': form['first_name']!.text,
//         'last_name': form['last_name']!.text,
//         'email': form['email']!.text,
//         'phone': form['phone']!.text,
//         'gender': form['gender']!.text,
//         'birthdate': form['birthdate']!.text,
//         'passport_expiry': form['passport_expiry']!.text,
//         'passport_number': form['passport_number']!.text,
//       });
//     }
//     return data;
//   }

//   Future<void> submitFormData(int passengerCount) async {
//     print('kbasdksabdksajbdkasbdkbaskdbaskdbaskjdbkasdbas');
//     if (!validateForms(passengerCount)) return;

//     // try {
//     final storage = GetStorage();
//     String? bookingReferenceId = storage.read('bookingReferenceId');

//     // Validate bookingReferenceId
//     if (bookingReferenceId == null || bookingReferenceId.isEmpty) {
//       Get.snackbar('Error', 'Booking Reference ID is missing');
//       return;
//     }
//     print("refBookingId is : $bookingReferenceId");

//     // Collect data
//     Map<String, dynamic> apiPayload = collectFormData(passengerCount);
//     print('apiPayload is : $apiPayload');
//     print('adults ');
//     // Transform apiPayload to match the API's required form-data structure
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse('https://marketplace.beta.luxota.network/v1/book/guests'),
//     );

//     // Add headers
//     request.headers.addAll({
//       'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with actual token
//     });

//     // Add bookingReferenceId as a field
//     request.fields['referenceId'] = bookingReferenceId;

//     // Flatten and add passenger data to the request
//     Map<String, dynamic> passengers = apiPayload['passengers'];
//     List<dynamic> adults = passengers['adults'];
//     print('adults ${adults}');
//     for (int i = 0; i < adults.length; i++) {
//       var adult = adults[i];
//       request.fields['passengers[adults][$i][First_name]'] =
//           adult['first_name'];
//       request.fields['passengers[adults][$i][Last_name]'] = adult['last_name'];
//       request.fields['passengers[adults][$i][email]'] = adult['email'];
//       request.fields['passengers[adults][$i][phone]'] = adult['phone'];
//       request.fields['passengers[adults][$i][gender]'] = adult['gender'];
//       request.fields['passengers[adults][$i][Date of birth]'] =
//           adult['birthdate'];
//       request.fields['passengers[adults][$i][Passport Expiry Date]'] =
//           adult['passport_expiry'];
//       request.fields['passengers[adults][$i][Passport Number]'] =
//           adult['passport_number'];
//       print('in ${request.fields}');
//     }
//     print('out ${request.fields}');
//     // Send request
//     var response = await request.send();

//     if (response.statusCode == 200) {
//       final responseData =
//           await response.stream.bytesToString(); // Decode response
//       print('API Response Data: $responseData');
//       Get.snackbar('Success', 'Forms submitted successfully!');
//     } else {
//       final errorData = await response.stream.bytesToString();
//       print('Error: $errorData');
//       Get.snackbar('Error', 'Failed to submit forms: $errorData');
//     }
//     // } catch (e) {
//     //   print('Exception: $e');
//     //   Get.snackbar('Error', 'An error occurred while submitting the forms');
//     // }
//   }

//   @override
//   void onClose() {
//     // Dispose all controllers
//     passengers['adults']?.forEach((form) {
//       form.forEach((key, controller) {
//         controller.dispose();
//       });
//     });
//     super.onClose();
//   }
// }

// class DynamicFormScreen extends StatelessWidget {
//   final DynamicFormController1 controller = Get.put(DynamicFormController1());

//   DynamicFormScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int adultCount = 3; // Default value
//     controller.initializeForms(adultCount);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dynamic Form'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text('Number of Passengers: $adultCount'),
//               ElevatedButton(
//                 onPressed: () {
//                   adultCount++;
//                   controller.initializeForms(adultCount);
//                 },
//                 child: Text('+'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (adultCount > 1) {
//                     adultCount--;
//                     controller.initializeForms(adultCount);
//                   }
//                 },
//                 child: const Text('-'),
//               ),
//             ],
//           ),
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 itemCount: controller.passengers['adults']!.length,
//                 itemBuilder: (context, index) {
//                   final form = controller.passengers['adults']![index];
//                   return Card(
//                     margin: const EdgeInsets.all(8.0),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text('Passenger ${index + 1}'),
//                           TextField(
//                             controller: form['first_name'],
//                             decoration:
//                                 InputDecoration(labelText: 'First Name'),
//                           ),
//                           TextField(
//                             controller: form['last_name'],
//                             decoration: InputDecoration(labelText: 'Last Name'),
//                           ),
//                           TextField(
//                             controller: form['email'],
//                             decoration: InputDecoration(labelText: 'Email'),
//                             keyboardType: TextInputType.emailAddress,
//                           ),
//                           TextField(
//                             controller: form['phone'],
//                             decoration: InputDecoration(labelText: 'Phone'),
//                             keyboardType: TextInputType.phone,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                           ),
//                           TextField(
//                             controller: form['gender'],
//                             decoration: InputDecoration(labelText: 'Gender'),
//                           ),
//                           TextField(
//                             controller: form['birthdate'],
//                             decoration:
//                                 InputDecoration(labelText: 'Date of Birth'),
//                           ),
//                           TextField(
//                             controller: form['passport_expiry'],
//                             decoration:
//                                 InputDecoration(labelText: 'Passport Expiry'),
//                           ),
//                           TextField(
//                             controller: form['passport_number'],
//                             decoration:
//                                 InputDecoration(labelText: 'Passport Number'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ElevatedButton(
//           onPressed: () => controller.submitFormData(adultCount),
//           child: Text('Submit'),
//         ),
//       ),
//     );
//   }
// }







// class DynamicFormController1 extends GetxController {
//   // Form data structure
//   var passengers = {
//     'adults': [].obs,
//     'children': [].obs,
//     'infants': [].obs,
//   }.obs;

//   //Map<String, dynamic> leadFields = {};
//   Map<String, dynamic> dynamicFields = {};

//   // Initialize form data based on count
//   void initializeForms(int adults, int children, int infants,
//       Map<String, dynamic> lead, Map<String, dynamic> all) {
//     //leadFields = lead;
//     dynamicFields = all;

//     // Generate empty forms based on the count passed
//     passengers['adults']!.value =
//         List.generate(adults, (_) => _generateEmptyForm(all));
//     passengers['children']!.value =
//         List.generate(children, (_) => _generateEmptyForm(all));
//     passengers['infants']!.value =
//         List.generate(infants, (_) => _generateEmptyForm(all));

//     // Debugging logs to check the initialized form lengths
//     print('Adults forms count: ${passengers['adults']!.length}');
//     print('Children forms count: ${passengers['children']!.length}');
//     print('Infants forms count: ${passengers['infants']!.length}');
//   }

//   // Generate an empty form with default values
//   Map<String, dynamic> _generateEmptyForm(Map<String, dynamic> fields) {
//     final form = <String, dynamic>{};
//     fields.forEach((key, value) {
//       form[key] = ''; // Initialize all fields as empty strings
//     });
//     return form;
//   }

//   // Update form data
//   void updateField(String category, int index, String field, dynamic value) {
//     if (passengers[category] != null && passengers[category]!.length > index) {
//       passengers[category]![index][field] = value;
//       print('Updated $category[$index][$field] to: $value'); // Debugging log
//     } else {
//       print(
//           'Error: Unable to update $category[$index][$field]. Category or index out of bounds.');
//     }
//   }

//   // Serialize form data for API submission
//   Map<String, dynamic> prepareSubmissionData() {
//     final Map<String, dynamic> data = {};

//     // Debugging the form processing for each category
//     passengers.forEach((category, forms) {
//       print('Processing category: $category'); // Debugging log
//       print('Number of forms in $category: ${forms.length}'); // Debugging log

//       for (int i = 0; i < forms.length; i++) {
//         // Debugging individual form data before processing
//         print('Processing $category form $i: ${forms[i]}');

//         if (forms[i].isEmpty) {
//           print('Warning: Empty form detected in $category[$i].');
//         }

//         forms[i].forEach((key, value) {
//           // Add form data to submission map
//           data['passengers[$category][$i][$key]'] = value;
//         });
//       }
//     });

//     // Add lead form data to the submission
//     // leadFields.forEach((key, value) {
//     //   data['lead[$key]'] = value;
//     // });

//     print('Serialized Data: $data'); // Debugging log
//     return data;
//   }
// }

// class DynamicFormScreen extends StatelessWidget {
//   final DynamicFormController1 controller = Get.put(DynamicFormController1());

//   DynamicFormScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Example API response fields (this will be dynamic based on the API response)
//     final leadFields = {
//       'Email': '',
//       'Phone': '',
//       'Note': '',
//     };

//     final allFields = {
//       'Gender': '',
//       'First_name': '',
//       'Last_name': '',
//       'Email': '',
//       'Phone': '',
//       'Nationality': '',
//       'Passport Expiry Date': '',
//       'Date of birth': '',
//       'Passport Number': '',
//     };

//     // Example: dynamically updating fields based on API response
//     Future.delayed(Duration.zero, () {
//       controller.initializeForms(1, 0, 0, leadFields, allFields);
//       print('Initial Data: ${controller.passengers}'); // Debugging log
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dynamic Passenger Form'),
//       ),
//       body: Obx(() => SingleChildScrollView(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //_buildLeadForm(),
//                 const Text('Adults',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 _buildCategoryForms('adults'),
//                 const Text('Children',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 _buildCategoryForms('children'),
//                 const Text('Infants',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 _buildCategoryForms('infants'),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       final submissionData = controller.prepareSubmissionData();
//                       print('Final Passengers Data: ${controller.passengers}');
//                       print('Serialized Submission Data: $submissionData');
//                       submitToApi(submissionData);
//                     },
//                     child: Text('Submit'),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

  // Widget _buildLeadForm() {
  //   return
  //    Card(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text('Lead Information',
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //           ...controller.leadFields.entries.map((entry) => Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 8.0),
  //                 child: TextFormField(
  //                   decoration: InputDecoration(labelText: entry.key),
  //                   initialValue: entry.value,
  //                   onChanged: (val) => controller.leadFields[entry.key] = val,
  //                 ),
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }

//   Widget _buildCategoryForms(String category) {
//     return Column(
//       children: List.generate(controller.passengers[category]!.length, (index) {
//         return Card(
//           margin: EdgeInsets.symmetric(vertical: 10),
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               children: controller.passengers[category]![index].entries
//                   .map<Widget>((entry) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(labelText: entry.key),
//                     initialValue: entry.value,
//                     onChanged: (val) =>
//                         controller.updateField(category, index, entry.key, val),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       }),
//     );
//   }

//   // Mock function to simulate API submission
//   void submitToApi(Map<String, dynamic> submissionData) {
//     // Use your preferred HTTP client (e.g., Dio, http) to POST the data
//     print('Submitting to API:');
//     print('Submit to API data: $submissionData');
//     // Example: http.post(url, body: submissionData);
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DynamicFormController extends GetxController {
//   // Form data structure
//   var passengers = {
//     'adults': [].obs,
//     'children': [].obs,
//     'infants': [].obs,
//   }.obs;

//   Map<String, dynamic> leadFields = {};
//   Map<String, dynamic> dynamicFields = {};

//   // Initialize form data based on count
//   void initializeForms(int adults, int children, int infants,
//       Map<String, dynamic> lead, Map<String, dynamic> all) {
//     leadFields = lead;
//     dynamicFields = all;
//     passengers['adults']!.value =
//         List.generate(adults, (_) => _generateEmptyForm(all));
//     passengers['children']!.value =
//         List.generate(children, (_) => _generateEmptyForm(all));
//     passengers['infants']!.value =
//         List.generate(infants, (_) => _generateEmptyForm(all));

//     // Debugging logs
//     print('Initialized adults: ${passengers['adults']!.value}');
//     print('Initialized children: ${passengers['children']!.value}');
//     print('Initialized infants: ${passengers['infants']!.value}');
//   }

//   // Generate an empty form with default values
//   Map<String, dynamic> _generateEmptyForm(Map<String, dynamic> fields) {
//     final form = <String, dynamic>{};
//     fields.forEach((key, value) {
//       form[key] = '';
//     });
//     return form;
//   }

//   // Update form data
//   void updateField(String category, int index, String field, dynamic value) {
//     if (passengers[category] != null && passengers[category]!.length > index) {
//       passengers[category]![index][field] = value;
//       print('Updated $category[$index][$field] to: $value'); // Debugging log
//     } else {
//       print(
//           'Error: Unable to update $category[$index][$field]. Category or index out of bounds.');
//     }
//   }

//   // Serialize form data for API submission
//   Map<String, dynamic> prepareSubmissionData() {
//     final Map<String, dynamic> data = {};
//     passengers.forEach((category, forms) {
//       print('Processing category: $category'); // Debugging log
//       for (int i = 0; i < forms.length; i++) {
//         if (forms[i].isEmpty) {
//           print('Warning: Empty form detected in $category[$i].');
//           // Explicitly serialize empty data if needed
//           forms[i].forEach((key, value) {
//             data['passengers[$category][$i][$key]'] = ''; // Handle empty fields
//           });
//           continue;
//         }
//         print('Processing $category[$i]: ${forms[i]}'); // Debugging log
//         forms[i].forEach((key, value) {
//           data['passengers[$category][$i][$key]'] = value;
//         });
//       }
//     });
//     leadFields.forEach((key, value) {
//       data['lead[$key]'] = value;
//     });
//     print('Serialized Data: $data'); // Debugging log
//     return data;
//   }
// }

// class DynamicFormScreen extends StatelessWidget {
//   final DynamicFormController controller = Get.put(DynamicFormController());

//   DynamicFormScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Example API response fields (this will be dynamic based on the API response)
//     final leadFields = {
//       'Email': '',
//       'Phone': '',
//       'Note': '',
//     };

//     final allFields = {
//       'Gender': '',
//       'First_name': '',
//       'Last_name': '',
//       'Email': '',
//       'Phone': '',
//       'Nationality': '',
//       'Passport Expiry Date': '',
//       'Date of birth': '',
//       'Passport Number': '',
//     };

//     // Example: dynamically updating fields based on API response
//     Future.delayed(Duration.zero, () {
//       controller.initializeForms(1, 1, 1, leadFields, allFields);
//       print('Initial Data: ${controller.passengers}'); // Debugging log
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dynamic Passenger Form'),
//       ),
//       body: Obx(() => SingleChildScrollView(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildLeadForm(),
//                 Text('Adults',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 _buildCategoryForms('adults'),
//                 Text('Children',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 _buildCategoryForms('children'),
//                 Text('Infants',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 _buildCategoryForms('infants'),
//                 SizedBox(height: 20),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       final submissionData = controller.prepareSubmissionData();
//                       print('Final Passengers Data: ${controller.passengers}');
//                       print('Serialized Submission Data: $submissionData');
//                       submitToApi(submissionData);
//                     },
//                     child: Text('Submit'),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

//   Widget _buildLeadForm() {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Lead Information',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ...controller.leadFields.entries.map((entry) => Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(labelText: entry.key),
//                     initialValue: entry.value,
//                     onChanged: (val) => controller.leadFields[entry.key] = val,
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryForms(String category) {
//     return Column(
//       children: List.generate(controller.passengers[category]!.length, (index) {
//         return Card(
//           margin: EdgeInsets.symmetric(vertical: 10),
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               children: controller.passengers[category]![index].entries
//                   .map<Widget>((entry) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(labelText: entry.key),
//                     initialValue: entry.value,
//                     onChanged: (val) =>
//                         controller.updateField(category, index, entry.key, val),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       }),
//     );
//   }

//   // Mock function to simulate API submission
//   void submitToApi(Map<String, dynamic> submissionData) {
//     // Use your preferred HTTP client (e.g., Dio, http) to POST the data
//     print('Submitting to API:');
//     print('Submit to API data ::$submissionData');
//     // Example: http.post(url, body: submissionData);
//   }
// }


