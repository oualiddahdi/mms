import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_weekly_contractor_visit_to_project_screen/controllers/add_weekly_contractor_visit_to_project_controller.dart';
import 'package:project/widgets/custom_image_view.dart';
import 'package:project/widgets/custom_text_form_field.dart';
import 'package:project/widgets/video_player.dart';

class WeeklyContractorVisitPageFive extends StatelessWidget {
  const WeeklyContractorVisitPageFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddWeeklyContractorVisitToProjectController>();

    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(mediumPaddingSize),
                child: Text(
                  '${'المرئيات'.tr} ( 5 / 6 )',
                  style: const TextStyle(
                      color: ColorConstant.black900, fontSize: 14),
                ),
              ),
              Obx(() => Container(
                    margin: const EdgeInsets.all(smallPaddingSize),
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
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'أضافة صورة',
                                style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: 14),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_box,
                                    color: ColorConstant.primaryColor),
                                onPressed: () =>
                                    controller.showImageSourceDialog(context),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: controller.images.map((image) {
                              return Image.file(
                                File(image.path),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  )),
              Obx(() => Container(
                    margin: const EdgeInsets.all(smallPaddingSize),
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
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'أضافة فيديو',
                                style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: 14),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_box,
                                    color: ColorConstant.primaryColor),
                                onPressed: () =>
                                    controller.showVideoSourceDialog(context),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: controller.videos.map((video) {
                              return VideoWidget(video: video);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                margin: const EdgeInsets.all(smallPaddingSize),
                width: double.maxFinite,
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
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'بيانات التقرير والتوقيت',
                        style: TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'وقت البدء',
                        style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: smallFontSize),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: largePaddingSize,
                          right: largePaddingSize,
                          bottom: largePaddingSize),
                      child: InkWell(
                        onTap: () {
                          controller.selectDateGregorian(
                              context, controller.startDateController);
                        },
                        child: CustomTextFormField(
                            controller: controller.startDateController,
                            autofocus: false,
                            enabled: false,
                            hintStyle: const TextStyle(fontSize: smallFontSize),
                            hintText: "Enter start date (dd-MM-yyyy)",
                            textInputType: TextInputType.datetime,
                            textStyle: const TextStyle(fontSize: smallFontSize),
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 10, 12),
                              child: CustomImageView(
                                  imagePath: ImageConstant.calendarAdd,
                                  height: largeFontSize,
                                  width: largeFontSize),
                            ),
                            prefixConstraints:
                                const BoxConstraints(maxHeight: 48),
                            contentPadding: const EdgeInsets.only(
                                top: 15, right: 30, bottom: 15)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'وقت الأنتهاء',
                        style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: smallFontSize),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: largePaddingSize,
                          right: largePaddingSize,
                          bottom: largePaddingSize),
                      child: InkWell(
                        onTap: () {
                          controller.selectDateGregorian(
                              context, controller.endDateController);
                        },
                        child: CustomTextFormField(
                            controller: controller.endDateController,
                            autofocus: false,
                            enabled: false,
                            hintStyle: const TextStyle(fontSize: smallFontSize),
                            hintText: "Enter end date (dd-MM-yyyy)",
                            textInputType: TextInputType.datetime,
                            textStyle: const TextStyle(fontSize: smallFontSize),
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 10, 12),
                              child: CustomImageView(
                                  imagePath: ImageConstant.calendarAdd,
                                  height: largeFontSize,
                                  width: largeFontSize),
                            ),
                            prefixConstraints:
                                const BoxConstraints(maxHeight: 48),
                            contentPadding: const EdgeInsets.only(
                                top: 15, right: 30, bottom: 15)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'التقرير  * ',
                        style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: smallFontSize),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: largePaddingSize,
                          right: largePaddingSize,
                          bottom: largePaddingSize),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Flexible(
                        child: CustomTextFormField(
                            controller: controller.reportVisualsController,
                            autofocus: false,
                            textInputType: TextInputType.multiline,
                            hintStyle: const TextStyle(
                              fontSize: smallFontSize,
                            ),
                            textStyle: const TextStyle(
                              fontSize: smallFontSize,
                            ),
                            maxLines: 7,
                            hintText: "",
                            prefixConstraints:
                                const BoxConstraints(maxHeight: 48),
                            contentPadding:
                                const EdgeInsets.all(largePaddingSize)),
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
