import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';

class SplashModel {}

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.getStartedScreen);
    });
  }
}
