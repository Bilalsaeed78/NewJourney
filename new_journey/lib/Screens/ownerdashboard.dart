import 'package:flutter/material.dart';
import 'package:new_journey/Screens/drawer.dart';
import 'package:new_journey/controllers/controllers.dart';

class OwnerDashboard extends StatelessWidget {
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Dashboard'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Welcome to the Owner Dashboard'),
      ),
    );
  }
}
