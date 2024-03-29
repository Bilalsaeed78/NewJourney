import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_journey/Screens/appartment_screen.dart';
import 'package:new_journey/Screens/create_space_category.dart';
import 'package:new_journey/Screens/editprofile.dart';
import 'package:new_journey/Screens/guest_dashboard.dart';
import 'package:new_journey/Screens/login_screen.dart';
import 'package:new_journey/Screens/office_screen.dart';
import 'package:new_journey/Screens/ownerdashboard.dart';
import 'package:new_journey/Screens/registerscreen.dart';
import 'package:new_journey/Screens/room_screen.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/routes/routes.dart';
import 'Screens/Splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBIRh7uCzzSXJb6b_3aMf6aFse2fZ4rE6I',
      appId: '1:870902745208:android:3a8f1842aea6e4ad74458d',
      messagingSenderId: '870902745208',
      projectId: 'new-journey-9dc6a',
      storageBucket: 'new-journey-9dc6a.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.splash,
      initialBinding: BindingsBuilder.put(() => AuthController()),
      getPages: [
        GetPage(name: RouteManager.splash, page: () => SplashScreen()),
        GetPage(name: RouteManager.login, page: () => LoginScreen()),
        GetPage(name: RouteManager.register, page: () => RegistrationScreen()),
        GetPage(name: RouteManager.dashboard, page: () => UserDashboard()),
        GetPage(
          name: RouteManager.ownerdashboard,
          page: () => OwnerDashboard(),
        ),
        GetPage(
          name: RouteManager.editProfile,
          page: () => EditProfileScreen(),
        ),
         GetPage(name: '/category', page: () => CategoryScreen()),
        GetPage(name: '/room', page: () => RoomScreen()),
        GetPage(name: '/office', page: () => OfficeScreen()),
        GetPage(name: '/apartment', page: () => ApartmentScreen(), ),

      ],
    );
  }
}
