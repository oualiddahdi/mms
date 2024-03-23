import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/api_constants.dart';
import 'package:project/core/utils/pref_utils.dart';

import 'package:project/model/projects/projects.dart';

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

        // تحويل البيانات المسترجعة إلى كائن Projects
        final responseDataJson = json.decode(responseData);
        final Projects projects = Projects.fromJson(responseDataJson);

        return projects;
      } else {
        print('Failed to load projects. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to load projects. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching projects: $e');
      throw Exception('Error fetching projects: $e');
    }
  }

  // Function to find statusName using projectStatusId
  String getStatusName(List<ProjectStatus>? projects, int projectStatusId) {
    if (projects != null) {
      for (var project in projects) {
        if (project.statusId == projectStatusId) {
          return project.statusName!;
        }
      }
    }
    return "Unknown";
  }
}
