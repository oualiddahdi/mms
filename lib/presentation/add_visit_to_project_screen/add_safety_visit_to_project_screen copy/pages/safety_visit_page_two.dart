import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/sizes.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_safety_visit_to_project_screen%20copy/controllers/add_safety_visit_to_project_controller.dart';
import 'package:project_portal/widgets/custom_radio_button_list_tile.dart';

class SafetyVisitPageTwo extends StatefulWidget {
  const SafetyVisitPageTwo({Key? key}) : super(key: key);

  @override
  _SafetyVisitPageTwoState createState() => _SafetyVisitPageTwoState();
}

class _SafetyVisitPageTwoState extends State<SafetyVisitPageTwo> {
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
                  '${'احتياطات الامن'.tr()} ( 2 / 3 )',
                  style: const TextStyle(
                      color: ColorConstant.black900, fontSize: 14),
                ),
              ),
              buildRadioButtonGroup(
                title: 'مراقب مكلف بالمتابعة',
                value: controller.monitorResponsibleValue,
                onChanged: (value) {
                  setState(() {
                    controller.monitorResponsibleValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'الادوية والاسعافات الاولية',
                value: controller.firstAidSuppliesValue,
                onChanged: (value) {
                  setState(() {
                    controller.firstAidSuppliesValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'خوذة الرأس',
                value: controller.helmetValue,
                onChanged: (value) {
                  setState(() {
                    controller.helmetValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'حذاء السلامة',
                value: controller.safetyShoesValue,
                onChanged: (value) {
                  setState(() {
                    controller.safetyShoesValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'واقي اليد',
                value: controller.safetyGlovesValue,
                onChanged: (value) {
                  setState(() {
                    controller.safetyGlovesValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'لوحة السلامة اولا بالمدخل',
                value: controller.safetyFirstSignValue,
                onChanged: (value) {
                  setState(() {
                    controller.safetyFirstSignValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'بدلات العمل',
                value: controller.workUniformsValue,
                onChanged: (value) {
                  setState(() {
                    controller.workUniformsValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'طفايات الحريق',
                value: controller.fireExtinguishersValue,
                onChanged: (value) {
                  setState(() {
                    controller.fireExtinguishersValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'الطرقات والممرات الامنة',
                value: controller.safeRoadsAndPassagesValue,
                onChanged: (value) {
                  setState(() {
                    controller.safeRoadsAndPassagesValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'استراحة للعاملين',
                value: controller.restAreaValue,
                onChanged: (value) {
                  setState(() {
                    controller.restAreaValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'اماكن خاصة للتشوين',
                value: controller.chargingAreasValue,
                onChanged: (value) {
                  setState(() {
                    controller.chargingAreasValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'النظافة العامة',
                value: controller.generalCleanlinessValue,
                onChanged: (value) {
                  setState(() {
                    controller.generalCleanlinessValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'سيارات للحالات الاسعافية',
                value: controller.emergencyVehiclesValue,
                onChanged: (value) {
                  setState(() {
                    controller.emergencyVehiclesValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'مستوصف معتمد للعلاج',
                value: controller.certifiedClinicValue,
                onChanged: (value) {
                  setState(() {
                    controller.certifiedClinicValue = value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'حماية الشرفات العالية والحفر',
                value: controller.protectionOfHighBalconiesAndExcavationsValue,
                onChanged: (value) {
                  setState(() {
                    controller.protectionOfHighBalconiesAndExcavationsValue =
                        value;
                  });
                },
              ),
              buildRadioButtonGroup(
                title: 'اللوحات الارشادية',
                value: controller.directionalSignsValue,
                onChanged: (value) {
                  setState(() {
                    controller.directionalSignsValue = value;
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
              style: const TextStyle(
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
