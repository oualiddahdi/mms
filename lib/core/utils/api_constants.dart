import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiConstants extends GetConnect {
  // static const String apiUrl = 'http://192.168.100.250:8080/manageProjects/api/';
  static const String apiUrl = 'http://192.168.100.169:8080/manageProjects/api/';

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = Duration(seconds: 60);
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  static bool isSuccessCall(http.Response response) {
    return response.isRedirect;
  }


  static const String projectsUrl = '${apiUrl}projects';

  static const String loginUrl = '${apiUrl}login';


}