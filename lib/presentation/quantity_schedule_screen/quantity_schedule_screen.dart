import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/locale_utils.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/core/utils/sizes.dart';
import 'package:project_portal/model/projects/projects.dart';
import 'package:project_portal/presentation/quantity_schedule_screen/models/work_items.dart';
import 'package:project_portal/widgets/Info_text.dart';
import 'package:project_portal/widgets/custom_app_bar.dart';
import 'package:project_portal/widgets/custom_image_view.dart';

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.project.contractName.toString(),
                style: const TextStyle(color: Colors.black),
              ).tr(),
            ),
            Expanded(
              child: _buildScrollableList(),
            ),
            Container(
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
                        InfoText(
                          label: 'grandTotal',
                          value: grandTotalString + 'sr'.tr(),
                        ),
                        InfoText(
                          label: 'vat15',
                          value: vat15String + 'sr'.tr(),
                        ),
                        InfoText(
                          label: 'grandTotalWithVAT',
                          value: grandTotalWithVATString + 'sr'.tr(),
                        ),
                      ],
                    );
                  }
                },
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

                return Container(
                  margin: const EdgeInsets.all(smallFontSize),
                  decoration: ShapeDecoration(
                    color: ColorConstant.mysticWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(mediumFontSize),
                        child: Row(
                          children: [
                            const Text(
                              'المتسلسل',
                              style: TextStyle(
                                  color: Colors.black, fontSize: smallFontSize),
                            ).tr(),
                            const Spacer(),
                            const Text(
                              'item',
                              style: TextStyle(
                                  color: Colors.black, fontSize: smallFontSize),
                            ).tr(),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const Divider(
                          height: 1, color: ColorConstant.blueGray500),
                      Expanded(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: workItem.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                WorkItemWidget(
                                  workItem: workItem[index],
                                ),
                                const Divider(
                                    height: 1, color: ColorConstant.gray300),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        }
      },
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

class WorkItemWidget extends StatefulWidget {
  final WorkItem workItem;

  WorkItemWidget({required this.workItem});

  @override
  _WorkItemWidgetState createState() => _WorkItemWidgetState();
}

class _WorkItemWidgetState extends State<WorkItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String itemName = context.locale.languageCode == 'ar'
        ? widget.workItem.itemAr
        : widget.workItem.itemEn;

    return Column(
      children: [
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    color: ColorConstant.primaryColor,
                    isExpanded
                        ? Icons.remove_circle_outlined
                        : Icons.add_circle_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
                Text(
                  widget.workItem.id.toString(),
                  style: const TextStyle(
                      color: Colors.black, fontSize: smallFontSize),
                ).tr(),
              ],
            ),
            const Spacer(),
            Text(
              itemName,
              style:
                  const TextStyle(color: Colors.black, fontSize: smallFontSize),
            ).tr(),
            const Spacer(),
          ],
        ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.all(smallFontSize),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoText(label: 'item', value: widget.workItem.workType.name),
                InfoText(
                    label: 'unit', value: widget.workItem.unitOfMeasure.name),
                InfoText(
                    label: 'quantity_in_contract',
                    value: widget.workItem.quantity.toString()),
                InfoText(
                    label: 'total_value',
                    value: widget.workItem.total.toString() + 'sr'.tr()),
              ],
            ),
          ),
      ],
    );
  }
}
