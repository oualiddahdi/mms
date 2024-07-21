import 'package:get/get.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_safety_visit_to_project_screen%20copy/controllers/add_safety_visit_to_project_controller.dart';

class AddSafetyVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddSafetyVisitToProjectController());
  }
}
