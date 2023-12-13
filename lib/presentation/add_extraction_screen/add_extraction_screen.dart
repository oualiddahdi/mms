import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/widgets/custom_elevated_button.dart';



class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {



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
                    padding: EdgeInsets.symmetric(vertical: 10.v),
                    child: Column(children: [
                      SizedBox(height: 29.v),



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
}