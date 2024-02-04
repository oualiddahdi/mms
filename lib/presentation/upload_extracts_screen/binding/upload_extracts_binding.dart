import 'package:get/get.dart';

import '../controller/upload_extracts_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
