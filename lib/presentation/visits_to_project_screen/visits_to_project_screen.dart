import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/visits_to_project_screen/controllers/visits_to_project_controller.dart';
import 'package:project/widgets/custom_app_bar.dart';
import 'package:get/instance_manager.dart';
import 'package:project/widgets/custom_image_view.dart';

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
                  Container(
                    width: 180,
                    height: 50,
                    margin: const EdgeInsets.all(5),
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
                  Container(
                    width: 160,
                    height: 50,

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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'types_of_visits',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ).tr(),
                            const SizedBox(width: 5),
                            const Icon(Icons.visibility,
                                color: ColorConstant.whiteA700),
                          ],
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
                buildListTile('weekly_visit', ImageConstant.imgWeekly_visit),
                buildListTile(
                    'periodic_visit', ImageConstant.imgPeriodic_visit),
                buildListTile(
                    'surprise_visit', ImageConstant.imgSurprise_visit),
                buildListTile('safety_visit', ImageConstant.imgSafety_visit),
                buildListTile('daily_visit', ImageConstant.imgDaily_visit),
                buildListTile('weekly_contractor_visit',
                    ImageConstant.imgWeekly_contractor_visit),
                buildListTile(
                    'aesthetic_visit', ImageConstant.imgAesthetic_visit),
                const SizedBox(height: 16.0),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: buildListTile('cancel', ImageConstant.imgCancel),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Padding buildListTile(String titleKey, image) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: CustomImageView(imagePath: image),
        title: Text(titleKey).tr(),
        onTap: () {
          // Add your onTap logic here
        },
      ),
    );
  }
}
