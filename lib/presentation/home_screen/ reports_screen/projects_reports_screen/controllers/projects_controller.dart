import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/api_constants.dart';
import 'package:project/core/utils/shared_preferences_manager.dart';
import 'package:project/presentation/home_screen/%20reports_screen/projects_reports_screen/model/projects/projects/project_status.dart';
import 'package:project/presentation/home_screen/%20reports_screen/projects_reports_screen/model/projects/projects/projects.dart';
import 'package:project/routes/app_routes.dart';

class ProjectsController extends GetxController {
  final Dio _dio = Dio();
  late final SecureStorageManager _storageManager; // تم تعديل هنا

  // Constructor
  ProjectsController() {
    _storageManager = SecureStorageManager(); // تم تعديل هنا
  }


  Future<Projects> fetchAndSaveProjects() async {
    try {
      await _storageManager.saveToken('23drqwes2334fdfd!dfd');
      final token = await _storageManager.getToken();
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
        final Projects projects = Projects.fromJson(responseData);

        return projects;
      } else {
        print('Failed to load projects. Status code: ${response.statusCode}');
        throw Exception('Failed to load projects. Status code: ${response.statusCode}');
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
