import 'package:get/get.dart';
import '../controllers/add_weekly_contractor_visit_to_project_controller.dart';

class AddWeeklyContractorVisitToProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddWeeklyContractorVisitToProjectController());
  }
}
