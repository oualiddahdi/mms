import 'package:get/get.dart';
import 'package:project_portal/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  // Add your other controller properties and methods here

  // Method to handle user logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    // Navigate to the splash screen
    Get.offAllNamed(AppRoutes.splashScreen);
  }
}
