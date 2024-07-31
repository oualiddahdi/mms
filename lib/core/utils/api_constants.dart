import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetConnect {
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
  static String get profile => '${apiUrl}profile?userId=1';

  static Future<bool> isApiUp() async {
    try {
      final response = await http.get(Uri.parse('${_baseUrl}status'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  static Future<void> fetchData(String endpoint) async {
    if (await _isConnected()) {
      try {
        final response = await http.get(Uri.parse('$_baseUrl$endpoint'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          // Handle the data
        } else {
          Get.snackbar('Error', 'Server responded with status code: ${response.statusCode}');
          _handleApiError(response.statusCode);
        }
      } catch (e) {
        print('Error: $e');
        Get.snackbar('Error', 'An error occurred while fetching data.');
        _handleApiError(-1);  // Pass a specific error code or use a generic one
      }
    } else {
      Get.snackbar('No Internet', 'Please check your network connection.');
      _handleApiError(-2);  // -2 for no internet
    }
  }

  static Future<bool> _isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static void _handleApiError(int errorCode) {
    switch (errorCode) {
      case 401:
        Get.offNamed('/login');  // Redirect to login
        break;
      case 404:
        Get.snackbar('Error', 'Resource not found.');
        break;
      case 500:
        Get.snackbar('Error', 'Server error occurred.');
        break;
      case -1:
        Get.snackbar('Error', 'Network error occurred.');
        break;
      case -2:
        Get.snackbar('No Internet', 'No internet connection.');
        break;
      default:
        Get.snackbar('Error', 'An unexpected error occurred.');
    }
  }
}
