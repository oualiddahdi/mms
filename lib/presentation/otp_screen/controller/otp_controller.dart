import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/errors/exceptions.dart';
import 'package:project_portal/core/network/network_info.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/logger.dart';
import 'package:project_portal/core/utils/progress_dialog_utils.dart';
import 'package:project_portal/presentation/home_page/home_page.dart';
import 'package:project_portal/presentation/login_screen/models/login/post_login_resp.dart';
import 'package:project_portal/routes/app_routes.dart';

import '../../../core/utils/pref_utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpModel {}

class OtpController extends GetxController {
  late Map<String, String> mBody;

  @override
  void onInit() {
    super.onInit();
    mBody = Get.arguments as Map<String, String>;
  }

  void onTapOtp(String otp, BuildContext context) async {
    final body = {
      'username': mBody['username'],
      'password': mBody['password'],
      'otp': otp,
    };

    // Check for empty fields
    if (otp == '') {
      Get.rawSnackbar(message: 'OTP must not be empty.');
      return;
    }

    try {
      ProgressDialogUtils.showProgressDialog();
      await fetchOtp(body);
      onOnTapOtpSuccess();
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog();
      // Handle generic errors
      Get.rawSnackbar(message: 'An error occurred. Please try again.');
    } finally {
      ProgressDialogUtils.hideProgressDialog();
    }
  }

  Future<void> fetchOtp(body) async {
    await NetworkUtil.isNetworkAvailable();

    http.Response response = await http.post(
      Uri.parse(ApiService.otpUrl),
      body: body,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData["token"];

      _handleCreateLoginSuccess(token);
    } else {
      throw response.body != null
          ? PostLoginResp.fromJson(json.decode(response.body))
          : 'Something Went Wrong!';
    }
  }

  void _handleCreateLoginSuccess(String token) {
    Get.find<PrefUtils>().setToken(token);
  }

  void onOnTapOtpSuccess() {
    Get.offAll(const HomePage());
  }
}
