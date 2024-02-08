
import 'package:get/get.dart';
import 'package:project/core/errors/exceptions.dart';
import 'package:project/core/network/network_info.dart';
import 'package:project/core/utils/api_constants.dart';
import 'package:project/core/utils/delight_toast_bar.dart';
import 'package:project/core/utils/logger.dart';
import 'package:project/core/utils/progress_dialog_utils.dart';
import 'package:project/presentation/home_page/home_page.dart';
import 'package:project/presentation/login_screen/models/login/post_login_resp.dart';
import 'package:project/routes/app_routes.dart';

import '../../../core/utils/pref_utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class LoginModel {}

class LoginController extends GetxController {


  Rx<LoginModel> signInModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;


  void onTapSignIn(username, password, context) async {


    final body = {
      'username': 'ADMIN123',
      'password': 'Abc@1234567',
    };

    try {
      await fetchLogin(body);
      onOnTapSignInSuccess();
    } on PostLoginResp {
      DelightToast.onOnTapSignInError(context);
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  Future<void> fetchLogin(body) async {

    try {
      ProgressDialogUtils.showProgressDialog();
      await NetworkUtil.isNetworkAvailable();

      http.Response response = await http.post(
        Uri.parse(ApiConstants.loginUrl),
        body: body,
      );

      ProgressDialogUtils.hideProgressDialog();
      if ( response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _handleCreateLoginSuccess(responseData);

      } else {
        throw response.body != null
            ? PostLoginResp.fromJson(json.decode(response.body))
            : 'Something Went Wrong!';
      }

    }  catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  void _handleCreateLoginSuccess(dynamic responseData) {


    Get.toNamed(AppRoutes.otpScreen, arguments: responseData);

      // final postLoginResp = PostLoginResp.fromJson(responseData);
  //  Get.find<PrefUtils>().setToken(postLoginResp.data!.token!.toString());

  }

  void onOnTapSignInSuccess() {
    Get.offNamed(AppRoutes.homePage, arguments: {});
  }

  void onOnTapForgotPasswordScreen() {
    Get.toNamed(AppRoutes.forgotPasswordScreen, arguments: {});
  }


}
