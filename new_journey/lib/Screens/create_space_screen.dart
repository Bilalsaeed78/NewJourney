import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/controllers/create_space_controller.dart';
import 'package:new_journey/screens/location_picker.dart';

class CreateSpaceScreen extends StatefulWidget {
  final String category;

  const CreateSpaceScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CreateSpaceScreenState createState() => _CreateSpaceScreenState();
}

class _CreateSpaceScreenState extends State<CreateSpaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController additionalField1Controller = TextEditingController();
  final TextEditingController additionalField2Controller = TextEditingController();
  final CreateSpaceController createSpaceController = Get.put(CreateSpaceController());

  double? ownerLatitude;
  double? ownerLongitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create ${widget.category}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                  controller: titleController,
                  labelText: 'Enter Title',
                ),
                _buildTextField(
                  controller: descriptionController,
                  labelText: 'Enter Description',
                ),
                _buildTextField(
                  controller: priceController,
                  labelText: 'Enter Price',
                ),
                _buildTextField(
                  controller: phoneNumberController,
                  labelText: 'Enter Phone Number',
                ),
                if (widget.category == 'Room') ...[
                  _buildTextField(
                    controller: additionalField1Controller,
                    labelText: 'Wi-Fi',
                  ),
                  _buildTextField(
                    controller: additionalField2Controller,
                    labelText: 'Generator Backup',
                  ),
                ],
                if (widget.category == 'Office') ...[
                  _buildTextField(
                    controller: additionalField1Controller,
                    labelText: 'Centralized AC',
                  ),
                  _buildTextField(
                    controller: additionalField2Controller,
                    labelText: 'Standby Generator',
                  ),
                ],
                if (widget.category == 'Stay') ...[
                  _buildTextField(
                    controller: additionalField1Controller,
                    labelText: 'Floor Number',
                    keyboardType: TextInputType.number,
                  ),
                  _buildTextField(
                    controller: additionalField2Controller,
                    labelText: 'Room Count',
                    keyboardType: TextInputType.number,
                  ),
                ],
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // Handle location or other specific details based on the category
                    var result = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MyLocationPickerDialog();
                      },
                    );
                    if (result != null) {
                      print(result[0]);
                      print(result[1]);
                      setState(() {
                        ownerLatitude = result[0];
                        ownerLongitude = result[1];
                      });
                    } else {
                      print('Dialog closed without a result');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: const Center(
                      child: Text(
                        "Get Location",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    _uploadSpace();
                  },
                  child: const Text('Upload'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Future<void> _uploadSpace() async {
    if (_formKey.currentState?.validate() ?? false) {
      final title = titleController.text;
      final description = descriptionController.text;
      final price = priceController.text;
      final phoneNumber = phoneNumberController.text;
      final additionalField1 = additionalField1Controller.text;
      final additionalField2 = additionalField2Controller.text;

      try {
        final location = ownerLatitude != null && ownerLongitude != null
            ? "Lat: $ownerLatitude, Long: $ownerLongitude"
            : null;

        // Example: Call the backend or handle the data based on the category
        await createSpaceController.uploadSpace(
          category: widget.category,
          title: title,
          description: description,
          price: price,
          location: location,
          phoneNumber: phoneNumber,
          additionalField1: additionalField1,
          additionalField2: additionalField2,
        );

        Get.snackbar('Success', '${widget.category} uploaded successfully');
      } catch (error) {
        Get.snackbar('Error', 'Failed to upload ${widget.category}: $error');
      }
    }
  }
}
