import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:project/core/utils/delight_toast_bar.dart';
import 'package:project/core/utils/pref_utils.dart';
import 'package:project/routes/app_routes.dart';
class SplashModel {}

class GetStartedController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  final LocalAuthentication _auth = LocalAuthentication();

  // Function to navigate to the second page
  void goToSecondPage() {
    Get.offNamed(
      AppRoutes.loginScreen,
    );
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


}
