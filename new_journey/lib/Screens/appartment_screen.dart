import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/Screens/location_picker.dart';
import 'package:new_journey/Screens/ownerdashboard.dart';
import 'package:new_journey/controllers/appartment_controller.dart';

class ApartmentScreen extends StatefulWidget {
  const ApartmentScreen({Key? key}) : super(key: key);

  @override
  _ApartmentScreenState createState() => _ApartmentScreenState();
}

class _ApartmentScreenState extends State<ApartmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController roomsController = TextEditingController();
  final TextEditingController liftController = TextEditingController();
  final TextEditingController generatorController = TextEditingController();

  final ApartmentController apartmentController =
      Get.put(ApartmentController());

  double? ownerLatitude;
  double? ownerLongitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Apartment Screen",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
                  controller: floorController,
                  labelText: 'Enter Floor',
                  keyboardType: TextInputType.number,
                ),
                _buildTextField(
                  controller: roomsController,
                  labelText: 'Enter Rooms',
                  keyboardType: TextInputType.number,
                ),
                _buildTextField(
                  controller: liftController,
                  labelText: 'Lift Availability',
                ),
                _buildTextField(
                  controller: generatorController,
                  labelText: 'Generator Backup',
                ),
                const SizedBox(height: 1),
                _buildElevatedButton(
                  label: 'Get Location',
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
                ),
                SizedBox(height: 5),
                _buildElevatedButton(
                  label: 'Upload',
                  onPressed: () {
                    _uploadApartment();
                  },
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
          labelStyle: TextStyle(color: Colors.black),
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

  Widget _buildElevatedButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        primary: Colors.black,
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> _uploadApartment() async {
    if (_formKey.currentState?.validate() ?? false) {
      final title = titleController.text;
      final description = descriptionController.text;
      final price = priceController.text;
      final phoneNumber = phoneNumberController.text;
      final floor = floorController.text;
      final rooms = roomsController.text;
      final liftAvailability = liftController.text;
      final generatorBackup = generatorController.text;

      try {
        final location = ownerLatitude != null && ownerLongitude != null
            ? "Lat: $ownerLatitude, Long: $ownerLongitude"
            : null;

        await apartmentController.uploadApartment(
          title: title,
          description: description,
          price: price,
          location: location,
          phoneNumber: phoneNumber,
          floor: floor,
          rooms: rooms,
          liftAvailability: liftAvailability,
          generatorBackup: generatorBackup,
        );

        Get.snackbar('Success', 'Apartment uploaded successfully');

        await Future.delayed(const Duration(seconds: 2));

        Get.to(() => OwnerDashboard());
      } catch (error) {
        Get.snackbar('Error', 'Failed to upload apartment: $error');
      }
    }
  }
}