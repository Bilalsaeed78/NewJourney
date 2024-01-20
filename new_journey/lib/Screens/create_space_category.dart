import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/Screens/room_screen.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCategoryButton(
              'Room',
              Icons.hotel,
              Color.fromARGB(255, 156, 111, 95),
              Color.fromARGB(255, 156, 111, 95),
              () {
                Get.to(() => RoomScreen());
              },
            ),
            SizedBox(height: 16),
            _buildCategoryButton(
              'Office',
              Icons.work,
              Color.fromARGB(255, 156, 111, 95),
              Color.fromARGB(255, 156, 111, 95),
              () {
                // Get.to(() => OfficeScreen());
              },
            ),
            SizedBox(height: 16),
            _buildCategoryButton(
              'Stay',
              Icons.home,
              Color.fromARGB(255, 156, 111, 95),
              Color.fromARGB(255, 156, 111, 95),
              () {
                // Get.to(() => StayScreen());
              },
            ),
            SizedBox(height: 42),
            ElevatedButton(
              onPressed: () {
                // Handle the continue button action if needed
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 67, 38, 4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
    String category,
    IconData icon,
    Color iconColor,
    Color textColor,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 115, vertical: 12),
        primary: null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: iconColor),
          SizedBox(width: 8),
          Text(
            category,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
