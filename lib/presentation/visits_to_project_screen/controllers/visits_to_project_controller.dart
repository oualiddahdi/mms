import 'package:get/get.dart';

import '../../home_screen/ reports_screen/projects_reports_screen/model/projects/projects/project.dart';

class VisitsToProjectDetailsController extends GetxController {
  late final Project project;

  @override
  void onInit() {
    super.onInit();
    project = Get.arguments as Project;
  }
}
