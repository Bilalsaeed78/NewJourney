import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/routes/routes.dart';
import '../controllers/validation_helper.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String userType = "guest";
  bool isOwnerFieldsVisible = false;

  final controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  bool isRegistrationButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Image.asset(
                  'assets/newjourney.png',
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.nameController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    return ValidationHelper.validateName(value);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.emailController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    return ValidationHelper.validateEmail(value);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    return ValidationHelper.validatePassword(value);
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Radio(
                      value: "guest",
                      groupValue: userType,
                      onChanged: (value) {
                        setState(() {
                          userType = value.toString();
                          isOwnerFieldsVisible = false;
                        });
                      },
                    ),
                    const Text('Guest'),
                    const SizedBox(width: 16),
                    Radio(
                      value: "owner",
                      groupValue: userType,
                      onChanged: (value) {
                        setState(() {
                          userType = value.toString();
                          isOwnerFieldsVisible = true;
                        });
                      },
                    ),
                    const Text('Owner'),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.cnicController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: "CNIC",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.credit_card, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    return ValidationHelper.validateCnic(value, userType);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.phoneNumberController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.phone, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    setState(() {
      isRegistrationButtonClicked = true;
    });

    String role = isOwnerFieldsVisible ? "owner" : "guest";

    if (_formKey.currentState!.validate()) {
      await controller.registerUser(
        name: controller.nameController.text,
        email: controller.emailController.text,
        password: controller.passwordController.text,
        cnic: controller.cnicController.text,
        phoneNumber: controller.phoneNumberController.text,
        role: role,
      );
      // Navigate to the login screen or any other screen after registration
      // Example: Get.offAll(LoginScreen());
      RouteManager.goToLogin();
    }
  }
}