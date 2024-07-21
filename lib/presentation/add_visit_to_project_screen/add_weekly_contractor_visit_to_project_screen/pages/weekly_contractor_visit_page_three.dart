import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/core/utils/sizes.dart';
import 'package:project_portal/widgets/custom_text_form_field.dart';

import '../controllers/add_weekly_contractor_visit_to_project_controller.dart';

class WeeklyContractorVisitPageThree extends StatefulWidget {
  const WeeklyContractorVisitPageThree({Key? key}) : super(key: key);

  @override
  _WeeklyContractorVisitPageThreeState createState() =>
      _WeeklyContractorVisitPageThreeState();
}

class _WeeklyContractorVisitPageThreeState
    extends State<WeeklyContractorVisitPageThree> {
  final controller = Get.find<AddWeeklyContractorVisitToProjectController>();

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
              Text(
                '${'الموارد'.tr()} ( 3 / 6 )',
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
                        'مدير ادارة المشروعات'.tr() + ' * ',
                        style: const TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(largePaddingSize),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(mediumBorderSize)),
                        color: ColorConstant.primaryColor,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                              child: CustomTextFormField(
                                  controller:
                                      controller.projectManagementManagerValue,
                                  autofocus: false,
                                  hintText: "0".tr(),
                                  textInputType: TextInputType.number,
                                  prefixConstraints:
                                      BoxConstraints(maxHeight: 48.v),
                                  contentPadding: EdgeInsets.only(
                                      top: 15.v, right: 30.h, bottom: 15.v))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'مدير الشئون الفنية'.tr() + ' * ',
                        style: const TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(largePaddingSize),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(mediumBorderSize)),
                        color: ColorConstant.primaryColor,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                              child: CustomTextFormField(
                                  controller: controller
                                      .directorOfTechnicalAffairsValue,
                                  autofocus: false,
                                  hintText: "0".tr(),
                                  textInputType: TextInputType.number,
                                  prefixConstraints:
                                      BoxConstraints(maxHeight: 48.v),
                                  contentPadding: EdgeInsets.only(
                                      top: 15.v, right: 30.h, bottom: 15.v))),
                        ],
                      ),
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
