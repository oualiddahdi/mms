import 'package:get/get.dart';

import '../controllers/add_periodic_visit_to_project_controller.dart';


class AddPeriodicVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPeriodicVisitToProjectController());
  }
}
