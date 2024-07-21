import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/core/utils/sizes.dart';
import 'package:project_portal/theme/custom_text_style.dart';
import 'package:project_portal/widgets/custom_elevated_button.dart';
import 'package:project_portal/widgets/custom_image_view.dart';
import 'package:project_portal/widgets/custom_text_form_field.dart';
import 'dart:ui' as ui;

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController _phoneNumberController = TextEditingController();
  final int maxLength = 7; // تحديد الحد الأقصى لعدد الحروف

  ForgotPasswordScreen({super.key});

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
            padding: EdgeInsets.only(
                left: largePaddingSize, top: 68.v, right: largePaddingSize),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "msg_forgot_password",
                style: CustomTextStyles.labelLargePrimary
                    .copyWith(fontSize: 20.0.v),
              ).tr(),
              SizedBox(height: 28.v),
              Text(
                "lbl_phone_number",
                style: CustomTextStyles.labelMediumBluegray300
                    .copyWith(fontSize: 14.0.v),
              ).tr(),
              SizedBox(height: 10.v),
              Directionality(
                textDirection: ui.TextDirection.ltr,
                // Use the fully qualified name
                child: CustomTextFormField(
                    autofocus: false,
                    controller: _phoneNumberController,
                    onChanged: (text) {
                      if (text.length > maxLength) {
                        // إذا تم تجاوز الحد الأقصى، قم بإلغاء أي حروف إضافية
                        _phoneNumberController.text =
                            text.substring(0, maxLength);
                        _phoneNumberController.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                              offset: _phoneNumberController.text.length),
                        );
                      }
                    },
                    hintText: "5XXXXXXXX",
                    textInputType: TextInputType.phone,
                    maxLines: 1,
                    prefixText: "+966 ",
                    // الرقم الثابت مع فراغ بعده
                    prefix: Container(
                        margin: EdgeInsets.fromLTRB(16.v, 12.v, 10.v, 12.v),
                        child: CustomImageView(
                            height: 24.adaptSize, width: 24.adaptSize)),
                    prefixConstraints: BoxConstraints(maxHeight: 48.v),
                    contentPadding:
                        EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v)),
              ),
              SizedBox(height: 16.v),
              SizedBox(height: 16.v),
              CustomElevatedButton(
                height: getVerticalSize(56),
                text: "lbl_restore_password",
                margin: getMargin(top: 20),
                backgroundColor: ColorConstant.primaryColor,
                shape: ButtonShape.RoundedBorder10,
                padding: ButtonPadding.PaddingAll16,
                fontStyle: ButtonFontStyle.ManropeBold16Gray50_1,
                onTap: () {},
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
