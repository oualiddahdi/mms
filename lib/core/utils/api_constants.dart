import 'package:get/get.dart';

class ApiConstants extends GetConnect {

  static const String apiUrl =
      'http://192.168.100.250:8080/manageProjects/api/';

  static const String apiUrlDoc =
      'http://192.168.100.250:8080/manageProjects/';


  static const String loginUrl = '${apiUrl}login';
  static const String otpUrl = '${apiUrl}otp';

  static const String projectsUrl = '${apiUrl}projects';

  static const String visits = '${apiUrl}visits';
  static const String visitType = '${apiUrl}visitType';

}
