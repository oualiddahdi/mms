import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_image_view.dart';
import 'package:project/widgets/custom_text_form_field.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController dateHijriController = TextEditingController();
  TextEditingController dateGregorianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text(
                'upload_extracts',
                style: TextStyle(
                  fontSize: smallFontSize,
                ),
              ).tr(),
            ),
            body: Form(
                child: Container(
                    width: double.maxFinite,
                    padding:
                        const EdgeInsets.only(left: largePaddingSize, top: largePaddingSize, right: largePaddingSize),
                    child: Column(children: [
                      SizedBox(height: 29.v),
                      SizedBox(height: 29.v),
                      InkWell(
                        onTap: () {
                          _selectDateGregorian(context);
                        },
                        child: CustomTextFormField(
                            controller: dateGregorianController,
                            autofocus: false,
                            enabled: false,
                            hintText: "lbl_date_gregorian".tr(),
                            textInputType: TextInputType.datetime,
                            textStyle: TextStyle(fontSize: 16.v),
                            prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(16.v, 12.v, 10.v, 12.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.calendarAdd,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize),
                            ),
                            prefixConstraints: BoxConstraints(maxHeight: 48.v),
                            contentPadding: EdgeInsets.only(
                                top: 15.v, right: 30.h, bottom: 15.v)),
                      ),
                    ]))),
            bottomNavigationBar: _buildAddAddress(context)));
  }

  /// Section Widget
  Widget _buildAddAddress(BuildContext context) {
    return CustomElevatedButton(
        onTap: () {},
        text: "lbl_add_address",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  Future<Null> _selectDateGregorian(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate != null) {
        dateGregorianController.text =
            DateFormat('d-MM-y').format(selectedDate).toString();
      }
      return null;
    });
  }
}
