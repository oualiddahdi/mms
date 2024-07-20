import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:project/controller/visits_type_controller.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/image_constant.dart';
import 'package:project/core/utils/locale_utils.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/modules/visit_type_model.dart';
import 'package:project/presentation/visit_detail_screen/visit_detail_screen.dart';
import 'package:project/presentation/visits_to_project_screen/controllers/visits_to_project_controller.dart';
import 'package:project/presentation/visits_to_project_screen/models/visits_model.dart';
import 'package:project/widgets/custom_app_bar.dart';
import 'package:project/widgets/custom_image_view.dart';

import '../../routes/app_routes.dart';

class VisitsToProjectDetailsScreen extends StatefulWidget {
  const VisitsToProjectDetailsScreen({super.key});

  @override
  State<VisitsToProjectDetailsScreen> createState() =>
      _VisitsToProjectDetailsScreenState();
}

class _VisitsToProjectDetailsScreenState
    extends State<VisitsToProjectDetailsScreen> {
  final VisitsToProjectDetailsController _detailsController =
  Get.put(VisitsToProjectDetailsController());

  final VisitsTypeController _typeController = Get.put(VisitsTypeController());

  final jobRoleCtrl = TextEditingController();

  final itemSections = [
    'periodic_visit'.tr(),
    'surprise_visit'.tr(),
    'safety_visit'.tr(),
    'daily_visit'.tr(),
    'weekly_contractor_visit'.tr(),
    'aesthetic_visit'.tr()
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Locale>(
      future: LocaleUtils.getSavedLocale(),
      builder: (context, localeSnapshot) {
        if (localeSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          Locale locale = localeSnapshot.data ?? const Locale('en', 'US');
          context.setLocale(locale);

          return SafeArea(
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              appBar: CustomAppBar(
                title:
                '${'visits'.tr()} (${_detailsController.project.contractName})',
                showMoreIcon: false, controller: null, project: null,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(smallPaddingSize),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius:
                              BorderRadius.circular(smallPaddingSize),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: smallPaddingSize),
                              child: CustomDropdown(
                                listItemStyle:
                                const TextStyle(fontSize: smallFontSize),
                                items: itemSections,
                                hintText: 'types_of_visits'.tr(),
                                hintStyle:
                                const TextStyle(fontSize: smallFontSize),
                                controller: jobRoleCtrl,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(smallPaddingSize),
                            decoration: BoxDecoration(
                              color: ColorConstant.primaryColor,
                              borderRadius:
                              BorderRadius.circular(smallPaddingSize),
                            ),
                            child: InkWell(
                              onTap: () {
                                _buildBottomMaterialDialog();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(largePaddingSize),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      'add_a_visit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: smallFontSize),
                                    ).tr(),
                                    const Icon(Icons.add,
                                        color: ColorConstant.whiteA700),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildScrollableList(),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  _buildScrollableList() {
    return FutureBuilder<VisitsModel>(
      future: _detailsController.fetchAndSaveVisits(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.visits.isEmpty) {
          return Center(child: Text('No visits available.'));
        } else {
          List<Visit> visits = snapshot.data!.visits;

          return Expanded(
            child: SingleChildScrollView( // Wrap with SingleChildScrollView
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true, // Important: Set shrinkWrap to true
                    itemCount: visits.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VisitDetailScreen(visit: visits[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 18, top: 18),
                            margin: const EdgeInsets.all(smallFontSize),
                            decoration: ShapeDecoration(
                              color: ColorConstant.primarySilverB3B3B3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoText('Visit From', visits[index].visitFrom.toString()),
                                _buildInfoText('Code', 'Visit ${visits[index].id.toString()}'),
                                _buildInfoText('Type of Visit', 'زيارة مفاجأه'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  _buildBottomMaterialDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // تحديد هذه الخاصية ليتم التحكم في التمرير وعدم تجاوز حدود الشاشة
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(largeBorderSize)),
              color: ColorConstant.whiteA700,
            ),
            child: FutureBuilder<VisitTypeModel>(
              future: _typeController.fetchAndSaveVisitType(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Center(child: Text('No projects available.'));
                } else if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.visitType.isEmpty) {
                  return const Center(child: Text('No projects available.'));
                } else {
                  List<VisitType> visit = snapshot.data!.visitType;

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: visit.length,
                    itemBuilder: (BuildContext context, int index) {
                      String visitName = context.locale.languageCode == 'ar'
                          ? visit[index].nameAr
                          : visit[index].nameEn;

                      return buildListTile(
                        visitName.tr(), // Assuming the translation function is .tr()
                        _getVisitImage(visit[index].id), // Function to get image based on visit type
                        _getVisitRoute(visit[index].id), // Function to get route based on visit type
                      );
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }

  Padding buildListTile(String titleKey, image, screen) {
    return Padding(
      padding: const EdgeInsets.all(smallPaddingSize),
      child: ListTile(
        leading: CustomImageView(imagePath: image),
        title: Text(
          titleKey,
          style: const TextStyle(fontSize: smallFontSize),
        ).tr(),
        onTap: () {
          Get.find<VisitsToProjectDetailsController>().goToSecondPage(screen);
        },
      ),
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

  String? _getVisitImage(int visitId) {
    switch (visitId) {
      case 3:
        return ImageConstant.imgWeekly_visit;
      case 2:
        return ImageConstant.imgPeriodic_visit;
      case 1:
        return ImageConstant.imgSurprise_visit;
      case 4:
        return ImageConstant.imgSafety_visit;
      case 5:
        return ImageConstant.imgDaily_visit;
      case 6:
        return ImageConstant.imgWeekly_contractor_visit;
      case 7:
        return ImageConstant.imgAesthetic_visit;
      default:
        return null; // Default image if visitId doesn't match
    }
  }

  String? _getVisitRoute(int visitId) {
    switch (visitId) {
      case 3:
        return AppRoutes.addWeeklyVisitToProject;
      case 2:
        return AppRoutes.addPeriodicVisitToProjectScreen;
      case 1:
        return AppRoutes.addUnplannedVisitToProjectScreen;
      case 4:
        return AppRoutes.addSafetyVisitToProjectScreen;
      case 5:
        return AppRoutes.addDailyVisitToProject;
      case 6:
        return AppRoutes.addWeeklyContractorVisitToProject;
      case 7:
        return AppRoutes.addAestheticVisitToProject;
      default:
        return null; // Default route if visitId doesn't match
    }
  }
}
