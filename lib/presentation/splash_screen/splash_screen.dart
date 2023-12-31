import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/splash_controller.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Get.find<SplashController>().navigateToNextScreen();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.background_12312023),
              fit: BoxFit.fill, // Adjust the fit as needed
            ),
          ),
          child: Center(
            child: CustomImageView(
              imagePath: ImageConstant.imgLogo,
              fit: BoxFit.fill, // Adjust the fit as needed
              height: 72.adaptSize,
              width: 72.adaptSize,
            ),
          ),
        ),
      ),
    );
  }
}
