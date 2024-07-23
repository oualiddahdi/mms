import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConstants extends GetConnect {
  static String _baseUrl = 'http://192.168.100.250:8080/manageProjects/api/';
  static const String _apiUrlDoc = 'http://192.168.100.250:8080/manageProjects/';

  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _baseUrl = prefs.getString('apiUrl') ?? _baseUrl;
  }

  static Future<void> setApiUrl(String newUrl) async {
    final prefs = await SharedPreferences.getInstance();
    _baseUrl = newUrl;
    await prefs.setString('apiUrl', newUrl);
  }

  static String get apiUrl => _baseUrl;
  static String get apiUrlDoc => _apiUrlDoc;

  static String get loginUrl => '${apiUrl}login';
  static String get otpUrl => '${apiUrl}otp';
  static String get projectsUrl => '${apiUrl}projects';
  static String get visits => '${apiUrl}visits';
  static String get visitType => '${apiUrl}visitType';
  static String get workItems => '${apiUrl}workItems';
}
