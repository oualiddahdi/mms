import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/widgets/custom_text_form_field.dart';

import '../controllers/add_surprise_visit_to_project_controller.dart';

class SurpriseVisitPageThree extends StatefulWidget {
  const SurpriseVisitPageThree({Key? key}) : super(key: key);

  @override
  _SurpriseVisitPageThreeState createState() => _SurpriseVisitPageThreeState();
}

class _SurpriseVisitPageThreeState extends State<SurpriseVisitPageThree> {
  final controller = Get.find<AddSurpriseVisitToProjectController>();

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
                '${'الموارد'.tr()} ( 1 / 6 )',
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
                                  controller: controller.sum,
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