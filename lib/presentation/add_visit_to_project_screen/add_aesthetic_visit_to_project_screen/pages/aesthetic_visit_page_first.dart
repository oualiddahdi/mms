import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_aesthetic_visit_to_project_screen/controllers/add_aesthetic_visit_to_project_controller.dart';
import 'package:project/widgets/cupertino_radio_button_list_tile.dart';
import 'package:project/widgets/custom_radio_button_list_tile.dart';

class AestheticVisitPageFirst extends StatefulWidget {
  const AestheticVisitPageFirst({Key? key}) : super(key: key);

  @override
  _AestheticVisitPageFirstState createState() =>
      _AestheticVisitPageFirstState();
}

class _AestheticVisitPageFirstState extends State<AestheticVisitPageFirst> {
  final controller = Get.find<AddAestheticVisitToProjectController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(largePaddingSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'basic_information'.tr()} ( 1 / 6 )',
                style: const TextStyle(
                    color: ColorConstant.black900, fontSize: 14),
              ),
              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                        'لوحة المشروع'.tr() + ' * ',
                        style: const TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CustomRadioButtonListTile(
                            value: 1,
                            groupValue: controller.projectPanelValue,
                            title: 'منفذة',
                            onChanged: (value) {
                              setState(() {
                                controller.projectPanelValue =
                                    value; // Update the state
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: CustomRadioButtonListTile(
                            value: 2,
                            groupValue: controller.projectPanelValue,
                            title: 'مطابقة للمواصفات',
                            onChanged: (value) {
                              setState(() {
                                controller.projectPanelValue =
                                    value; // Update the state
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                        'نظافة موقع العمل'.tr() + ' * ',
                        style: const TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(mediumPaddingSize),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(mediumBorderSize)),
                        color: ColorConstant.primaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 1,
                              groupValue: controller.siteCleanlinessValue,
                              title: 'ممتاز',
                              onChanged: (value) {
                                setState(() {
                                  controller.siteCleanlinessValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 2,
                              groupValue: controller.siteCleanlinessValue,
                              title: 'مقبول',
                              onChanged: (value) {
                                setState(() {
                                  controller.siteCleanlinessValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 3,
                              groupValue: controller.siteCleanlinessValue,
                              title: 'غير مقبول',
                              onChanged: (value) {
                                setState(() {
                                  controller.siteCleanlinessValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                        'فريق الاستشاري'.tr() + ' * ',
                        style: const TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(mediumPaddingSize),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(mediumBorderSize)),
                        color: ColorConstant.primaryColor,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 1,
                              groupValue: controller.consultantTeamValue,
                              title: 'متواجد بالكامل',
                              onChanged: (value) {
                                setState(() {
                                  controller.consultantTeamValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 2,
                              groupValue: controller.consultantTeamValue,
                              title: 'يوجد غيابات',
                              onChanged: (value) {
                                setState(() {
                                  controller.consultantTeamValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 3,
                              groupValue: controller.consultantTeamValue,
                              title: 'غير متواجد',
                              onChanged: (value) {
                                setState(() {
                                  controller.consultantTeamValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                        'مستوي مراقبة الجودة'.tr() + ' * ',
                        style: const TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(mediumPaddingSize),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(mediumBorderSize)),
                        color: ColorConstant.primaryColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 1,
                              groupValue: controller.qualityControlValue,
                              title: 'ممتاز',
                              onChanged: (value) {
                                setState(() {
                                  controller.qualityControlValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 2,
                              groupValue: controller.qualityControlValue,
                              title: 'مقبول',
                              onChanged: (value) {
                                setState(() {
                                  controller.qualityControlValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 3,
                              groupValue: controller.qualityControlValue,
                              title: 'غير مقبول',
                              onChanged: (value) {
                                setState(() {
                                  controller.qualityControlValue =
                                      value; // Update the state
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                        'القوى العاملة للمقاول'.tr() + ' * ',
                        style: const TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CustomRadioButtonListTile(
                            value: 1,
                            groupValue: controller.contractorWorkforceValue,
                            title: 'العدد كافى',
                            onChanged: (value) {
                              setState(() {
                                controller.contractorWorkforceValue =
                                    value; // Update the state
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                        'المعدات'.tr() + ' * ',
                        style: const TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CustomRadioButtonListTile(
                            value: 1,
                            groupValue: controller.equipmentValue,
                            title: 'العدد كافى',
                            onChanged: (value) {
                              setState(() {
                                controller.equipmentValue =
                                    value; // Update the state
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: ColorConstant.primaryGold,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'اعتماد العينات / المخططات',
                        style: TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SwitchListTile(
                            title: Text(controller.sampleApproval
                                ? 'متوفر'
                                : 'غير متوفر'),
                            value: controller.sampleApproval,
                            onChanged: (bool value) {
                              setState(() {
                                controller.sampleApproval = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: ColorConstant.primaryGold,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'الجداول الزمنية',
                        style: TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SwitchListTile(
                            title: Text(controller.timetableDelayed
                                ? 'متأخر'
                                : 'غير متأخر'),
                            value: controller.timetableDelayed,
                            onChanged: (bool value) {
                              setState(() {
                                controller.timetableDelayed = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
