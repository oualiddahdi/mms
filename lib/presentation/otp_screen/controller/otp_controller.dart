import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/presentation/login_screen/models/login/post_login_resp.dart';

class OtpModel {}

class OtpController extends GetxController {
  Rx<OtpModel> signInModelObj = OtpModel().obs;

  late final postLoginResp ;

  @override
  void onInit() {
    super.onInit();
     postLoginResp = Get.arguments as PostLoginResp; // تحديد نوع البيانات المتوقعة
  }

}
