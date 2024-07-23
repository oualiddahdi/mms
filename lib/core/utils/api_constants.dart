import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConstants extends GetConnect {
  static String _baseUrl = 'http://192.168.100.250:8080/manageProjects/api/';
  static String _baseUrlDoc = 'http://192.168.100.250:8080/manageProjects/';

  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _baseUrl = prefs.getString('apiUrl') ?? _baseUrl;
    _baseUrlDoc = prefs.getString('apiUrlDoc') ?? _baseUrlDoc;
  }

  static Future<void> setBaseUrl(String newBaseUrl) async {
    final prefs = await SharedPreferences.getInstance();
    _baseUrl = newBaseUrl;
    _baseUrlDoc = newBaseUrl.replaceAll('/api/', '/'); // Adjust if necessary

    await prefs.setString('apiUrl', _baseUrl);
    await prefs.setString('apiUrlDoc', _baseUrlDoc);
  }

  static String get apiUrl => _baseUrl;
  static String get apiUrlDoc => _baseUrlDoc;

  static String get loginUrl => '${apiUrl}login';
  static String get otpUrl => '${apiUrl}otp';
  static String get projectsUrl => '${apiUrl}projects';
  static String get visits => '${apiUrl}visits';
  static String get visitType => '${apiUrl}visitType';
  static String get workItems => '${apiUrl}workItems';
}
