import 'package:get/get.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_unplanned_visit_to_project_screen/controllers/add_unplanned_visit_to_project_controller.dart';


class AddUnplannedVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddUnplannedVisitToProjectController());
  }
}
