import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/image_constant.dart';
import 'package:project_portal/core/utils/sizes.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_weekly_visit_to_project_screen/controllers/add_weekly_visit_to_project_controller.dart';
import 'package:project_portal/widgets/custom_image_view.dart';
import 'package:project_portal/widgets/custom_text_form_field.dart';
import 'package:project_portal/widgets/video_player.dart';

class WeeklyVisitPageFive extends StatelessWidget {
  const WeeklyVisitPageFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddWeeklyVisitToProjectController>();

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
                  '${'المرئيات'.tr} ( 2 / 2 )',
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
            ],
          ),
        ),
      ),
    );
  }
}
