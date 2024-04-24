import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_weekly_visit_to_project_screen/controllers/add_weekly_visit_to_project_controller.dart';
import 'package:project/widgets/custom_radio_button_list_tile.dart';

class WeeklyVisitPageFirst extends StatefulWidget {
  const WeeklyVisitPageFirst({Key? key}) : super(key: key);

  @override
  _WeeklyVisitPageFirstState createState() => _WeeklyVisitPageFirstState();
}

class _WeeklyVisitPageFirstState extends State<WeeklyVisitPageFirst> {
  final controller = Get.find<AddWeeklyVisitToProjectController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(largePaddingSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(mediumPaddingSize),
                child: Text(
                  '${'مراجعة بنود الزيارة'.tr} ( 2 / 1 )',
                  style: const TextStyle(
                      color: ColorConstant.black900, fontSize: 14),
                ),
              ),
              // Widget for Safety Sign
              buildRadioButtonGroup(
                title: 'اللوحة الارشادية المشروع',
                value: controller.safetySignValue,
                onChanged: (value) {
                  setState(() {
                    controller.safetySignValue = value;
                  });
                },
              ),

              // Widget for Surveillance Cameras
              buildRadioButtonGroup(
                title: 'نظافة موقع العمل',
                value: controller.workSiteCleanLinessValue,
                onChanged: (value) {
                  setState(() {
                    controller.workSiteCleanLinessValue = value;
                  });
                },
              ),

              // Widget for First Aid
              buildRadioButtonGroup(
                title: 'فريق الاستشاري',
                value: controller.consultingTeamValue,
                onChanged: (value) {
                  setState(() {
                    controller.consultingTeamValue = value;
                  });
                },
              ),

              // Widget for Temporary Fence
              buildRadioButtonGroup(
                title: 'مستوى مراقبة الجودة',
                value: controller.qualityControlLevelValue,
                onChanged: (value) {
                  setState(() {
                    controller.qualityControlLevelValue = value;
                  });
                },
              ),

              // Widget for Entry/Exit Gates
              buildRadioButtonGroup(
                title: 'القوى العاملة للمقاول',
                value: controller.contractorsWorkforceValue,
                onChanged: (value) {
                  setState(() {
                    controller.contractorsWorkforceValue = value;
                  });
                },
              ),

              // Widget for On-Duty Guard
              buildRadioButtonGroup(
                title: 'المعدات',
                value: controller.hardwareValue,
                onChanged: (value) {
                  setState(() {
                    controller.hardwareValue = value;
                  });
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioButtonGroup({
    required String title,
    required int? value,
    required ValueChanged<dynamic> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.all(smallPaddingSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorConstant.primaryGold,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(largePaddingSize),
            child: Text(
              title,
              style: TextStyle(
                color: ColorConstant.black900,
                fontSize: 14,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 1,
                child: CustomRadioButtonListTile(
                  value: 1,
                  groupValue: value,
                  title: 'يوجد',
                  onChanged: onChanged,
                ),
              ),
              Flexible(
                flex: 2,
                child: CustomRadioButtonListTile(
                  value: 2,
                  groupValue: value,
                  title: 'لا يوجد',
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
