import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/theme/custom_text_style.dart';
import 'package:project/theme/theme_helper.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_icon_button.dart';
import 'package:project/widgets/custom_image_view.dart';
import 'package:project/widgets/custom_text_form_field.dart';

import '../../core/errors/exceptions.dart';
import '../../core/utils/progress_dialog_utils.dart';
import '../../data/models/login/post_login_resp.dart';
import '../../routes/app_routes.dart';
import 'controller/login_controller.dart';

import 'package:fluttertoast/fluttertoast.dart';


// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  TextEditingController emailController = TextEditingController();

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
                    child: Column(children: [
                      _buildPageHeader(context),
                      SizedBox(height: 28.v),
                      CustomTextFormField(
                          controller: emailController,
                          hintText: "lbl_your_email".tr(),
                          textInputType: TextInputType.emailAddress,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(16.v, 12.v, 10.v, 12.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgMail,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 48.v),
                          contentPadding: EdgeInsets.only(
                              top: 15.v, right: 30.h, bottom: 15.v)),
                      SizedBox(height: 10.v),
                      CustomTextFormField(
                          controller: passwordController,
                          hintText: "lbl_password".tr(),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgLock,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 48.v),
                          obscureText: true,
                          contentPadding: EdgeInsets.only(
                              top: 15.v, right: 30.h, bottom: 15.v)),
                      SizedBox(height: 16.v),
                      CustomElevatedButton(
                          text: "lbl_sign_in".tr(),
                          onPressed: () {
                            onTapSignin();
                          }),
                      SizedBox(height: 18.v),
                      SizedBox(height: 16.v),
                      SizedBox(height: 17.v),
                      Text("msg_forgot_password".tr(),
                          style: CustomTextStyles.labelLargePrimary),
                      SizedBox(height: 7.v),
                      GestureDetector(
                          onTap: () {
                            //  onTapTxtDonthaveanaccount(context);
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_don_t_have_an_account2".tr(),
                                    style: theme.textTheme.bodySmall),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: "lbl_register".tr(),
                                    style: CustomTextStyles.labelLargePrimary_1)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildPageHeader(BuildContext context) {
    return Column(children: [
      CustomIconButton(
          height: 72.adaptSize,
          width: 72.adaptSize,
          padding: EdgeInsets.all(20.h),
          decoration: IconButtonStyleHelper.fillPrimary,
          child: CustomImageView(imagePath: ImageConstant.imgLogo)),
      SizedBox(height: 16.v),
      Text("msg_welcome_to_e_com".tr(), style: theme.textTheme.titleMedium),
      SizedBox(height: 10.v),
      Text("msg_sign_in_to_continue".tr(), style: theme.textTheme.bodySmall)
    ]);
  }

  ///Future
  Future<void> onTapSignin() async {

    final postLoginReq = {
      "username": emailController.text,
      "password": passwordController.text
    };

    try {
      await controller.callCreateLogin(
        postLoginReq,
      );
      _onOnTapSignInSuccess();
    } on PostLoginResp {
      _onOnTapSignInError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onOnTapSignInSuccess() {
    Get.offNamed(AppRoutes.homePage, arguments: {});
  }

  void _onOnTapSignInError() {
    Fluttertoast.showToast(
      msg: "Invalid username or password!",
    );
  }
}
