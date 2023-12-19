import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/get_started_screen/controller/get_started_controller.dart';
import 'package:project/presentation/otp_screen/otp_screen.dart';
import 'package:project/presentation/recover_password_screen/recover_password_screen.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_image_view.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,

            padding: EdgeInsets.only(left: 16.v, top: 68.v, right: 16.v),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  height: 100,
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
    );
  }
}
