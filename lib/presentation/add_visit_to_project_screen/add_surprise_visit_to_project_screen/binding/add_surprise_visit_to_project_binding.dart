import 'package:get/get.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_surprise_visit_to_project_screen/controllers/add_surprise_visit_to_project_controller.dart';

class AddSurpriseVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddSurpriseVisitToProjectController());
  }
}
