import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:new_journey/Screens/location_picker.dart';
import 'package:new_journey/Themes/colors.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/routes/routes.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String userType = "buyer";
  bool isOwnerFieldsVisible = false;
  File? studentCardImage;
  double? ownerLatitude;
  double? ownerLongitude;

  String? cnicErrorText;
  String? emailErrorText;
  String? passwordErrorText;
  final controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final position = await _getCurrentPosition();
    if (position != null) {
      setState(() {
        ownerLatitude = position.latitude;
        ownerLongitude = position.longitude;
        controller.locationController.text =
            "Lat: $ownerLatitude, Long: $ownerLongitude";
      });
    }
  }

  void register() {
    // if (_validateFields()) {
    // Perform registration logic here
    // Access the entered data using your controllers (e.g., nameController.text, emailController.text, etc.)
    controller.SignUp(
        controller.emailController.text, controller.passwordController.text);

    RouteManager
        .goToLogin(); // Navigate to the landing page using the RouteManager
    // }
  }

  void onUserTypeChanged(String? value) {
    if (value != null) {
      setState(() {
        userType = value;
        isOwnerFieldsVisible =
            value == "owner"; // Show owner fields when the user selects "Owner"
      });
    }
  }

  bool _validateFields() {
    bool isValid = true;
    cnicErrorText = null;
    emailErrorText = null;
    passwordErrorText = null;

    if (controller.nameController.text.isEmpty) {
      isValid = false;
    }

    if (controller.emailController.text.isEmpty) {
      isValid = false;
      emailErrorText = "Email is required";
    }

    if (controller.passwordController.text.isEmpty) {
      isValid = false;
      passwordErrorText = "Password is required";
    }

    if (userType == "owner" && controller.cnicController.text.isEmpty) {
      isValid = false;
      cnicErrorText = "CNIC is required for owners";
    }

    if (userType == "owner" && controller.locationController.text.isEmpty) {
      isValid = false;
    }

    if (userType == "buyer" && studentCardImage == null) {
      isValid = false;
    }

    setState(() {});
    return isValid;
  }

  Future<Position?> _getCurrentPosition() async {
    try {
      final status = await Geolocator.requestPermission();
      if (status == LocationPermission.denied) {
        return null;
      }
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Image.asset(
                'assets/fyplogo.png',
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                "Create Your Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.nameController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
              ),
              if (controller.nameController.text.isEmpty)
                Text(
                  "Name is required",
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
              ),
              if (controller.emailController.text.isEmpty)
                Text(
                  emailErrorText ?? "Email is required",
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
              ),
              if (controller.passwordController.text.isEmpty)
                Text(
                  passwordErrorText ?? "Password is required",
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16),
              Row(
                children: [
                  Radio(
                    value: "buyer",
                    groupValue: userType,
                    onChanged: onUserTypeChanged,
                  ),
                  Text("Buyer", style: TextStyle(color: Colors.black)),
                  Radio(
                    value: "owner",
                    groupValue: userType,
                    onChanged: onUserTypeChanged,
                  ),
                  Text("Owner", style: TextStyle(color: Colors.black)),
                ],
              ),
              Visibility(
                visible: isOwnerFieldsVisible,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.cnicController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "CNIC",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon:
                            Icon(Icons.credit_card, color: Colors.black),
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
                    if (controller.cnicController.text.isEmpty)
                      Text(
                        cnicErrorText ?? "CNIC is required for owners",
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.phoneNumberController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
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
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        var result = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return MyLocationPickerDialog();
                          },
                        );

                        if (result != null) {
                          print(result[0]);
                          print(result[1]);
                          controller.locationController.text =
                              "Lat: ${result[0]}, Long: ${result[1]}";
                        } else {
                          print('Dialog closed without a result');
                        }
                      },
                      child: Text("Get Location"),
                    ),
                    if (controller.locationController.text.isEmpty)
                      Text(
                        "Location is required for owners",
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              Visibility(
                visible: userType == "buyer",
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    TextFormField(
                      controller: controller.studentCardController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Student Card",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon:
                            Icon(Icons.credit_card, color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.image),
                          onPressed: () {},
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';
// import 'package:geolocator/geolocator.dart';
// import 'package:new_journey/Screens/location_picker.dart';
// import 'package:new_journey/Themes/colors.dart';
// import 'package:new_journey/controllers/controllers.dart';
// import 'package:new_journey/routes/routes.dart';

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   String userType = "buyer";
//   bool isOwnerFieldsVisible = false;
//   File? studentCardImage;
//   double? ownerLatitude;
//   double? ownerLongitude;

//   final controller = Get.put(AuthController());

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     final position = await _getCurrentPosition();
//     if (position != null) {
//       setState(() {
//         ownerLatitude = position.latitude;
//         ownerLongitude = position.longitude;
//         controller.locationController.text =
//             "Lat: $ownerLatitude, Long: $ownerLongitude";
//       });
//     }
//   }

//   void register() {
//     if (_validateFields()) {
//       controller.SignUp(
//           controller.emailController.text, controller.passwordController.text);
//       RouteManager.goToLogin();
//     }
//   }

//   void onUserTypeChanged(String? value) {
//     if (value != null) {
//       setState(() {
//         userType = value;
//         isOwnerFieldsVisible = value == "owner";
//       });
//     }
//   }

//   bool _validateFields() {
//     bool isValid = true;

//     if (controller.nameController.text.isEmpty) {
//       isValid = false;
//     }

//     if (controller.emailController.text.isEmpty) {
//       isValid = false;
//       controller.emailErrorText = "Email is required";
//     } else {
//       controller.emailErrorText = null;
//     }

//     if (controller.passwordController.text.isEmpty) {
//       isValid = false;
//       controller.passwordErrorText = "Password is required";
//     } else {
//       controller.passwordErrorText = null;
//     }

//     if (userType == "owner") {
//       if (controller.cnicController.text.isEmpty) {
//         isValid = false;
//         controller.cnicErrorText = "CNIC is required for owners";
//       } else {
//         controller.cnicErrorText = null;
//       }

//       if (controller.locationController.text.isEmpty) {
//         isValid = false;
//       }
//     } else {
//       controller.cnicErrorText = null;
//       controller.locationController.text = "";
//     }

//     if (userType == "buyer" && studentCardImage == null) {
//       isValid = false;
//     }

//     setState(() {});
//     return isValid;
//   }

//   Future<Position?> _getCurrentPosition() async {
//     try {
//       final status = await Geolocator.requestPermission();
//       if (status == LocationPermission.denied) {
//         return null;
//       }
//       final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       return position;
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondary,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               SizedBox(height: 20.0),
//               Image.asset(
//                 'assets/fyplogo.png',
//                 width: 200,
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Create Your Account",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: primary,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: controller.nameController,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   labelText: "Name",
//                   labelStyle: TextStyle(color: Colors.black),
//                   prefixIcon: Icon(Icons.person, color: Colors.black),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               if (controller.nameController.text.isEmpty)
//                 Text(
//                   "Name is required",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: controller.emailController,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   labelStyle: TextStyle(color: Colors.black),
//                   prefixIcon: Icon(Icons.email, color: Colors.black),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Email is required";
//                   }
//                   return null;
//                 },
//               ),
//               if (controller.emailController.text.isEmpty)
//                 Text(
//                   controller.emailErrorText ?? "",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: controller.passwordController,
//                 obscureText: true,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   labelStyle: TextStyle(color: Colors.black),
//                   prefixIcon: Icon(Icons.lock, color: Colors.black),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Password is required";
//                   }
//                   return null;
//                 },
//               ),
//               if (controller.passwordController.text.isEmpty)
//                 Text(
//                   controller.passwordErrorText ?? "",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               SizedBox(height: 16),
//               Row(
//                 children: [
//                   Radio(
//                     value: "buyer",
//                     groupValue: userType,
//                     onChanged: onUserTypeChanged,
//                   ),
//                   Text("Buyer", style: TextStyle(color: Colors.black)),
//                   Radio(
//                     value: "owner",
//                     groupValue: userType,
//                     onChanged: onUserTypeChanged,
//                   ),
//                   Text("Owner", style: TextStyle(color: Colors.black)),
//                 ],
//               ),
//               Visibility(
//                 visible: isOwnerFieldsVisible,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 16),
//                     TextFormField(
//                       controller: controller.cnicController,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         labelText: "CNIC",
//                         labelStyle: TextStyle(color: Colors.black),
//                         prefixIcon: Icon(Icons.credit_card, color: Colors.black),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "CNIC is required for owners";
//                         }
//                         return null;
//                       },
//                     ),
//                     if (controller.cnicController.text.isEmpty)
//                       Text(
//                         controller.cnicErrorText ?? "",
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       controller: controller.phoneNumberController,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         labelText: "Phone Number",
//                         labelStyle: TextStyle(color: Colors.black),
//                         prefixIcon: Icon(Icons.phone, color: Colors.black),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () async {
//                         var result = await showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return MyLocationPickerDialog();
//                           },
//                         );

//                         if (result != null) {
//                           print(result[0]);
//                           print(result[1]);
//                           controller.locationController.text =
//                               "Lat: ${result[0]}, Long: ${result[1]}";
//                         } else {
//                           print('Dialog closed without a result');
//                         }
//                       },
//                       child: Text("Get Location"),
//                     ),
//                     if (controller.locationController.text.isEmpty)
//                       Text(
//                         "Location is required for owners",
//                         style: TextStyle(color: Colors.red),
//                       ),
//                   ],
//                 ),
//               ),
//               Visibility(
//                 visible: userType == "buyer",
//                 child: Column(
//                   children: [
//                     SizedBox(height: 16),
//                     TextFormField(
//                       controller: controller.studentCardController,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         labelText: "Student Card",
//                         labelStyle: TextStyle(color: Colors.black),
//                         prefixIcon: Icon(Icons.credit_card, color: Colors.black),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.image),
//                           onPressed: () {},
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: register,
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.blue,
//                 ),
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
