import 'package:flutter/material.dart';
import 'package:new_journey/Screens/drawer.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/controllers/office%20controller.dart';
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
  final officeController = OfficeController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    final userRole = authController.cacheManager.getUserDetails()?['role'];
    if (userRole == 'guest') {
      Future.delayed(Duration(seconds: 2), () {
        _fetchRooms();
        _fetchOffices();
      });
    } else {
      _fetchRooms();
      _fetchOffices();
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
            // Add the logo above the search filter
            // Padding(
            //   padding: const EdgeInsets.only(top:0.0),
            //   child: Image.asset(
            //     'assets/newjourneyshort.png',
            //     width: 220.0,
            //     // height: 100.0,
            //   ),
            // ),
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
                            onPressed: () {                              // Handle filter button press
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
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildCategory('Room', Icons.hotel),
                  _buildCategory('Office', Icons.work),
                  _buildCategory('Stay', Icons.home),
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
      return _buildRoomList();
    } else if (selectedCategory == 'Office') {
      return _buildOfficeCard();
    } else if (selectedCategory == 'Stay') {
      return _buildStayCard();
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

  Widget _buildOfficeCard() {
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
