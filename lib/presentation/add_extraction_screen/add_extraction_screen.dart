import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/widgets/custom_elevated_button.dart';
import 'package:project/widgets/custom_image_view.dart';
import 'package:project/widgets/custom_text_form_field.dart';

import 'package:hijri_picker/hijri_picker.dart';


class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {

  var selectedDate = new HijriCalendar.now();

  TextEditingController dateHijriController = TextEditingController();
  TextEditingController dateGregorianController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'upload_extracts',
                style: TextStyle(
                  fontSize: 14.v,
                ),
              ).tr(),
            ),
            body: Form(
                child: Container(
                    width: double.maxFinite,
                    padding:
                    EdgeInsets.only(left: 16.v, top: 16.v, right: 16.v),
                    child: Column(children: [
                      SizedBox(height: 29.v),

                      InkWell(
                        onTap: (){
                          _selectDateHijri(context);
                        },
                        child: CustomTextFormField(
                            controller: dateHijriController,
                            autofocus: false,
                            enabled: false,
                            hintText: "lbl_date_hijri".tr(),
                            textInputType: TextInputType.datetime,
                            textStyle: TextStyle(fontSize: 16.v),
                            prefix: Container(
                                margin:
                                EdgeInsets.fromLTRB(16.v, 12.v, 10.v, 12.v),
                                child:  CustomImageView(
                                      imagePath: ImageConstant.calendarAdd,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize),
                                ),
                            prefixConstraints: BoxConstraints(maxHeight: 48.v),
                            contentPadding: EdgeInsets.only(
                                top: 15.v, right: 30.h, bottom: 15.v)),
                      ),

                      SizedBox(height: 29.v),

                      InkWell(
                        onTap: (){
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
                              child:  CustomImageView(
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
      onPressed: (){
      },
        text: "lbl_add_address",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }


  Future<Null> _selectDateHijri(BuildContext context) async {
    // Get the current Hijri date
    HijriCalendar currentDate = HijriCalendar.now();

    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate: currentDate,
      firstDate: new HijriCalendar()
        ..hYear = 1438
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        dateHijriController.text = picked.toString();
      });
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
            DateFormat('d-MM-y')
                .format(selectedDate)
                .toString();
      }
      return null;
    });

  }



}