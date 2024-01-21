import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/Screens/location_picker.dart';
import 'package:new_journey/controllers/office%20controller.dart';

class OfficeScreen extends StatefulWidget {
  const OfficeScreen({Key? key}) : super(key: key);

  @override
  _OfficeScreenState createState() => _OfficeScreenState();
}

class _OfficeScreenState extends State<OfficeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController wifiController = TextEditingController();
  final TextEditingController acController = TextEditingController();
  final TextEditingController cabinsController = TextEditingController();

  final OfficeController officeController = Get.put(OfficeController());

  double? ownerLatitude;
  double? ownerLongitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Office Screen"),
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
                  keyboardType: TextInputType.number,
                ),
                _buildTextField(
                  controller: phoneNumberController,
                  labelText: 'Enter Phone Number',
                  keyboardType: TextInputType.phone,
                ),
                _buildTextField(
                  controller: wifiController,
                  labelText: 'WiFi Availability',
                ),
                _buildTextField(
                  controller: acController,
                  labelText: 'Centralized AC Availability',
                ),
                _buildTextField(
                  controller: cabinsController,
                  labelText: 'Cabins Availability',
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    var result = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MyLocationPickerDialog();
                      },
                    );
                    if (result != null) {
                      print('Latitude: ${result[0]}');
                      print('Longitude: ${result[1]}');
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
                    _uploadOffice();
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
  Future<void> _uploadOffice() async {
    if (_formKey.currentState?.validate() ?? false) {
      final title = titleController.text;
      final description = descriptionController.text;
      final price = priceController.text;
      final phoneNumber = phoneNumberController.text;
      final wifiAvailability = wifiController.text;
      final acAvailability = acController.text;
      final cabinsAvailability = cabinsController.text;

      try {
        final location = ownerLatitude != null && ownerLongitude != null
            ? "Lat: $ownerLatitude, Long: $ownerLongitude"
            : null;

        await officeController.uploadOffice(
          title: title,
          description: description,
          price: price,
          location: location,
          phoneNumber: phoneNumber,
          wifiAvailability: wifiAvailability,
          acAvailability: acAvailability,
          cabinsAvailability: cabinsAvailability,
        );

        Get.snackbar('Success', 'Office uploaded successfully');
      } catch (error) {
        Get.snackbar('Error', 'Failed to upload office: $error');
      }
    }
  }
}

