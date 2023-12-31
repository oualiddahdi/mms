import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/theme/theme_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class VisitsReportsScreen extends StatefulWidget {
  const VisitsReportsScreen({super.key});

  @override
  _VisitsReportsScreenState createState() => _VisitsReportsScreenState();
}

class _VisitsReportsScreenState extends State<VisitsReportsScreen> {

  List<Map<String, dynamic>> data = [
    {
      'value': 0,
      'label': 'scheduled_visit',
      'cost': 00.0,
      'color': ColorConstant.primaryColor
    },
    {
      'value': 0,
      'label': 'Daily_visit',
      'cost': 00.0,
      'color': ColorConstant.secondaryColor
    },
    {
      'value': 0,
      'label': 'weekly_visit',
      'cost': 00.0,
      'color': ColorConstant.accentColor
    },
    {
      'value': 0,
      'label': 'un_planned_visit',
      'cost': 00.0,
      'color': ColorConstant.textColor
    },
    {
      'value': 0,
      'label': 'safety_precaution_visit',
      'cost': 00.0,
      'color': ColorConstant.yellow700
    },
    {
      'value': 0,
      'label': 'inspection_visit(IRD)',
      'cost': 00.0,
      'color': ColorConstant.blueGray500
    },
    {
    'value': 0,
    'label': 'visit_quality_assurances(QA)',
    'cost': 00.0,
    'color': ColorConstant.blueColor
    },
    {
    'value': 0,
    'label': 'visit_scheduled_of_contractor',
    'cost': 00.0,
    'color': ColorConstant.violetColor
    },
    // Add more data as needed
  ];

  final jobRoleCtrl = TextEditingController();
  var itemSections = ['first_sections'.tr(), 'second_sections'.tr(), 'third_sections'.tr(), 'fourth_sections'.tr(), 'all_sections'.tr()];


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
    return  Column(
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
                    xValueMapper: (Map<String, dynamic> data, _) => data['label'],
                    yValueMapper: (Map<String, dynamic> data, _) => data['value'],
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
        return  _buildData(data[index]['label']!.toString(),
            data[index]['value']!.toString(), data[index]['color']);

      },
    );
  }

  Widget _buildData(String label, String value,Color? color) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildDataRow('total_count', '00'),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10.v,left: 10.v),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: ColorConstant.primaryGold),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: CustomDropdown(
                items:itemSections,
                hintText: 'all_sections'.tr(),
                controller: jobRoleCtrl,
              ),
            ),
          )
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

  Widget _listItem(){
    return Column(
      children: [
        Container(
          width: 344,
          height: 500,
          decoration: ShapeDecoration(
            color: const Color(0x14A0AF9D),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
