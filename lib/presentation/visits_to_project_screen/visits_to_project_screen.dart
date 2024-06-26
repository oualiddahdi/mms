import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/core/utils/sizes.dart';
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
          showMoreIcon: false,
          onMorePressed: (){

          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(smallPaddingSize),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(smallPaddingSize),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: smallPaddingSize),
                        child: CustomDropdown(
                          listItemStyle: const TextStyle(fontSize: smallFontSize),
                          items: itemSections,
                          hintText: 'types_of_visits'.tr(),
                          hintStyle: const TextStyle(fontSize: smallFontSize),
                          controller: jobRoleCtrl,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(smallPaddingSize),
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(smallPaddingSize),
                      ),
                      child: InkWell(
                        onTap: () {
                          _buildBottomMaterialDialog();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(largePaddingSize),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'add_a_visit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: smallFontSize),
                              ).tr(),
                              const Icon(Icons.add,
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
              borderRadius: BorderRadius.all(Radius.circular(largeBorderSize)),
              color: ColorConstant.whiteA700,
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildListTile('weekly_visit', ImageConstant.imgWeekly_visit,
                    AppRoutes.addWeeklyVisitToProject),

                buildListTile('periodic_visit', ImageConstant.imgPeriodic_visit,
                    AppRoutes.addPeriodicVisitToProjectScreen),

                buildListTile('surprise_visit', ImageConstant.imgSurprise_visit,
                    AppRoutes.addUnplannedVisitToProjectScreen),

                buildListTile('safety_visit', ImageConstant.imgSafety_visit,
                    AppRoutes.addSafetyVisitToProjectScreen),

                buildListTile('daily_visit', ImageConstant.imgDaily_visit,
                    AppRoutes.addDailyVisitToProject),

                buildListTile(
                    'weekly_contractor_visit',
                    ImageConstant.imgWeekly_contractor_visit,
                    AppRoutes.addWeeklyContractorVisitToProject),

                buildListTile('aesthetic_visit',
                    ImageConstant.imgAesthetic_visit, AppRoutes.addAestheticVisitToProject),

                const SizedBox(height: smallBorderSize),
                Container(
                  padding: const EdgeInsets.all(smallPaddingSize),

                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(smallBorderSize))),
                  child: buildListTile(
                      'cancel', ImageConstant.imgCancel, AppRoutes.loginScreen),
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
      padding: const EdgeInsets.all(smallPaddingSize),
      child: ListTile(
        leading: CustomImageView(imagePath: image),
        title: Text(titleKey,style: const TextStyle(fontSize: smallFontSize),).tr(),
        onTap: () {
          Get.find<VisitsToProjectDetailsController>().goToSecondPage(screen);
        },
      ),
    );
  }
}
