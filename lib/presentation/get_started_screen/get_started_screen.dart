import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/get_started_screen/controller/get_started_controller.dart';
import 'package:project/presentation/recover_password_screen/recover_password_screen.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_image_view.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // Execute authentication logic after the frame has been rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<GetStartedController>().authenticate(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.background_12312023),
              fit: BoxFit.fill, // Adjust the fit as needed
            ),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 16.v, top: 68.v, right: 16.v),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgLogo,
                    fit: BoxFit.fill, // Adjust the fit as needed
                    height: 100.adaptSize,
                    width: 100.adaptSize,
                  ),
                  SizedBox(height: 50.v),
                  CustomElevatedButton(
                    height: getVerticalSize(56),
                    text: "lbl_sign_in",
                    margin: getMargin(top: 20),
                    backgroundColor: ColorConstant.primaryColor,
                    shape: ButtonShape.RoundedBorder10,
                    padding: ButtonPadding.PaddingAll16,
                    fontStyle: ButtonFontStyle.ManropeBold16Gray50_1,
                    onTap: () {
                      Get.find<GetStartedController>().goToSecondPage();
                    },
                  ),
                  CustomElevatedButton(
                      height: getVerticalSize(56),
                      text: "lbl_new_account",
                      margin: getMargin(top: 20),
                      backgroundColor: ColorConstant.whiteA700,
                      shape: ButtonShape.RoundedBorder10,
                      padding: ButtonPadding.PaddingAll16,
                      fontStyle: ButtonFontStyle.ManropeBold16PrimaryColor,
                      onTap: () {
                        Get.to(RecoverPasswordScreen());
                      }),
                  SizedBox(height: 18.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
