import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_safety_visit_to_project_screen%20copy/controllers/add_safety_visit_to_project_controller.dart';
import 'package:project/widgets/custom_radio_button_list_tile.dart';

class SafetyVisitPageFirst extends StatefulWidget {
  const SafetyVisitPageFirst({Key? key}) : super(key: key);

  @override
  _SafetyVisitPageFirstState createState() => _SafetyVisitPageFirstState();
}

class _SafetyVisitPageFirstState extends State<SafetyVisitPageFirst> {
  final controller = Get.find<AddSafetyVisitToProjectController>();

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
                  '${'احتياطات السلامة'.tr} ( 2 / 3 )',
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
                title: 'كاميرات مراقبة',
                value: controller.surveillanceCamerasValue,
                onChanged: (value) {
                  setState(() {
                    controller.surveillanceCamerasValue = value;
                  });
                },
              ),

              // Widget for First Aid
              buildRadioButtonGroup(
                title: 'اسعافات اولية',
                value: controller.firstAidValue,
                onChanged: (value) {
                  setState(() {
                    controller.firstAidValue = value;
                  });
                },
              ),

              // Widget for Temporary Fence
              buildRadioButtonGroup(
                title: 'السور المؤقت حول المشروع',
                value: controller.temporaryFenceValue,
                onChanged: (value) {
                  setState(() {
                    controller.temporaryFenceValue = value;
                  });
                },
              ),

              // Widget for Entry/Exit Gates
              buildRadioButtonGroup(
                title: 'بوابات الدخول و الخروج',
                value: controller.entryExitGatesValue,
                onChanged: (value) {
                  setState(() {
                    controller.entryExitGatesValue = value;
                  });
                },
              ),

              // Widget for On-Duty Guard
              buildRadioButtonGroup(
                title: 'الحراسة اثناء وقت الدوام',
                value: controller.onDutyGuardValue,
                onChanged: (value) {
                  setState(() {
                    controller.onDutyGuardValue = value;
                  });
                },
              ),

              // Widget for Off-Duty Guard
              buildRadioButtonGroup(
                title: 'الحراسة خارج وقت الدوام',
                value: controller.offDutyGuardValue,
                onChanged: (value) {
                  setState(() {
                    controller.offDutyGuardValue = value;
                  });
                },
              ),

              // Widget for Off-Duty Guard
              buildRadioButtonGroup(
                title: 'لوحة السلامة اولا بالمدخل',
                value: controller.entranceSafetyBoardValue ,
                onChanged: (value) {
                  setState(() {
                    controller.entranceSafetyBoardValue  = value;
                  });
                },
              ),

              // Widget for Off-Duty Guard
              buildRadioButtonGroup(
                title: 'سلامة العمال في الموقع',
                value: controller.siteWorkersSafetyValue ,
                onChanged: (value) {
                  setState(() {
                    controller.siteWorkersSafetyValue  = value;
                  });
                },
              ),

              // Widget for Off-Duty Guard
              buildRadioButtonGroup(
                title: 'سلامة الموقع العام',
                value: controller.generalSiteSafetyValue ,
                onChanged: (value) {
                  setState(() {
                    controller.generalSiteSafetyValue  = value;
                  });
                },
              ),

              // Widget for Off-Duty Guard
              buildRadioButtonGroup(
                title: 'حماية الشرفات العالية والحفر',
                value: controller.highPlatformProtectionValue ,
                onChanged: (value) {
                  setState(() {
                    controller.highPlatformProtectionValue  = value;
                  });
                },
              ),

              // Widget for Off-Duty Guard
              buildRadioButtonGroup(
                title: 'الطرقات والممرات الامنية',
                value: controller.safePassagesValue,
                onChanged: (value) {
                  setState(() {
                    controller.safePassagesValue = value;
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
