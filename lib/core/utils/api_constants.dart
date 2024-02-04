import 'package:dio/dio.dart';

class ApiConstants {
  static const String apiUrl = 'http://192.168.100.250:8080/manageProjects/api/';
  static const String projectsUrl = '${apiUrl}projects';

  // Function to create a Dio instance with the token in the headers
  static Dio getDioWithToken(String token) {
    Dio dio = Dio();

    // Add the token to the headers
    dio.options.headers['Authorization'] = 'Bearer $token';

    return dio;
  }
}

// Example of using the Dio instance with token in your code
void fetchData(String token) async {
  try {
    Dio dio = ApiConstants.getDioWithToken(token);
    Response response = await dio.get(ApiConstants.projectsUrl);

    // Handle the response here
    print(response.data);
  } catch (error) {
    // Handle errors here
    print('Error: $error');
  }
}
