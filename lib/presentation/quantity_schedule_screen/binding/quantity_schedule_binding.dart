import 'package:get/get.dart';
import 'package:project_portal/presentation/quantity_schedule_screen/controller/quantity_schedule_controller.dart';

class QuantityScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuantityScheduleController());
  }
}
