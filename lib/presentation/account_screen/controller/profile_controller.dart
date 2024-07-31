import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/presentation/account_screen/models/profile_model.dart';

import '../../../core/utils/pref_utils.dart';

class ProfileController extends GetxController {
  final Dio _dio = Dio();

  Future<ProfileModel> fetchAndSaveProfile() async {
    try {
      final token = Get.find<PrefUtils>().getToken();

      final response = await _dio.get(
        ApiService.profile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        // Debug the response data
        log('Response data: $responseData');

        // Convert the response data directly to ProfileModel
        final ProfileModel profileModel = ProfileModel.fromJson(responseData);

        log('Profile object: $profileModel');

        return profileModel;
      } else {
        log('Failed to load profile. Status code: ${response.statusCode}');
        throw Exception('Failed to load profile. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      log('Dio error fetching profile', error: e, stackTrace: e.stackTrace);
      if (e.response != null) {
        log('Response data: ${e.response?.data}');
      }
      throw Exception('Error fetching profile: ${e.message}');
    } catch (e, s) {
      log('Error fetching profile', stackTrace: s, error: e);
      throw Exception('Error fetching profile: $e');
    }
  }
}
