// // import 'package:get/get.dart';
// // import 'package:new_journey/controllers/appartment_controller.dart';
// // import 'package:new_journey/controllers/office%20controller.dart';
// // import 'package:new_journey/controllers/room_controller.dart';
// // import 'package:new_journey/models/aparmentmodels.dart';
// // import 'package:new_journey/models/officemodels.dart';
// // import 'package:new_journey/models/roommodels.dart';

// // class QuerySearchController extends GetxController {
// //   final Rx<List<Room>> _searchedRoom = Rx<List<Room>>([]);
// //   List<Room> get searchedRoom => _searchedRoom.value;

// //     final Rx<List<Office>> _searchedOffice = Rx<List<Office>>([]);
// //   List<Office> get searchedOffice => _searchedOffice.value;

// //     final Rx<List<Apartment>> _searchedApartment = Rx<List<Apartment>>([]);
// //   List<Apartment> get searchedApartment => _searchedApartment.value;

// //   Future<void> searchRoom(
// //       String typedUser, RoomController controller) async {
// //     if (typedUser.isEmpty) {
// //       _searchedRoom.value = [];
// //       controller.fetchRooms();
// //       return;
// //     }

// //     List<Room> retVal = [];

// //     for (var room in controller.rooms) {
// //       if (room.title.toLowerCase().contains(typedUser.toLowerCase())) {
// //         print(room.title);
// //         retVal.add(room);
// //       }
// //     }

// //     _searchedRoom.value = retVal;
// //   }

// //   Future<void> searchApartment(
// //       String typedUser, ApartmentController controller) async {
// //     if (typedUser.isEmpty) {
// //       _searchedRoom.value = [];
// //       controller.fetchApartments();
// //       return;
// //     }

// //     List<Apartment> retVal = [];

// //     for (var appartment in controller.apartments) {
// //       if (appartment.title.toLowerCase().contains(typedUser.toLowerCase())) {
// //         print(appartment.title);
// //         retVal.add(appartment);
// //       }
// //     }

// //     _searchedApartment.value = retVal;
// //   }

// //   Future<void> searchOffice(
// //       String typedUser, OfficeController controller) async {
// //     if (typedUser.isEmpty) {
// //       _searchedRoom.value = [];
// //       controller.fetchOffices();
// //       return;
// //     }

// //     List<Office> retVal = [];

// //     for (var office in controller.offices) {
// //       if (office.title.toLowerCase().contains(typedUser.toLowerCase())) {
// //         print(office.title);
// //         retVal.add(office);
// //       }
// //     }

// //     _searchedOffice.value = retVal;
// //   }
// // }
// import 'package:get/get.dart';
// import 'package:new_journey/controllers/appartment_controller.dart';
// import 'package:new_journey/controllers/controllers.dart';
// import 'package:new_journey/controllers/office%20controller.dart';
// import 'package:new_journey/controllers/room_controller.dart';
// import 'package:new_journey/models/aparmentmodels.dart';
// import 'package:new_journey/models/officemodels.dart';
// import 'package:new_journey/models/roommodels.dart';

// class QuerySearchController extends GetxController {
//   final RoomController roomController = Get.find();
//   final OfficeController officeController = Get.find();
//   final ApartmentController apartmentController = Get.find();

//   void searchRoom(String query, RoomController roomController) {
//     List<Room> filteredRooms = roomController.rooms.where((room) {
//       return room.title.toLowerCase().contains(query.toLowerCase()) ||
//           room.description.toLowerCase().contains(query.toLowerCase());
//     }).toList();

//     roomController.updateRooms(filteredRooms);
//   }

//   void searchOffice(String query, OfficeController officeController) {
//     List<Office> filteredOffices = officeController.offices.where((office) {
//       return office.title.toLowerCase().contains(query.toLowerCase()) ||
//           office.description.toLowerCase().contains(query.toLowerCase());
//     }).toList();

//     officeController.updateOffices(filteredOffices);
//   }

//   void searchApartment(String query, ApartmentController apartmentController) {
//     List<Apartment> filteredApartments = apartmentController.apartments.where((apartment) {
//       return apartment.title.toLowerCase().contains(query.toLowerCase()) ||
//           apartment.description.toLowerCase().contains(query.toLowerCase());
//     }).toList();

//     apartmentController.updateApartments(filteredApartments);
//   }
// }
import 'package:get/get.dart';
import 'package:new_journey/controllers/appartment_controller.dart';
import 'package:new_journey/controllers/office%20controller.dart';
import 'package:new_journey/controllers/room_controller.dart';
import 'package:new_journey/models/aparmentmodels.dart';
import 'package:new_journey/models/officemodels.dart';
import 'package:new_journey/models/roommodels.dart';

class QuerySearchController extends GetxController {
  final roomController = RoomController();
  final officeController = OfficeController();
  final apartmentController = ApartmentController();

  void searchRoom(String query, RoomController roomController) {
    final List<Room> filteredRooms = roomController.originalRooms
        .where((room) =>
            room.title.toLowerCase().contains(query.toLowerCase()) ||
            room.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
    roomController.updateRooms(filteredRooms);
  }

  void searchOffice(String query, OfficeController officeController) {
    final List<Office> filteredOffices = officeController.originalOffices
        .where((office) =>
            office.title.toLowerCase().contains(query.toLowerCase())||
          office.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
    officeController.updateOffices(filteredOffices);
  }

  void searchApartment(String query, ApartmentController apartmentController) {
    final List<Apartment> filteredApartments = apartmentController
        .originalApartments
        .where((apartment) =>
            apartment.title.toLowerCase().contains(query.toLowerCase()) ||
          apartment.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
    apartmentController.updateApartments(filteredApartments);
  }
}

  // void searchOffice(String query, OfficeController officeController) {
  //   if (query.isEmpty) {
  //     // Reset to original list when query is empty
  //     officeController.updateOffices(officeController.allOffices);
  //     return;
  //   }

  //   final List<Office> filteredOffices = officeController.allOffices
  //       .where((office) =>
  //           office.title.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  //   officeController.updateOffices(filteredOffices);
  // }

  // void searchApartment(
  //     String query, ApartmentController apartmentController) {
  //   if (query.isEmpty) {
  //     // Reset to original list when query is empty
  //     apartmentController.updateApartments(apartmentController.allApartments);
  //     return;
  //   }

  //   final List<Apartment> filteredApartments = apartmentController.allApartments
  //       .where((apartment) =>
  //           apartment.title.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  //   apartmentController.updateApartments(filteredApartments);
  // }
// }
