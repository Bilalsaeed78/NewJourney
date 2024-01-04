import 'package:get/get.dart';

class RouteManager {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String editProfile = '/editProfile';
  static const String ownerdashboard = '/ownerdashboard';



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
}
