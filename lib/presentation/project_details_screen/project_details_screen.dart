import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/model/projects/projects.dart';
import 'package:project/widgets/custom_app_bar.dart';
import 'package:project/widgets/custom_image_view.dart';

import 'controller/project_details_controller.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Projects projects;
  final Project project;
  final String status;
  final int actualDuration;

  const ProjectDetailsScreen(
      {super.key,
      required this.projects,
      required this.project,
      required this.status,
      required this.actualDuration});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final ProjectDetailsController controller =
      Get.put(ProjectDetailsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: const CustomAppBar(
          title: 'projectDetails',
          showMoreIcon: true, // Set to true to display the more icon

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                widget.project.contractName.toString(),
                style: const TextStyle(color: Colors.black),
              ).tr(),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 18, top: 18),
              margin: EdgeInsets.all(8.v),
              decoration: ShapeDecoration(
                color: ColorConstant.secondaryColor14368E27,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildInfoColumn(
                      "status",
                      widget.status.toString(),
                    ),
                  ),
                  Expanded(
                    child: _buildInfoColumn(
                      "actualDuration",
                      widget.actualDuration.toString() + 'daily'.tr(),
                    ),
                  ),
                  Expanded(
                    child: _buildInfoColumn(
                      "value",
                      widget.project.contractValue.toString() + 'sr'.tr(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 18, top: 18),
              margin: EdgeInsets.all(8.v),
              decoration: ShapeDecoration(
                color: ColorConstant.primarySilverB3B3B3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoText(
                      'code', widget.project.contractNumber.toString()),
                  _buildInfoText(
                      'startDate', widget.project.startDate.toString()),
                  _buildInfoText(
                      'endDate', widget.project.finishDate.toString()),
                  _buildInfoText(
                      'type',
                      controller.getType(
                          widget.projects.catList, widget.project.catNo)),
                  _buildInfoText(
                      'owner',
                      controller.getOwners(
                          widget.projects.owners, widget.project.deptNo)),
                  _buildInfoText('contractor', ''),
                  _buildInfoText('executiveConsultant', ''),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 18, top: 18),
              margin: EdgeInsets.all(8.v),
              decoration: ShapeDecoration(
                color: ColorConstant.primarySilverB3B3B3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: _buildInfoText(
                  'dueForPayment', widget.project.contractNumber.toString()),
            ),
          ],
        ),
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: ColorConstant.primaryColor,
          ),
          child: InkWell(
            onTap: () {
              controller.onOnTapVisitsToProjectDetailsScreen(widget.project);

              //_buildBottomMaterialDialog();
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'types_of_visits',
                    style: TextStyle(color: Colors.white),
                  ).tr(),
                  const SizedBox(width: 5),
                  const Icon(Icons.visibility, color: ColorConstant.whiteA700),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to create each info column
  Widget _buildInfoColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
              color: ColorConstant.secondaryColor368E27, fontSize: 12.v),
          overflow: TextOverflow.ellipsis, // or TextOverflow.clip
          maxLines: 1,
        ).tr(),
        SizedBox(
          height: 10.v,
        ),
        Text(
          value,
          style: TextStyle(
              color: ColorConstant.secondaryColor368E27, fontSize: 12.v),
          overflow: TextOverflow.ellipsis, // or TextOverflow.clip
          maxLines: 1,
        ).tr(),
      ],
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.primaryColor,
              fontSize: 12.v,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).tr(),
          SizedBox(
            width: 10.v,
          ),
          Text(" : ",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 12.v,
              )),
          Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.textColor,
              fontSize: 12.v,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Padding buildListTile(String titleKey, image) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: CustomImageView(imagePath: image),
        title: Text(titleKey).tr(),
        onTap: () {
          // Add your onTap logic here
        },
      ),
    );
  }
}
