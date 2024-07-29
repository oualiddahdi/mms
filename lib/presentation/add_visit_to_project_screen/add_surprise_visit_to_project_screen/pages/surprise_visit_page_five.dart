import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/image_constant.dart';
import 'package:project_portal/core/utils/sizes.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_surprise_visit_to_project_screen/controllers/add_surprise_visit_to_project_controller.dart';
import 'package:project_portal/widgets/custom_image_view.dart';
import 'package:project_portal/widgets/custom_text_form_field.dart';
import 'package:project_portal/widgets/video_player.dart';

class SurpriseVisitPageFive extends StatelessWidget {
  const SurpriseVisitPageFive({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddSurpriseVisitToProjectController>();

    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                'add_image',
                                style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: 14),
                              ).tr(),
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
                                'add_video',
                                style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: 14),
                              ).tr(),
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
                     Padding(
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'report_and_timing',
                        style: TextStyle(
                            color: ColorConstant.black900, fontSize: 14),
                      ).tr(),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(largePaddingSize),
                      child: const Text(
                        'start_time',
                        style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: smallFontSize),
                      ).tr(),
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
                            hintText: "enter_start_date",
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
                     Padding(
                      padding: const EdgeInsets.all(largePaddingSize),
                      child: const Text(
                        'end_time',
                        style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: smallFontSize),
                      ).tr(),
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
                            hintText: "enter_end_date",
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
                     Padding(
                      padding: const EdgeInsets.all(largePaddingSize),
                      child: const Text(
                        'report',
                        style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: smallFontSize),
                      ).tr(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: largePaddingSize,
                        right: largePaddingSize,
                        bottom: largePaddingSize,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: TextFormField(
                        controller: controller.reportVisualsController,
                        autofocus: false,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10, // Allows the text field to expand vertically
                        style: const TextStyle(fontSize: smallFontSize),
                        decoration: InputDecoration(
                          hintText: "", // Add your desired hint text here
                          hintStyle: const TextStyle(fontSize: smallFontSize),
                          contentPadding: const EdgeInsets.all(largePaddingSize),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIconConstraints: const BoxConstraints(maxHeight: 48),
                        ),
                      ),
                    )
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
