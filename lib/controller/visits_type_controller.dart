import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/pref_utils.dart';
import 'package:project_portal/model/projects/projects.dart';
import 'package:project_portal/modules/visit_type_model.dart';
import 'package:project_portal/presentation/visits_to_project_screen/models/visits_model.dart';

class VisitsTypeController extends GetxController {
  late final Project project;
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    project = Get.arguments as Project;
  }

  Future<VisitTypeModel> fetchAndSaveVisitType() async {
    try {
      final response = await _dio.get(ApiConstants.visitType);

      if (response.statusCode == 200) {
        final responseData = response.data;

        // Debug the response data
        print('Response data: $responseData');

        // Convert the response data directly to Projects
        final VisitTypeModel visits = VisitTypeModel.fromJson(responseData);

        print('visits object: $visits');

        return visits;
      } else {
        print('Failed to load projects. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to load projects. Status code: ${response.statusCode}');
      }
    } catch (e, s) {
      log('Error fetching projects', stackTrace: s, error: e);
      throw Exception('Error fetching projects: $e');
    }
  }

  // Function to navigate to the second page
  void goToSecondPage(screen) {
    Get.offNamed(screen, arguments: project);
  }
}
