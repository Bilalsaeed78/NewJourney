import 'package:get/get.dart';

class RouteManager {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String editProfile = '/editProfile';
  static const String ownerdashboard = '/ownerdashboard';
  static const String category = '/category';
  static const String room = '/room';
  // static const String office = '/office';
  // static const String stay = '/stay';
  // static const String CategoryScreen = '/categoryScreen';


  static void goToSplash() {
    Get.offAllNamed(splash);
  }

  static void goToLogin() {
    Get.offAllNamed(login);
  }

  static void goToDashboard() {
    Get.offAllNamed(dashboard);
  }

  static void navigateToRegistrationScreen() {
    Get.toNamed(register);
  }

  static void goToEditProfile() {
    Get.toNamed(editProfile);
  }

  static void goToOwnerDashboard() {
    Get.offAllNamed(ownerdashboard);
  }

  static void goToCategory() {
    Get.toNamed(category);
  }

  static void goToRoom() {
    Get.toNamed(room);
  }

  

  // static void goToOffice() {
  //   Get.toNamed(office);
  // }

  // static void goToStay() {
  //   Get.toNamed(stay);
  // }
}
