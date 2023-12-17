import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'controller/splash_controller.dart';
import 'package:project/presentation/login_screen/login_screen.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/pref_utils.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      // Check if fingerprint authentication is enabled
      bool isFingerprintEnabled = await PrefUtils().getSwitchValue();
      print(isFingerprintEnabled.toString()+'isFingerprintEnabled');

      if (isFingerprintEnabled) {
        authenticated = await _auth.authenticate(
          localizedReason: "Scan your finger to authenticate",
        );

        if (authenticated) {
          // Navigate to the login screen on successful authentication
          Get.offAll(LoginScreen());
        } else {
          // Retry authentication on failure
          _authenticate();
          print("Authentication failed");
        }
      } else {
        // If fingerprint authentication is not enabled, navigate to login screen
        Get.offAll(LoginScreen());
      }
    } on PlatformException catch (e) {
      // Handle platform-specific exceptions
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    // Execute authentication logic after the frame has been rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authenticate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.teal900,
        body: Center(
          child: Container(
            height: 72.adaptSize,
            width: 72.adaptSize,
            alignment: Alignment.center,
            child: CustomImageView(
              imagePath: ImageConstant.imgLogo,
              height: 72.adaptSize,
              width: 72.adaptSize,
            ),
          ),
        ),
      ),
    );
  }
}
