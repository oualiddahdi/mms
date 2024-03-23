import 'package:get/get.dart';
import 'package:project/presentation/visits_to_project_screen/controllers/visits_to_project_controller.dart';

class VisitsToProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VisitsToProjectDetailsController());
  }
}
