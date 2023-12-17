import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:project/core/utils/pref_utils.dart';
import 'package:project/routes/app_routes.dart';
class SplashModel {}

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.loginScreen,
      );
    });

  }

  @override
  void onClose() {
    super.onClose();
  }


}
