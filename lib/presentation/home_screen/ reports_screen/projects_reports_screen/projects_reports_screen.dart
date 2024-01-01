import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
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
            margin: EdgeInsets.fromLTRB(4.v, 0.v, 4.v, 4.v),
            child: _buildReportBody()),
      ),
    );
  }

  Widget _buildReportBody() {
    return Column(
      children: [
        _buildTotalCountRow(),
        _buildChart(),
        SizedBox(height: 14.h),
        // _listItem()
      ],
    );
  }

  Widget _buildChart() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildAdvancedContainers(),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 200.0, // Set your desired height
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
    return Row(
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
    );
  }

  Widget _buildTotalCountRow() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown, // or BoxFit.contain depending on your preference
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
        Text(label, style: theme.textTheme.labelLarge).tr(),
        SizedBox(width: 14.h),
        Text(value,
                style: TextStyle(
                    fontSize: 14.v, color: ColorConstant.primaryColor))
            .tr(),
      ],
    );
  }

  Widget _listItem() {
    return Column(
      children: [
        Container(
          width: 344,
          height: 500,
          decoration: ShapeDecoration(
            color: const Color(0x14A0AF9D),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const Text(
          'مشروع 04122022',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF358E27),
            fontSize: 14,
            fontFamily: 'Neo Sans Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          'الحالة',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF368E27),
            fontSize: 14,
            fontFamily: 'Neo Sans Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          'منتظم 0.006%',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF368E27),
            fontSize: 12,
            fontFamily: 'Neo Sans Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          '15 يوم',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF368E27),
            fontSize: 12,
            fontFamily: 'Neo Sans Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          '454,500.00 ر.س',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF368E27),
            fontSize: 12,
            fontFamily: 'Neo Sans Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          'المدة الفعلية',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF368E27),
            fontSize: 14,
            fontFamily: 'Neo Sans Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          'القيمة',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF368E27),
            fontSize: 14,
            fontFamily: 'Neo Sans Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ],
    );
  }
}
