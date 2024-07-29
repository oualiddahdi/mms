import 'dart:io';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_portal/core/utils/pref_utils.dart';
import 'package:project_portal/presentation/home_page/home_page.dart';
import 'package:project_portal/routes/app_routes.dart';

class SplashModel {}

class SplashController extends GetxController {
  final permissionCamera = Permission.camera;

  @override
  void onInit() {
    super.onInit();
    requestPermissions();
    navigateToNextScreen();
  }

  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      if (!await Permission.camera.isGranted) {
        await Permission.camera.request();
      }
      if (Platform.isAndroid) {
        // For Android 10 and above, you might want to check for storage or media permissions
        if (Platform.version.contains("10")) {
          if (!await Permission.mediaLibrary.isGranted) {
            await Permission.mediaLibrary.request();
          }
        } else if (!await Permission.storage.isGranted) {
          await Permission.storage.request();
        }
      }
    } else if (Platform.isIOS) {
      if (!await Permission.camera.isGranted) {
        await Permission.camera.request();
      }
      if (!await Permission.photos.isGranted) {
        await Permission.photos.request();
      }
    }
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      final token = Get.find<PrefUtils>().getToken();
      if (token.isNotEmpty) {
        onTokenExists();
      } else {
        Get.offNamed(AppRoutes.loginScreen);
      }
    });
  }

  void onTokenExists() {
    Get.offAll(const HomePage());
  }
}
