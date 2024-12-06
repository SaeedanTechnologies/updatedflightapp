import 'package:flightbooking/app/modules/flight/addPassenger/controllers/dynamic_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicForm extends GetView<DynamicFormController> {
  // Make controller optional
  final Map<String, dynamic> formData;

  // Constructor without the 'required' keyword for the controller
  const DynamicForm({required this.formData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract and cast 'lead' and 'all' sections from the API response
    final Map<String, dynamic> lead =
        Map<String, dynamic>.from(formData['data']['passsengersForm']['lead']);
    final Map<String, dynamic> all =
        Map<String, dynamic>.from(formData['data']['passsengersForm']['all']);

    // Combine 'lead' and 'all' sections
    final combinedSections = {
      ...lead,
      ...all,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: combinedSections.entries.map<Widget>((entry) {
              final fieldKey = entry.key;
              final fieldData = entry.value[0]; // Access the field definition
              return _buildFormField(context, fieldKey, fieldData);
            }).toList(),
          ),
        ),
      ),
    );
  }

  // Helper method to build form fields based on their type
  Widget _buildFormField(
      BuildContext context, String fieldKey, Map<String, dynamic> fieldData) {
    final fieldType = fieldData['type'];
    final caption = fieldData['caption'] ?? '';
    final items = fieldData['items'];
    final isOptional = fieldData['optional'] ?? false;

    switch (fieldType) {
      case 'text':
        return _buildTextField(caption, isOptional);
      case 'email':
        return _buildTextField(caption, isOptional,
            inputType: TextInputType.emailAddress);
      case 'phone':
        return _buildTextField(caption, isOptional,
            inputType: TextInputType.phone);
      case 'select':
        return _buildDropdownField(caption, items);
      case 'birthdate':
      case 'expirydate':
        return _buildDatePickerField(context, caption, fieldKey);
      default:
        return const SizedBox.shrink(); // Empty space for unsupported types
    }
  }

  Widget _buildTextField(String caption, bool isOptional,
      {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller?.textEditingControllers[caption],
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: caption,
          border: const OutlineInputBorder(),
          suffixText: isOptional ? "(Optional)" : null,
        ),
        validator: isOptional
            ? null
            : (value) {
                if (value == null || value.isEmpty) {
                  return "$caption is required";
                }
                return null;
              },
      ),
    );
  }

  Widget _buildDropdownField(String caption, Map<String, dynamic>? items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: caption,
          border: const OutlineInputBorder(),
        ),
        items: items?.entries.map<DropdownMenuItem<String>>((entry) {
          return DropdownMenuItem(
            value: entry.key,
            child: Text(entry.value),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildDatePickerField(
      BuildContext context, String caption, String fieldKey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (selectedDate != null && controller != null) {
            controller!.setDateValue(fieldKey, selectedDate);
          }
        },
        child: TextFormField(
          controller: controller?.textEditingControllers[fieldKey],
          readOnly: true, // Make the field read-only to prevent manual input
          decoration: InputDecoration(
            labelText: caption,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
