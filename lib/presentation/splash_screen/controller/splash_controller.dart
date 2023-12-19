import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:project/core/utils/delight_toast_bar.dart';
import 'package:project/core/utils/pref_utils.dart';
import 'package:project/routes/app_routes.dart';

class SplashModel {}

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.getStartedScreen,
      );
    });

  }

  void authenticate(context) async {
    bool authenticated = false;

    try {
      // Check if fingerprint authentication is enabled
      bool isFingerprintEnabled = await PrefUtils().getSwitchValue();

      if (isFingerprintEnabled) {
        authenticated = await _auth.authenticate(
          localizedReason: "Scan your finger to authenticate",
        );

        if (authenticated) {

          Get.offNamed(
            AppRoutes.getStartedScreen,
          );

        } else {
          // Retry authentication on failure

          DelightToast.onOnTapSignInError(context);

        }
      } else {

        Get.offNamed(
          AppRoutes.getStartedScreen,
        );

      }
    } on PlatformException catch (e) {

    }
  }


  @override
  void onClose() {
    super.onClose();
  }


}
