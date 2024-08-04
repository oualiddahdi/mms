import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/errors/exceptions.dart';
import 'package:project_portal/core/network/network_info.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/logger.dart';
import 'package:project_portal/core/utils/pref_utils.dart';
import 'package:project_portal/core/utils/progress_dialog_utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_portal/presentation/login_screen/models/login/post_login_resp.dart';
import 'package:project_portal/routes/app_routes.dart';

class RecoverPasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void onTapChangePassword() async {
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'New password and confirm password do not match');
      return;
    }

    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;

    try {
      await changePassword(currentPassword, newPassword);
    } on PostLoginResp {
      Get.rawSnackbar(message: 'An error occurred. Please try again.');
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      Get.rawSnackbar(message: 'An unexpected error occurred. Please try again.');
    }
  }

  Future<void> changePassword(String currentPassword, String newPassword) async {
    try {
      ProgressDialogUtils.showProgressDialog();
      await NetworkUtil.isNetworkAvailable();
      final token = Get.find<PrefUtils>().getToken();

      final url = Uri.parse('${ApiService.changePassword}?currentPassword=$currentPassword&newPassword=$newPassword');

      final headers = {
        'Authorization': 'Bearer $token',
      };

      http.Response response = await http.get(url, headers: headers);

      ProgressDialogUtils.hideProgressDialog();
      if (response.statusCode == 200) {
        _handleChangePasswordSuccess();
      } else {
        throw PostLoginResp.fromJson(json.decode(response.body));
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  void _handleChangePasswordSuccess() {
    Get.snackbar('Success', 'Password changed successfully');
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
