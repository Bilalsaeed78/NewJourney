// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_journey/Screens/custom_search.dart';
// import 'package:new_journey/Screens/drawer.dart';
// import 'package:new_journey/controllers/appartment_controller.dart';
// import 'package:new_journey/controllers/controllers.dart';
// import 'package:new_journey/controllers/office%20controller.dart';
// import 'package:new_journey/controllers/room_controller.dart';
// import 'package:new_journey/models/aparmentmodels.dart';
// import 'package:new_journey/models/officemodels.dart';
// import 'package:new_journey/models/roommodels.dart';

// import '../controllers/search_controller.dart';

// class UserDashboard extends StatefulWidget {
//   const UserDashboard({Key? key}) : super(key: key);

//   @override
//   _UserDashboardState createState() => _UserDashboardState();
// }

// class _UserDashboardState extends State<UserDashboard> {
//   final authController = AuthController();
//   final roomController = RoomController();
//   final officeController = OfficeController();
//   final apartmentController = ApartmentController();

//   String selectedCategory = 'Room';
//   bool isLoading = true;
//   bool searchLoading = true;
//   final controller = TextEditingController();
//   final searchController = Get.put(QuerySearchController());

//   @override
//   void initState() {
//     super.initState();

//     final userRole = authController.cacheManager.getUserDetails()?['role'];
//     if (userRole == 'guest') {
//       Future.delayed(Duration(seconds: 2), () {
//         _fetchRooms();
//         _fetchOffices();
//         _fetchApartments();
//       });
//     } else {
//       print("there is some error");
//       // _fetchRooms();
//       // _fetchOffices();
//       // _fetchApartments();
//     }
//   }

//   Future<void> _fetchRooms() async {
//     try {
//       await roomController.fetchRooms();
//     } catch (e) {
//       print('Error fetching rooms: $e');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   Future<void> _fetchOffices() async {
//     try {
//       await officeController.fetchOffices();
//     } catch (e) {
//       print('Error fetching offices: $e');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   Future<void> _fetchApartments() async {
//     try {
//       await apartmentController.fetchApartments();
//     } catch (e) {
//       print('Error fetching apartments: $e');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

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
//             Container(margin: const EdgeInsets.all(8) ,child: CustomSearchWidget(onFieldSubmit: (val){
//               if(selectedCategory == 'Room'){

// searchController.searchRoom(val, roomController);
//               }
//               else if(selectedCategory == 'Apartment'){
// searchController.searchApartment(val, apartmentController);
//               }
//               else{
// searchController.searchOffice(val, officeController);
//               }
//             },)),
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
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   _buildCategory('Room', Icons.hotel),
//                   _buildCategory('Office', Icons.work),
//                   _buildCategory('Apartment', Icons.home),
//                 ],
//               ),
//             ),
//             if (isLoading)
//               CircularProgressIndicator()

//             else
//               _buildRoomsSection(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRoomsSection() {
//     if (selectedCategory == 'Room') {
//       return _buildRoomList(roomController.rooms);
//     } else if (selectedCategory == 'Office') {
//       return _buildOfficeCard(officeController.offices);
//     } else if (selectedCategory == 'Apartment') {
//       return _buildApartmentsSection(apartmentController.apartments);
//     } else {
//       return Text('Invalid category');
//     }
//   }

//   Widget _buildCategory(String category, IconData icon) {
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
//         child: Row(
//           children: [
//             Icon(icon, color: Colors.white),
//             SizedBox(width: 8),
//             Text(
//               category,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRoomList(RxList<Room> rooms) {
//     return Column(
//       children: [
//         ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: roomController.rooms.length,
//           itemBuilder: (context, index) {
//             final room = roomController.rooms[index];
//             return _buildRoomCard(
//               imageUrl: 'assets/roomimg.jpg',
//               cardTitle: room.title,
//               roomDetails: room.description,
//               price: room.price,
//               wifiAvailability: room.wifiAvailability,
//               generatorBackup: room.generatorBackup,
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildRoomCard({
//     required String imageUrl,
//     required String cardTitle,
//     required String roomDetails,
//     required String price,
//     required String wifiAvailability,
//     required String generatorBackup,
//   }) {
//     bool isWifiAvailable = wifiAvailability.toLowerCase() == 'yes';
//     bool isGeneratorAvailable = generatorBackup.toLowerCase() == 'yes';

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
//                   roomDetails,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Price: $price/night',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.wifi,
//                       color: isWifiAvailable ? Colors.green : Colors.red,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'WiFi: ${isWifiAvailable ? 'Available' : 'Not Available'}',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.local_fire_department,
//                       color: isGeneratorAvailable ? Colors.green : Colors.red,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'Generator: ${isGeneratorAvailable ? 'Available' : 'Not Available'}',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildOfficeCard(RxList<Office> offices) {
//     return Column(
//       children: [
//         ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: officeController.offices.length,
//           itemBuilder: (context, index) {
//             final office = officeController.offices[index];
//             return _buildOfficeCardWidget(
//               imageUrl: 'assets/officespace.jpg',
//               cardTitle: office.title,
//               officeDetails: office.description,
//               price: office.price,
//               wifiAvailability: office.wifiAvailability,
//               acAvailability: office.acAvailability,
//               cabinsAvailability: office.cabinsAvailability,
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildOfficeCardWidget({
//     required String imageUrl,
//     required String cardTitle,
//     required String officeDetails,
//     required String price,
//     required String wifiAvailability,
//     required String acAvailability,
//     required String cabinsAvailability,
//   }) {
//     bool isWifiAvailable = wifiAvailability.toLowerCase() == 'yes';

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
//                   officeDetails,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Rent: $price/month',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.wifi,
//                       color: isWifiAvailable ? Colors.green : Colors.red,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'WiFi: ${isWifiAvailable ? 'Available' : 'Not Available'}',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.ac_unit,
//                       color: Colors.blue,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'AC: $acAvailability',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.workspaces_filled,
//                       color: Colors.brown,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'Cabins: $cabinsAvailability',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildApartmentsSection(RxList<Apartment> apartments) {
//     return Column(
//       children: [
//         ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: apartmentController.apartments.length,
//           itemBuilder: (context, index) {
//             final apartment = apartmentController.apartments[index];
//             return _buildApartmentCardWidget(
//               imageUrl: 'assets/appartment.jpg', // Replace with actual image path
//               cardTitle: apartment.title,
//               apartmentDetails: apartment.description,
//               price: apartment.price,
//               floor: apartment.floor,
//               liftAvailability: apartment.liftAvailability,
//               rooms: apartment.rooms,
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildApartmentCardWidget({
//     required String imageUrl,
//     required String cardTitle,
//     required String apartmentDetails,
//     required String price,
//     required String floor,
//     required String liftAvailability,
//     required String rooms,
//   }) {
//     bool isLiftAvailable = liftAvailability.toLowerCase() == 'yes';

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
//                   apartmentDetails,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Price: $price/night',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.home_work,
//                       color: Colors.blue,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'Floor: $floor',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.elevator,
//                       color: isLiftAvailable ? Colors.green : Colors.red,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'Lift: ${isLiftAvailable ? 'Available' : 'Not Available'}',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.meeting_room,
//                       color: Colors.brown,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'Rooms: $rooms',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
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
import 'package:get/get.dart';
import 'package:new_journey/Screens/custom_search.dart';
import 'package:new_journey/Screens/drawer.dart';
import 'package:new_journey/controllers/appartment_controller.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/controllers/office%20controller.dart';
import 'package:new_journey/controllers/room_controller.dart';
import 'package:new_journey/models/aparmentmodels.dart';
import 'package:new_journey/models/officemodels.dart';
import 'package:new_journey/models/roommodels.dart';

import '../controllers/search_controller.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final authController = AuthController();
  final roomController = RoomController();
  final officeController = OfficeController();
  final apartmentController = ApartmentController();
  List<Room> filteredRooms = [];
  List<Apartment> filteredApartments = [];
  List<Office> filteredOffices = [];



  String selectedCategory = 'Room';
  bool isLoading = true;
  bool searchLoading = true;
  final controller = TextEditingController();
  final searchController = Get.put(QuerySearchController());

  @override
  void initState() {
    super.initState();

    final userRole = authController.cacheManager.getUserDetails()?['role'];
    if (userRole == 'guest') {
      Future.delayed(Duration(seconds: 2), () {
        _fetchRooms();
        _fetchOffices();
        _fetchApartments();
      });
    } else {
      print("there is some error");
    }
  }

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

  Future<void> _fetchOffices() async {
    try {
      await officeController.fetchOffices();
    } catch (e) {
      print('Error fetching offices: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchApartments() async {
    try {
      await apartmentController.fetchApartments();
    } catch (e) {
      print('Error fetching apartments: $e');
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
            Container(
                margin: const EdgeInsets.all(8),
                child: CustomSearchWidget(
                  onFieldSubmit: (val) {
                    if (selectedCategory == 'Room') {
                      searchController.searchRoom(val, roomController);
                    } else if (selectedCategory == 'Apartment') {
                      searchController.searchApartment(
                          val, apartmentController);
                    } else {
                      searchController.searchOffice(val, officeController);
                    }
                  },
                )),
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
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildCategory('Room', Icons.hotel),
                  _buildCategory('Office', Icons.work),
                  _buildCategory('Apartment', Icons.home),
                ],
              ),
            ),
            if (isLoading)
              CircularProgressIndicator()
            else
              _buildRoomsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomsSection() {
    if (selectedCategory == 'Room') {
      return _buildRoomList(roomController.rooms);
    } else if (selectedCategory == 'Office') {
      return _buildOfficeCard(officeController.offices);
    } else if (selectedCategory == 'Apartment') {
      return _buildApartmentsSection(apartmentController.apartments);
    } else {
      return Text('Invalid category');
    }
  }

  Widget _buildCategory(String category, IconData icon) {
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
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 8),
            Text(
              category,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomList(RxList<Room> rooms) {
    return Obx(() {
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
    });
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
                Row(
                  children: [
                    Icon(
                      Icons.wifi,
                      color: isWifiAvailable ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'WiFi: ${isWifiAvailable ? 'Available' : 'Not Available'}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: isGeneratorAvailable ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Generator: ${isGeneratorAvailable ? 'Available' : 'Not Available'}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfficeCard(RxList<Office> offices) {
    return Obx(() {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: officeController.offices.length,
            itemBuilder: (context, index) {
              final office = officeController.offices[index];
              return _buildOfficeCardWidget(
                imageUrl: 'assets/officespace.jpg',
                cardTitle: office.title,
                officeDetails: office.description,
                price: office.price,
                wifiAvailability: office.wifiAvailability,
                acAvailability: office.acAvailability,
                cabinsAvailability: office.cabinsAvailability,
              );
            },
          ),
        ],
      );
    });
  }

  Widget _buildOfficeCardWidget({
    required String imageUrl,
    required String cardTitle,
    required String officeDetails,
    required String price,
    required String wifiAvailability,
    required String acAvailability,
    required String cabinsAvailability,
  }) {
    bool isWifiAvailable = wifiAvailability.toLowerCase() == 'yes';

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
                  officeDetails,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Rent: $price/month',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.wifi,
                      color: isWifiAvailable ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'WiFi: ${isWifiAvailable ? 'Available' : 'Not Available'}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'AC: $acAvailability',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.workspaces_filled,
                      color: Colors.brown,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Cabins: $cabinsAvailability',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApartmentsSection(RxList<Apartment> apartments) {
    return Obx(() {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: apartmentController.apartments.length,
            itemBuilder: (context, index) {
              final apartment = apartmentController.apartments[index];
              return _buildApartmentCardWidget(
                imageUrl:
                    'assets/appartment.jpg', // Replace with actual image path
                cardTitle: apartment.title,
                apartmentDetails: apartment.description,
                price: apartment.price,
                floor: apartment.floor,
                liftAvailability: apartment.liftAvailability,
                rooms: apartment.rooms,
              );
            },
          ),
        ],
      );
    });
  }

  Widget _buildApartmentCardWidget({
    required String imageUrl,
    required String cardTitle,
    required String apartmentDetails,
    required String price,
    required String floor,
    required String liftAvailability,
    required String rooms,
  }) {
    bool isLiftAvailable = liftAvailability.toLowerCase() == 'yes';

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
                  apartmentDetails,
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
                Row(
                  children: [
                    Icon(
                      Icons.home_work,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Floor: $floor',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.elevator,
                      color: isLiftAvailable ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Lift: ${isLiftAvailable ? 'Available' : 'Not Available'}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.meeting_room,
                      color: Colors.brown,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Rooms: $rooms',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
