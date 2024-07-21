import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/core/utils/sizes.dart';
import 'package:project_portal/widgets/custom_check_boxes.dart';
import 'package:project_portal/widgets/custom_text_form_field.dart';

import '../controllers/add_aesthetic_visit_to_project_controller.dart';

class AestheticVisitPageFour extends StatefulWidget {
  const AestheticVisitPageFour({Key? key}) : super(key: key);

  @override
  _AestheticVisitPageFourState createState() => _AestheticVisitPageFourState();
}

class _AestheticVisitPageFourState extends State<AestheticVisitPageFour> {
  final controller = Get.find<AddAestheticVisitToProjectController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reasons for Delay',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: Colors
                        .orange, // Example color, replace with your color constant
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: CustomCheckBoxes(
                                value: 1,
                                groupValue: controller.groupValue1,
                                title: 'Intentional delay',
                                onChanged: (value) {
                                  setState(() {
                                    controller.groupValue1 =
                                        value; // Update the state
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: CustomCheckBoxes(
                                value: 2,
                                groupValue: controller.groupValue1,
                                title: 'Approval delays',
                                onChanged: (value) {
                                  setState(() {
                                    controller.groupValue1 =
                                        value; // Update the state
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: CustomCheckBoxes(
                                value: 3,
                                groupValue: controller.groupValue1,
                                title: 'Heavy rainfalls',
                                onChanged: (value) {
                                  setState(() {
                                    controller.groupValue1 =
                                        value; // Update the state
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: CustomCheckBoxes(
                                value: 4,
                                groupValue: controller.groupValue1,
                                title: 'Others',
                                onChanged: (value) {
                                  setState(() {
                                    controller.groupValue1 =
                                        value; // Update the state
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Flexible(
                  child: CustomTextFormField(
                      controller: controller.comment,
                      autofocus: false,
                      textInputType: TextInputType.multiline,
                      hintText: "أضافة تعليق".tr(),
                      hintStyle: const TextStyle(
                        fontSize: smallFontSize,
                      ),
                      textStyle: const TextStyle(
                        fontSize: smallFontSize,
                      ),
                      maxLines: 7,
                      prefixConstraints: BoxConstraints(maxHeight: 48.v),
                      contentPadding: const EdgeInsets.all(largePaddingSize)),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Flexible(
                  child: CustomTextFormField(
                      controller: controller.actionsRemoveDelaysCauses,
                      autofocus: false,
                      textInputType: TextInputType.multiline,
                      hintText: "الاجراءات المتخذة لازالة اسباب التأخر".tr(),
                      hintStyle: const TextStyle(
                        fontSize: smallFontSize,
                      ),
                      textStyle: const TextStyle(
                        fontSize: smallFontSize,
                      ),
                      maxLines: 7,
                      prefixConstraints: BoxConstraints(maxHeight: 48.v),
                      contentPadding: const EdgeInsets.all(largePaddingSize)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
