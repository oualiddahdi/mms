import 'package:get/get.dart';

class ApiConstants extends GetConnect {

  static const String apiUrl =
      'http://192.168.100.250:8080/manageProjects/api/';

  static const String projectsUrl = '${apiUrl}projects';
  static const String loginUrl = '${apiUrl}login';
  static const String otpUrl = '${apiUrl}otp';

}
