import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/errors/exceptions.dart';
import 'package:project/core/utils/delight_toast_bar.dart';
import 'package:project/presentation/home_page/home_page.dart';
import 'package:project/routes/app_routes.dart';

import '../../../core/utils/pref_utils.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/login/post_login_resp.dart';

class LoginModel {}

class LoginController extends GetxController {


  Rx<LoginModel> signInModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;

  PostLoginResp postLoginResp = PostLoginResp();


  Future<void> callCreateLogin(Map req) async {

    try {
      postLoginResp = await Get.find<ApiClient>().createLogin(
        req,
      );

      _handleCreateLoginSuccess();
    } on PostLoginResp catch (e) {
      postLoginResp = e;

      rethrow;
    }
  }

  void onTapSignIn(username,password,context) async {

    Get.to(HomePage());

    final postLoginReq = {
      "username": username,
      "password": password
    };

    try {
      await callCreateLogin(
        postLoginReq,
      );

      Get.find<LoginController>().onOnTapSignInSuccess();

    } on PostLoginResp {
      DelightToast.onOnTapSignInError(context);
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _handleCreateLoginSuccess() {
    Get.find<PrefUtils>().setToken(postLoginResp.data!.token!.toString());
  }

  void onOnTapSignInSuccess() {
    Get.offNamed(AppRoutes.homePage, arguments: {});
  }

  void onOnTapForgotPasswordScreen() {
    Get.toNamed(AppRoutes.forgotPasswordScreen, arguments: {});
  }

}
