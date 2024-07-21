import 'package:get/get.dart';
import 'package:project_portal/core/errors/exceptions.dart';
import 'package:project_portal/core/network/network_info.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/delight_toast_bar.dart';
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

  void onTapOtp(otp, context) async {
    final body = {
      'username': mBody['username'],
      'password': mBody['password'],
      'otp': otp,
    };

    try {
      await fetchOtp(body);
      onOnTapOtpSuccess();
    } on PostLoginResp {
      DelightToast.onOnTapSignInError(context);
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  Future<void> fetchOtp(body) async {
    try {
      ProgressDialogUtils.showProgressDialog();
      await NetworkUtil.isNetworkAvailable();

      http.Response response = await http.post(
        Uri.parse(ApiConstants.otpUrl),
        body: body,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData["token"];

        _handleCreateLoginSuccess(token);
      } else {
        throw response.body != null
            ? PostLoginResp.fromJson(json.decode(response.body))
            : 'Something Went Wrong!';
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

  void _handleCreateLoginSuccess(token) {
    if (token != null) {
      Get.find<PrefUtils>().setToken(token.toString());
    }
  }

  void onOnTapOtpSuccess() {
    Get.offAll(const HomePage());
  }
}
