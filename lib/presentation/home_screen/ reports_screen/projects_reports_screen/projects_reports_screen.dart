import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/project_details_screen/project_details_screen.dart';
import 'package:project/theme/custom_text_style.dart';
import 'package:project/theme/theme_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:project/src/dropdown_overlay/custom_dropdown.dart';

class ProjectsReportsScreen extends StatefulWidget {
  const ProjectsReportsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsReportsScreenState createState() => _ProjectsReportsScreenState();
}

class _ProjectsReportsScreenState extends State<ProjectsReportsScreen> {
  List<Map<String, dynamic>> data = [
    {
      'value': 16,
      'label': 'advanced',
      'cost': 00.0,
      'color': ColorConstant.primaryColor
    },
    {
      'value': 16,
      'label': 'normal',
      'cost': 00.0,
      'color': ColorConstant.secondaryColor
    },
    {
      'value': 16,
      'label': 'delayed',
      'cost': 00.0,
      'color': ColorConstant.accentColor
    },
    {
      'value': 16,
      'label': 'stumbled',
      'cost': 00.0,
      'color': ColorConstant.textColor
    },
    {
      'value': 16,
      'label': 'initial_receipt',
      'cost': 00.0,
      'color': ColorConstant.yellow700
    },
    {
      'value': 16,
      'label': 'stopped',
      'cost': 00.0,
      'color': ColorConstant.blueGray500
    },

    // Add more data as needed
  ];

  final jobRoleCtrl = TextEditingController();

  var itemSections = [
    'first_sections'.tr(),
    'second_sections'.tr(),
    'third_sections'.tr(),
    'fourth_sections'.tr(),
    'all_sections'.tr()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.topCenter, child: _buildReportBody()),
      ),
    );
  }

  Widget _buildReportBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTotalCountRow(),
          _buildChart(),
          SizedBox(height: 14.h),
          _buildScrollableList()
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 3, right: 3),
      margin: const EdgeInsets.all(2),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildAdvancedContainers(),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SfCircularChart(
                series: <CircularSeries>[
                  DoughnutSeries<Map<String, dynamic>, String>(
                    dataSource: data,
                    xValueMapper: (Map<String, dynamic> data, _) =>
                        data['label'],
                    yValueMapper: (Map<String, dynamic> data, _) =>
                        data['value'],
                    pointColorMapper: (Map<String, dynamic> data, _) =>
                        data['color'],
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    emptyPointSettings: EmptyPointSettings(
                        mode: EmptyPointMode.average,
                        color: Colors.red,
                        borderColor: Colors.black,
                        borderWidth: 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedContainers() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _buildData(data[index]['label']!.toString(),
            data[index]['value']!.toString(), data[index]['color']);
      },
    );
  }

  Widget _buildData(String label, String value, Color? color) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 3),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: ShapeDecoration(
              color: color,
              shape: const OvalBorder(),
            ),
          ),
          SizedBox(width: 14.h),
          _buildDataRow(label, value),
        ],
      ),
    );
  }

  Widget _buildTotalCountRow() {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  alignment:
                      isArabic ? Alignment.centerRight : Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  // or BoxFit.contain depending on your preference
                  child: _buildDataRow('total_count', '00'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.02, // تعديل النسبة حسب احتياجات التصميم
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1, color: ColorConstant.primaryGold),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: CustomDropdown(
                    listItemStyle: const TextStyle(fontSize: 14),
                    items: itemSections,
                    hintText: 'all_sections'.tr(),
                    controller: jobRoleCtrl,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 14.h),
          _buildDataRow('total_cost', '00.0${'sr'.tr()}'),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Row(
      children: [
        Text(label,
                style: theme.textTheme.labelLarge!.copyWith(fontSize: 12.fSize))
            .tr(),
        SizedBox(width: 14.h),
        Text(value,
                style: TextStyle(
                    fontSize: 14.v, color: ColorConstant.primaryColor))
            .tr(),
      ],
    );
  }

  Widget _buildScrollableList() {
    const itemCount =
        5; // Change this to the actual number of items in your list
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      // Disable scrolling for the inner list
      shrinkWrap: true,
      // Allow the list to take the height it needs
      itemCount: itemCount,
      // projctList.length, // Replace with the actual number of items in your list
      itemBuilder: (BuildContext context, int index) {
        // Replace the return statement with your list item widget
        return InkWell(
          onTap: (){
            Get.to(const ProjectDetailsScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 18, top: 18),
              decoration: ShapeDecoration(
                color: ColorConstant.secondaryColor14368E27,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(right: 18, left: 18, bottom: 10),
                    child: Text(
                      "مشروع 04122022".tr(),
                      style: CustomTextStyles.labelMediumBluegray300.copyWith(
                        fontSize: 14.0.v,
                        color: ColorConstant.secondaryColor368E27,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoColumn("status", "Regular 3.76%"),
                      ),
                      Expanded(
                        child: _buildInfoColumn("actualDuration", "365 days"),
                      ),
                      Expanded(
                        child: _buildInfoColumn("value", "4,000,000 SAR"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
          "value",
          style: TextStyle(
              color: ColorConstant.secondaryColor368E27, fontSize: 12.v),
          overflow: TextOverflow.ellipsis, // or TextOverflow.clip
          maxLines: 1,
        ).tr(),
      ],
    );
  }
}
