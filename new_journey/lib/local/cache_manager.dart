// import 'package:get_storage/get_storage.dart';

// class CacheManager {
//   final box = GetStorage();

//   void setUserType(String userType) {
//     box.write('userType', userType);
//   }

//   String? getUserType() {
//     return box.read('userType');
//   }

//   Future<void> removeUserType() async {
//     await box.remove('userType');
//   }

//   void saveToken(String token) {
//     box.write('token', token);
//   }

//   String? getToken() {
//     return box.read('token');
//   }

//   Future<void> removeToken() async {
//     await box.remove('token');
//   }

//   void saveUserDetails(Map<String, dynamic> userDetails) {
//     box.write('userDetails', userDetails);
//   }

//   Map<String, dynamic>? getUserDetails() {
//     return box.read('userDetails');
//   }

//   Future<void> removeUserDetails() async {
//     await box.remove('userDetails');
//   }

//   void saveAccessToken(String token) {
//     box.write('accessToken', token);
//   }

//   String? getAccessToken() {
//     return box.read('accessToken');
//   }

//   Future<void> removeAccessToken() async {
//     await box.remove('accessToken');
//   }
// }
import 'package:get_storage/get_storage.dart';

class CacheManager {
  final box = GetStorage();

  void setUserType(String userType) {
    box.write('userType', userType);
  }

  String? getUserType() {
    return box.read('userType');
  }

  Future<void> removeUserType() async {
    await box.remove('userType');
  }

  void saveUserDetails(Map<String, dynamic> userDetails) {
    box.write('userDetails', userDetails);
  }

  Map<String, dynamic>? getUserDetails() {
    return box.read('userDetails');
  }

  Future<void> removeUserDetails() async {
    await box.remove('userDetails');
  }

  void saveAccessToken(String token) {
    box.write('accessToken', token);
  }

  String? getAccessToken() {
    return box.read('accessToken');
  }

  Future<void> removeAccessToken() async {
    await box.remove('accessToken');
  }
}
