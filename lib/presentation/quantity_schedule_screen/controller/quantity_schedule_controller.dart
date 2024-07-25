import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/pref_utils.dart';
import 'package:project_portal/model/projects/projects.dart';
import 'package:project_portal/presentation/quantity_schedule_screen/models/work_items.dart';

class ProjectDetailsModel {}

class QuantityScheduleController extends GetxController {
  late final Project project;
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    project = Get.arguments as Project;
  }

  Future<WorkItems> fetchWorkItems() async {
    try {
      final token = Get.find<PrefUtils>().getToken();

      // Construct the URL dynamically if needed
      var url = ApiService.workItems;
      final response = await _dio.get(
        url,
        queryParameters: {'proj_id': 430},
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

        // Convert the response data directly to WorkItems
        final WorkItems workItems = WorkItems.fromJson(responseData);

        return workItems;
      } else {
        print('Failed to load work items. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to load work items. Status code: ${response.statusCode}');
      }
    } catch (e, s) {
      log('Error fetching work items', stackTrace: s, error: e);
      throw Exception('Error fetching work items: $e');
    }
  }
}
