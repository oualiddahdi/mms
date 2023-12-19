import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';
class SplashModel {}

class GetStartedController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;


  // Function to navigate to the second page
  void goToSecondPage() {
    Get.offNamed(
      AppRoutes.loginScreen,
    );
  }



}
