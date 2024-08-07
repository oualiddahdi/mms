import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/image_constant.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/theme/custom_text_style.dart';
import 'package:project_portal/widgets/custom_elevated_button.dart';
import 'package:project_portal/widgets/custom_image_view.dart';
import 'package:project_portal/widgets/custom_text_form_field.dart';
import 'package:project_portal/presentation/recover_password_screen/controller/recover_password_controller.dart';

class RecoverPasswordScreen extends StatelessWidget {
  final RecoverPasswordController _controller = Get.put(RecoverPasswordController());

  RecoverPasswordScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "change_password",
                  style: CustomTextStyles.labelLargePrimary.copyWith(
                    fontSize: 20.0.v,
                  ),
                ).tr(),
                SizedBox(height: 28.v),
                Text(
                  "current_password",
                  style: CustomTextStyles.labelMediumBluegray300
                      .copyWith(fontSize: 14.0.v),
                ).tr(),
                SizedBox(height: 10.v),
                CustomTextFormField(
                  autofocus: false,
                  controller: _controller.currentPasswordController,
                  hintText: "lbl_password",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgLock,
                          height: 24.adaptSize,
                          width: 24.adaptSize
                      )
                  ),
                  prefixConstraints: BoxConstraints(maxHeight: 48.v),
                  obscureText: true,
                  contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
                ),
                SizedBox(height: 16.v),
                Text(
                  "new_password",
                  style: CustomTextStyles.labelMediumBluegray300
                      .copyWith(fontSize: 14.0.v),
                ).tr(),
                SizedBox(height: 10.v),
                CustomTextFormField(
                  autofocus: false,
                  controller: _controller.newPasswordController,
                  hintText: "lbl_new_password",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgLock,
                          height: 24.adaptSize,
                          width: 24.adaptSize
                      )
                  ),
                  prefixConstraints: BoxConstraints(maxHeight: 48.v),
                  obscureText: true,
                  contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
                ),
                SizedBox(height: 16.v),
                Text(
                  "confirm_password",
                  style: CustomTextStyles.labelMediumBluegray300
                      .copyWith(fontSize: 14.0.v),
                ).tr(),
                SizedBox(height: 10.v),
                CustomTextFormField(
                  autofocus: false,
                  controller: _controller.confirmPasswordController,
                  hintText: "confirm_password_hint",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgLock,
                          height: 24.adaptSize,
                          width: 24.adaptSize
                      )
                  ),
                  prefixConstraints: BoxConstraints(maxHeight: 48.v),
                  obscureText: true,
                  contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
                ),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                  height: getVerticalSize(56),
                  text: "change_password_button",
                  margin: getMargin(top: 20),
                  backgroundColor: ColorConstant.primaryColor,
                  shape: ButtonShape.RoundedBorder10,
                  padding: ButtonPadding.PaddingAll16,
                  fontStyle: ButtonFontStyle.ManropeBold16Gray50_1,
                  onTap: _controller.onTapChangePassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
