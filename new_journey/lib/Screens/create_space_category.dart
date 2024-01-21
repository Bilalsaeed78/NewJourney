import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/Screens/appartment_screen.dart';
import 'package:new_journey/Screens/office_screen.dart';
import 'package:new_journey/Screens/room_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? selectedCategory;

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
              selectedCategory == 'Room',
              () {
                selectedCategory = 'Room';
              },
            ),
            SizedBox(height: 16),
            _buildCategoryButton(
              'Office',
              Icons.work,
              Color.fromARGB(255, 156, 111, 95),
              Color.fromARGB(255, 156, 111, 95),
              selectedCategory == 'Office',
              () {
                selectedCategory = 'Office';
              },
            ),
            SizedBox(height: 16),
            _buildCategoryButton(
              'Apartment',
              Icons.home,
              Color.fromARGB(255, 156, 111, 95),
              Color.fromARGB(255, 156, 111, 95),
              selectedCategory == 'Apartment',
              () {
                selectedCategory = 'Apartment';
              },
            ),
            SizedBox(height: 42),
            ElevatedButton(
              onPressed: () {
                if (selectedCategory == 'Room') {
                  Get.to(() => RoomScreen());
                } else if (selectedCategory == 'Office') {
                  Get.to(() => OfficeScreen());
                } else if (selectedCategory == 'Apartment') {
                  Get.to(() => ApartmentScreen()); // Navigate to ApartmentScreen
                } else {
                  // Handle other categories if needed
                }
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
    bool isSelected,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          onTap();
        });
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 115, vertical: 12),
        primary: isSelected ? Color.fromARGB(255, 67, 38, 4) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: isSelected ? Colors.white : iconColor),
          SizedBox(width: 8),
          Text(
            category,
            style: TextStyle(color: isSelected ? Colors.white : textColor),
          ),
        ],
      ),
    );
  }
}
