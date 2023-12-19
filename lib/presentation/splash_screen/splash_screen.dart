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

    // Execute authentication logic after the frame has been rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<SplashController>().authenticate(context);
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
