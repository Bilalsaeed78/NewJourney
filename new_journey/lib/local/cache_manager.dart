// // import 'package:get_storage/get_storage.dart';

// // mixin CacheManager{
// //   void setUserType(String userType) {
// //     final box = GetStorage();
// //     box.write('userType', userType);
// //   }

// //   String? getUserType() {
// //     final box = GetStorage();
// //     return box.read('userType');
// //   }

// //   Future<void> removeToken() async {
// //     final box = GetStorage();
// //     await box.remove('userType');
// //   }
// // }
// import 'package:get_storage/get_storage.dart';

// mixin CacheManager {
//   void setUserType(String userType) {
//     final box = GetStorage();
//     box.write('userType', userType);
//   }

//   String? getUserType() {
//     final box = GetStorage();
//     return box.read('userType');
//   }

//   Future<void> removeUserType() async {
//     final box = GetStorage();
//     await box.remove('userType');
//   }

//   void saveToken(String token) {
//     final box = GetStorage();
//     box.write('token', token);
//   }

//   String? getToken() {
//     final box = GetStorage();
//     return box.read('token');
//   }

//   Future<void> removeToken() async {
//     final box = GetStorage();
//     await box.remove('token');
//   }
// }
// cache_manager.dart
import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  void setUserType(String userType) {
    final box = GetStorage();
    box.write('userType', userType);
  }

  String? getUserType() {
    final box = GetStorage();
    return box.read('userType');
  }

  Future<void> removeUserType() async {
    final box = GetStorage();
    await box.remove('userType');
  }

  void saveToken(String token) {
    final box = GetStorage();
    box.write('token', token);
  }

  String? getToken() {
    final box = GetStorage();
    return box.read('token');
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove('token');
  }

  void saveUserDetails(Map<String, dynamic> userDetails) {
    final box = GetStorage();
    box.write('userDetails', userDetails);
  }

  Map<String, dynamic>? getUserDetails() {
    final box = GetStorage();
    return box.read('userDetails');
  }

  Future<void> removeUserDetails() async {
    final box = GetStorage();
    await box.remove('userDetails');
  }
}
