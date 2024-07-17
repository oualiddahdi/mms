import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/theme/custom_text_style.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_image_view.dart';
import 'package:project/widgets/custom_text_form_field.dart';

import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                    padding:
                        EdgeInsets.only(left: 16.v, top: 68.v, right: 16.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_sign_in".tr(),
                            style: CustomTextStyles.labelLargePrimary
                                .copyWith(fontSize: 20.0.v),
                          ),
                          SizedBox(height: 28.v),
                          Text(
                            "lbl_your_email".tr(),
                            style: CustomTextStyles.labelMediumBluegray300
                                .copyWith(fontSize: 14.0.v),
                          ),
                          SizedBox(height: 10.v),
                          CustomTextFormField(
                              autofocus: false,
                              controller: usernameController,
                              hintText: "lbl_your_email".tr(),
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      16.v, 12.v, 10.v, 12.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgMail,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 48.v),
                              contentPadding: EdgeInsets.only(
                                  top: 15.v, right: 30.h, bottom: 15.v)),
                          SizedBox(height: 16.v),
                          Text(
                            "lbl_password".tr(),
                            style: CustomTextStyles.labelMediumBluegray300
                                .copyWith(fontSize: 14.0.v),
                          ),
                          SizedBox(height: 10.v),
                          CustomTextFormField(
                              autofocus: false,
                              controller: passwordController,
                              hintText: "lbl_password".tr(),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      16.h, 12.v, 10.h, 12.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgLock,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 48.v),
                              obscureText: true,
                              contentPadding: EdgeInsets.only(
                                  top: 15.v, right: 30.h, bottom: 15.v)),
                          SizedBox(height: 16.v),
                          CustomElevatedButton(
                              height: getVerticalSize(56),
                              text: "lbl_sign_in".tr(),
                              margin: getMargin(top: 20),
                              backgroundColor: ColorConstant.primaryColor,
                              shape: ButtonShape.RoundedBorder10,
                              padding: ButtonPadding.PaddingAll16,
                              fontStyle: ButtonFontStyle.ManropeBold16Gray50_1,
                              onTap: () {
                                Get.find<LoginController>().onTapSignIn(
                                    usernameController.text,
                                    passwordController.text,
                                    context);
                              }),
                          SizedBox(height: 18.v),
                          InkWell(
                            onTap: () {
                              Get.find<LoginController>()
                                  .onOnTapForgotPasswordScreen();
                            },
                            child: Text("msg_forgot_password".tr(),
                                style: CustomTextStyles.labelLargePrimary),
                          ),
                        ])))));
  }
}
