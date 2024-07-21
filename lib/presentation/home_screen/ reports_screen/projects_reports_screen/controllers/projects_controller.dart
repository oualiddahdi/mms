import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/pref_utils.dart';
import 'package:project_portal/model/projects/projects.dart';

class ProjectsController extends GetxController {
  final Dio _dio = Dio();

  Future<Projects> fetchAndSaveProjects() async {
    try {
      final token = Get.find<PrefUtils>().getToken();

      final response = await _dio.get(
        ApiConstants.projectsUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        // Debug the response data
        print('Response data: $responseData');

        // Convert the response data directly to Projects
        final Projects projects = Projects.fromJson(responseData);

        print('Projects object: $projects');

        return projects;
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

  String getStatusName(List<ProjectStatus>? projects, int projectStatusId) {
    if (projects != null) {
      for (var project in projects) {
        if (project.statusId == projectStatusId) {
          return project.statusName;
        }
      }
    }
    return "Unknown";
  }
}
