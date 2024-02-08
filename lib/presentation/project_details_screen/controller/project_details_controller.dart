import 'package:get/get.dart';
import 'package:project/presentation/home_screen/%20reports_screen/projects_reports_screen/model/projects/projects/project.dart';
import 'package:project/routes/app_routes.dart';

class ProjectDetailsModel {}

class ProjectDetailsController extends GetxController {



  void onOnTapVisitsToProjectDetailsScreen(Project project) {
    Get.toNamed(AppRoutes.visitsToProjectDetailsScreen, arguments: project);
  }


}
