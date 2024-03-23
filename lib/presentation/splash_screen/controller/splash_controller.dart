import 'package:get/get.dart';
import 'package:project/core/utils/pref_utils.dart';
import 'package:project/presentation/home_page/home_page.dart';
import 'package:project/routes/app_routes.dart';

class SplashModel {}

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      final token = Get.find<PrefUtils>().getToken();
      if (token.isNotEmpty) {
        onTokenExists();
      } else {
        Get.offNamed(AppRoutes.getStartedScreen);
      }
    });
  }

  void onTokenExists() {
    Get.offAll(const HomePage());
  }
}
