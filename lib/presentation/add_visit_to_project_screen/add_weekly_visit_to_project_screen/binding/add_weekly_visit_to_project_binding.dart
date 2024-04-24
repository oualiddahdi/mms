import 'package:get/get.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_weekly_visit_to_project_screen/controllers/add_weekly_visit_to_project_controller.dart';

class AddWeeklyVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddWeeklyVisitToProjectController());
  }
}
