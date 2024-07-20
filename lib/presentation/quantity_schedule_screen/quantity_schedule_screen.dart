import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/locale_utils.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/model/projects/projects.dart';
import 'package:project/presentation/quantity_schedule_screen/models/work_items.dart';
import 'package:project/widgets/custom_app_bar.dart';
import 'package:project/widgets/custom_image_view.dart';

import 'controller/quantity_schedule_controller.dart';

class QuantityScheduleScreen extends StatefulWidget {
  const QuantityScheduleScreen({super.key});

  @override
  State<QuantityScheduleScreen> createState() => _QuantityScheduleScreenState();
}

class _QuantityScheduleScreenState extends State<QuantityScheduleScreen> {
  final QuantityScheduleController controller =
  Get.put(QuantityScheduleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: const CustomAppBar(
          title: 'quantity_schedule',
          showMoreIcon: false,
          controller: null,
          project: null,
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    controller.project.contractName.toString(),
                    style: const TextStyle(color: Colors.black),
                  ).tr(),
                ),
                Expanded(
                  child: _buildScrollableList(),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(14),
                decoration: ShapeDecoration(
                  color: ColorConstant.secondaryColor14368E27,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: FutureBuilder<WorkItems>(
                  future: controller.fetchWorkItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.workItems.isEmpty) {
                      return const Center(child: Text('No visits available.'));
                    } else {
                      List<WorkItem> workItem = snapshot.data!.workItems;

                      double grandTotal =
                      workItem.fold(0, (sum, item) => sum + item.total);
                      double vat15 = grandTotal * 0.15;
                      double grandTotalWithVAT = grandTotal + vat15;

                      String grandTotalString = grandTotal.toStringAsFixed(2);
                      String vat15String = vat15.toStringAsFixed(2);
                      String grandTotalWithVATString =
                      grandTotalWithVAT.toStringAsFixed(2);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoText(
                            "grandTotal",
                            grandTotalString + 'sr'.tr(),
                          ),
                          _buildInfoText(
                            "vat15",
                            vat15String + 'sr'.tr(),
                          ),
                          _buildInfoText(
                            "grandTotalWithVAT",
                            grandTotalWithVATString + 'sr'.tr(),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableList() {
    return FutureBuilder<Locale>(
      future: LocaleUtils.getSavedLocale(),
      builder: (context, localeSnapshot) {
        if (localeSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          Locale locale = localeSnapshot.data ?? const Locale('en', 'US');
          context.setLocale(locale);

          return FutureBuilder<WorkItems>(
            future: controller.fetchWorkItems(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.workItems.isEmpty) {
                return const Center(child: Text('No visits available.'));
              } else {
                List<WorkItem> workItem = snapshot.data!.workItems;

                return SingleChildScrollView(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: workItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      String itemName = context.locale.languageCode == 'ar'
                          ? workItem[index].itemAr
                          : workItem[index].itemEn;

                      return
                        Container(
                          padding: const EdgeInsets.all(14),
                          margin: const EdgeInsets.all(smallFontSize),
                          decoration: ShapeDecoration(
                            color: ColorConstant.primarySilverB3B3B3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemName,
                                style: const TextStyle(color: Colors.black),
                              ).tr(),
                              _buildInfoText('item',
                                  ' ${workItem[index].workType.name.toString()}'),
                              Row(children: [
                                _buildInfoText(
                                    'unit',
                                    workItem[index]
                                        .unitOfMeasure
                                        .name
                                        .toString()),
                                _buildInfoText('quantity_in_contract',
                                    workItem[index].quantity.toString()),
                              ]),
                              _buildInfoText('total_value',
                                  ' ${workItem[index].total.toString()} '),
                            ],
                          ),
                        );

                    },
                  ),
                );
              }
            },
          );
        }
      },
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
