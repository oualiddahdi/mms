import 'package:get/get.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_daily_visit_to_project_screen/controllers/add_daily_visit_to_project_controller.dart';

class AddDailyVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddDailyVisitToProjectController());
  }
}
