import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/pref_utils.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/login/post_login_resp.dart';

class LoginModel {}

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> signInModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;

  PostLoginResp postLoginResp = PostLoginResp();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

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

  void _handleCreateLoginSuccess() {
    Get.find<PrefUtils>().setToken(postLoginResp.data!.token!.toString());
  }
}
