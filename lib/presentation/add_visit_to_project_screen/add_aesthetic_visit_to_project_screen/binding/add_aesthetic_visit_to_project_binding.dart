import 'package:get/get.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_aesthetic_visit_to_project_screen/controllers/add_aesthetic_visit_to_project_controller.dart';

class AddAestheticVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAestheticVisitToProjectController());
  }
}
