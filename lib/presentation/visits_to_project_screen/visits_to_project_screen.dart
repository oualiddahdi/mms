import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/visits_to_project_screen/controllers/visits_to_project_controller.dart';
import 'package:project/widgets/custom_app_bar.dart';
import 'package:get/instance_manager.dart';
import 'package:project/widgets/custom_image_view.dart';

import '../../routes/app_routes.dart';

class VisitsToProjectDetailsScreen extends StatefulWidget {
  const VisitsToProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  State<VisitsToProjectDetailsScreen> createState() =>
      _VisitsToProjectDetailsScreenState();
}

class _VisitsToProjectDetailsScreenState
    extends State<VisitsToProjectDetailsScreen> {
  final VisitsToProjectDetailsController controller =
      Get.put(VisitsToProjectDetailsController());

  final jobRoleCtrl = TextEditingController();

  final itemSections = [
    'periodic_visit'.tr(),
    'surprise_visit'.tr(),
    'safety_visit'.tr(),
    'daily_visit'.tr(),
    'weekly_contractor_visit'.tr(),
    'aesthetic_visit'.tr()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          title: '${'visits'.tr()} (${controller.project.contractName})',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CustomDropdown(
                          listItemStyle: TextStyle(fontSize: 12.v),
                          items: itemSections,
                          hintText: 'types_of_visits'.tr(),
                          hintStyle: TextStyle(fontSize: 12.v),
                          controller: jobRoleCtrl,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        onTap: () {
                          _buildBottomMaterialDialog();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'add_a_visit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ).tr(),
                              const Icon(Icons.visibility,
                                  color: ColorConstant.whiteA700),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }

  void _buildBottomMaterialDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // تحديد هذه الخاصية ليتم التحكم في التمرير وعدم تجاوز حدود الشاشة
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: ColorConstant.whiteA700,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildListTile('weekly_visit', ImageConstant.imgWeekly_visit,AppRoutes.loginScreen),
                buildListTile(
                    'periodic_visit', ImageConstant.imgPeriodic_visit,AppRoutes.addPeriodicVisitToProjectScreen),
                buildListTile(
                    'surprise_visit', ImageConstant.imgSurprise_visit,AppRoutes.loginScreen),
                buildListTile('safety_visit', ImageConstant.imgSafety_visit,AppRoutes.loginScreen),
                buildListTile('daily_visit', ImageConstant.imgDaily_visit,AppRoutes.loginScreen),
                buildListTile('weekly_contractor_visit',
                    ImageConstant.imgWeekly_contractor_visit,AppRoutes.loginScreen),
                buildListTile(
                    'aesthetic_visit', ImageConstant.imgAesthetic_visit,AppRoutes.loginScreen),
                const SizedBox(height: 16.0),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: buildListTile('cancel', ImageConstant.imgCancel,AppRoutes.loginScreen),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Padding buildListTile(String titleKey, image, screen) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: CustomImageView(imagePath: image),
        title: Text(titleKey).tr(),
        onTap: () {
          Get.find<VisitsToProjectDetailsController>().goToSecondPage(screen);
        },
      ),
    );
  }



}
