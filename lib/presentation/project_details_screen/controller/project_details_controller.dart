import 'package:get/get.dart';
import 'package:project_portal/model/projects/projects.dart';
import 'package:project_portal/routes/app_routes.dart';

class ProjectDetailsModel {}

class ProjectDetailsController extends GetxController {
  void onOnTapVisitsToProjectDetailsScreen(Project project) {
    Get.toNamed(AppRoutes.visitsToProjectDetailsScreen, arguments: project);
  }

  void onOnTapQuantityScheduleScreenScreen(Project project) {
    Get.toNamed(AppRoutes.quantityScheduleScreenScreen, arguments: project);
  }

  String getType(List<CatList>? categories, int categoryId) {
    if (categories != null) {
      for (var category in categories) {
        if (category.categoryId == categoryId) {
          return category.categoryName;
        }
      }
    }
    return "Unknown";
  }

  String getOwners(List<Owner>? owners, int deptId) {
    if (owners != null) {
      for (var owner in owners) {
        if (owner.deptId == deptId) {
          return owner.nameEng;
        }
      }
    }
    return "Unknown";
  }
}
