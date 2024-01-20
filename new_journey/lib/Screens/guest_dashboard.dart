// import 'package:flutter/material.dart';
// import 'package:new_journey/Screens/drawer.dart';
// import 'package:new_journey/controllers/controllers.dart';

// class UserDashboard extends StatefulWidget {
//   const UserDashboard({Key? key}) : super(key: key);

//   @override
//   _UserDashboardState createState() => _UserDashboardState();
// }

// class _UserDashboardState extends State<UserDashboard> {
//   String selectedCategory = 'Room';

//   final authController = AuthController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Dashboard'),
//       ),
//       drawer: AppDrawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Container(
//             //   margin: const EdgeInsets.all(26.0),
//             //   child: InkWell(
//             //     onTap: () {
//             //       authController.logout();
//             //     },
//             //     child: Text(
//             //       authController.cacheManager.getUserType().toString(),
//             //       style: TextStyle(
//             //         fontSize: 24.0,
//             //         fontWeight: FontWeight.bold,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             // Search Bar with Filter Options
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       width: 240, // Adjust the width as needed
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: 'Search for accommodations...',
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.filter_list),
//                             onPressed: () {
//                               // Handle filter button press
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // "Rooms Near You" Container
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Rooms Near You',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             // Category Row
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   _buildCategory('Room'),
//                   _buildCategory('Office'),
//                   _buildCategory('Stay'),
//                 ],
//               ),
//             ),
//             // Display Different Cards Based on the Selected Category
//             if (selectedCategory == 'Room')
//               Column(
//                 children: [
//                   _buildRoomCard(
//                     imageUrl: 'assets/roomimg.jpg',
//                     cardTitle: 'Room Card 1',
//                   ),
//                   _buildRoomCard(
//                     imageUrl: 'assets/room.jpg',
//                     cardTitle: 'Room Card 2',
//                   ),
//                   _buildRoomCard(
//                     imageUrl: 'assets/roomimg.jpg',
//                     cardTitle: 'Room Card 3',
//                   ),
//                 ],
//               ),
//             if (selectedCategory == 'Office')
//               _buildOfficeCard(
//                 imageUrl: 'assets/officespace.jpg',
//                 cardTitle: 'Office Card 1',
//               ),
//             if (selectedCategory == 'Stay')
//               _buildStayCard(
//                 imageUrl: 'assets/appartment.jpg',
//                 cardTitle: 'Stay Card 1',
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCategory(String category) {
//     final isActive = category == selectedCategory;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedCategory = category;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//         decoration: BoxDecoration(
//           color: isActive ? Colors.blue : Colors.grey,
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Text(
//           category,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRoomCard({
//     required String imageUrl,
//     required String cardTitle,
//   }) {
//     return Card(
//       margin: const EdgeInsets.all(16.0),
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16.0),
//               topRight: Radius.circular(16.0),
//             ),
//             child: Image.asset(
//               imageUrl,
//               height: 150.0,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   cardTitle,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Room details here',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Price: \$100/night',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildOfficeCard({
//     required String imageUrl,
//     required String cardTitle,
//   }) {
//     return Card(
//       margin: const EdgeInsets.all(16.0),
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16.0),
//               topRight: Radius.circular(16.0),
//             ),
//             child: Image.asset(
//               imageUrl,
//               height: 150.0,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   cardTitle,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Office details here',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Rent: \$500/month',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStayCard({
//     required String imageUrl,
//     required String cardTitle,
//   }) {
//     return Card(
//       margin: const EdgeInsets.all(16.0),
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16.0),
//               topRight: Radius.circular(16.0),
//             ),
//             child: Image.asset(
//               imageUrl,
//               height: 150.0,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   cardTitle,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Stay details here',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Price: \$75/night',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:new_journey/Screens/drawer.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/controllers/room_controller.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  String selectedCategory = 'Room';

  final authController = AuthController();
  final roomController = RoomController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Check if the user is logged in as a guest
    final userRole = authController.cacheManager.getUserDetails()?['role'];
    if (userRole == 'guest') {
      // If logged in as a guest, fetch rooms after 2 seconds
      Future.delayed(Duration(seconds: 2), () {
        _fetchRooms();
      });
    } else {
      _fetchRooms(); // Fetch rooms immediately for other roles
    }
  }

  // Function to fetch rooms and update the loading state
  Future<void> _fetchRooms() async {
    try {
      await roomController.fetchRooms();
    } catch (e) {
      print('Error fetching rooms: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: 240,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for accommodations...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.filter_list),
                            onPressed: () {
                              // Handle filter button press
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Rooms Near You',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildCategory('Room'),
                  _buildCategory('Office'),
                  _buildCategory('Stay'),
                ],
              ),
            ),
            // Use CircularProgressIndicator while loading
            if (isLoading)
              CircularProgressIndicator()
            else
              _buildRoomsSection(),
          ],
        ),
      ),
    );
  }

  // Build the rooms section based on the selected category
  Widget _buildRoomsSection() {
    // Display your rooms based on the selected category
    if (selectedCategory == 'Room') {
      return _buildRoomList();
    } else if (selectedCategory == 'Office') {
      return _buildOfficeCard();
    } else if (selectedCategory == 'Stay') {
      return _buildStayCard();
    } else {
      return Text('Invalid category');
    }
  }

  Widget _buildCategory(String category) {
    final isActive = category == selectedCategory;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildRoomList() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: roomController.rooms.length,
          itemBuilder: (context, index) {
            final room = roomController.rooms[index];
            return _buildRoomCard(
              imageUrl: 'assets/roomimg.jpg',
              cardTitle: room.title,
              roomDetails: room.description,
              price: room.price,
              wifiAvailability: room.wifiAvailability,
              generatorBackup: room.generatorBackup,
            );
          },
        ),
      ],
    );
  }

  Widget _buildRoomCard({
    required String imageUrl,
    required String cardTitle,
    required String roomDetails,
    required String price,
    required String wifiAvailability,
    required String generatorBackup,
  }) {
    bool isWifiAvailable = wifiAvailability.toLowerCase() == 'yes';
    bool isGeneratorAvailable = generatorBackup.toLowerCase() == 'yes';

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.asset(
              imageUrl,
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cardTitle,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  roomDetails,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Price: $price/night',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'WiFi: ${isWifiAvailable ? 'Available' : 'Not Available'}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Generator: ${isGeneratorAvailable ? 'Available' : 'Not Available'}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfficeCard() {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.asset(
              'assets/officespace.jpg',
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Office Card 1',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Office details here',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Rent: \$500/month',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStayCard() {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.asset(
              'assets/appartment.jpg',
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Stay Card 1',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Stay details here',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Price: \$75/night',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
