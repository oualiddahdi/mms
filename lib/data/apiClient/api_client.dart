import 'dart:convert';

import 'package:get/get.dart';

import '../../core/errors/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/logger.dart';
import '../../core/utils/progress_dialog_utils.dart';
import '../models/login/post_login_resp.dart';

import 'package:http/http.dart' as http;

class ApiClient extends GetConnect {
  var url = "https://api.faster.sa:5000/api/";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(http.Response response) {
    return response.isRedirect;
  }

  Future<PostLoginResp> createLogin(requestData) async {

    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      http.Response response = await http.post(
        Uri.parse('${url}/provider/identity/login'),
        body: requestData,
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostLoginResp.fromJson(json.decode(response.body));
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
}
