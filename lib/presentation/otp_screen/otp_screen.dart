import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/instance_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/otp_screen/controller/otp_controller.dart';
import 'package:project/theme/custom_text_style.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'dart:ui' as ui;

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final OtpController controller = Get.put(OtpController());

  final TextEditingController _otpController = TextEditingController();

  final int maxLength = 7;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "lbl_account_verification",
                  style: CustomTextStyles.labelLargePrimary.copyWith(
                    fontSize: 20.0.v,
                  ),
                ).tr(),
                SizedBox(height: 28.v),
                Text(
                  "lbl_account_verification_d",
                  style: CustomTextStyles.labelMediumBluegray300
                      .copyWith(fontSize: 14.0.v),
                ).tr(),
                SizedBox(height: 30.v),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: OtpTextField(
                    numberOfFields: 4,
                    borderColor: ColorConstant.primaryColor,
                    keyboardType: TextInputType.number,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      _otpController.text = verificationCode.toString();
                    }, // end onSubmit
                  ),
                ),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                  height: getVerticalSize(56),
                  text: "lbl_confirm",
                  margin: getMargin(top: 20),
                  backgroundColor: ColorConstant.primaryColor,
                  shape: ButtonShape.RoundedBorder10,
                  padding: ButtonPadding.PaddingAll16,
                  fontStyle: ButtonFontStyle.ManropeBold16Gray50_1,
                  onTap: () {
                    controller.onTapOtp(
                        _otpController.text.toString(), context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
