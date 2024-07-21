import 'package:get/get.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_weekly_visit_to_project_screen/controllers/add_weekly_visit_to_project_controller.dart';

class AddWeeklyVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddWeeklyVisitToProjectController());
  }
}
