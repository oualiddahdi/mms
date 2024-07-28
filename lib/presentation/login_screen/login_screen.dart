import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/instance_manager.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/image_constant.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/presentation/login_screen/controller/login_controller.dart';
import 'package:project_portal/theme/custom_text_style.dart';
import 'package:project_portal/widgets/custom_elevated_button.dart';
import 'package:project_portal/widgets/custom_image_view.dart';
import 'package:project_portal/widgets/custom_text_form_field.dart'; // Ensure this import is present

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController apiUrlController = TextEditingController(text: ApiService.apiUrl);

  Future<void> _showApiUrlDialog() async {
    String newApiUrl = ApiService.apiUrl;

    await showDialog(
      context: context, // Ensure this 'context' is from Flutter
      builder: (BuildContext context) { // Specify 'BuildContext' explicitly
        return AlertDialog(
          title: const Text('Edit API URL'),
          content: TextField(
            controller: apiUrlController,
            decoration: const InputDecoration(hintText: 'Enter new API URL'),
            onChanged: (value) {
              newApiUrl = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                await ApiService.setBaseUrl(newApiUrl);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [


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
                      margin: EdgeInsets.fromLTRB(16.v, 12.v, 10.v, 12.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgMail,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 48.v),
                  contentPadding:
                  EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v)),
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
                      margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgLock,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 48.v),
                  obscureText: true,
                  contentPadding:
                  EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.find<LoginController>().onOnTapForgotPasswordScreen();
                    },
                    child: Text("msg_forgot_password".tr(),
                        style: CustomTextStyles.labelLargePrimary),
                  ),

                  InkWell(
                    onTap: () {
                      _showApiUrlDialog();
                      },
                    child: Text("API URL".tr(),
                        style: CustomTextStyles.labelLargePrimary),
                  ),

                ],
              ),
                        ]),
          ),
        ),
      ),
    );
  }

}
