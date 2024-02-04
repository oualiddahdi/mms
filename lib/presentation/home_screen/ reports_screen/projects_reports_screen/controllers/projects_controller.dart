import 'package:dio/dio.dart';
import 'package:project/core/utils/api_constants.dart';
import 'package:project/presentation/home_screen/%20reports_screen/projects_reports_screen/model/projects/projects/project_status.dart';
import 'package:project/presentation/home_screen/%20reports_screen/projects_reports_screen/model/projects/projects/projects.dart';

class ProjectsController {
  Future<Projects> fetchProjects(String token) async {
    try {
      Dio dio = Dio();

      // Add the token to the headers
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(ApiConstants.projectsUrl);

      if (response.statusCode == 200) {
        // Convert the dynamic list to a Projects object
        final Projects projects = Projects.fromJson(response.data);

        return projects;
      } else {
        // If there's an error in the response
        print('Failed to load projects. Status code: ${response.statusCode}');
        // Throw an exception to be caught by the catch block
        throw Exception('Failed to load projects. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // If there's an error connecting to the server
      print('Error fetching projects: $e');
      // Re-throw the exception to be caught by the caller
      throw e;
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
