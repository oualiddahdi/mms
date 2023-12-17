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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(fit: FlexFit.tight, child: _buildTotalCountRow()),
              Flexible(fit: FlexFit.tight, child: _buildChart()),
            ],
          ),
          SizedBox(height: 14.h),
          _buildAdvancedContainers(),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return SizedBox(
      width: 200.0, // Set your desired width
      height: 200.0, // Set your desired height
      child: SfCircularChart(
        series: <CircularSeries>[
          DoughnutSeries<Map<String, dynamic>, String>(
            dataSource: data,
            xValueMapper: (Map<String, dynamic> data, _) => data['label'],
            yValueMapper: (Map<String, dynamic> data, _) => data['value'],
            pointColorMapper: (Map<String, dynamic> data, _) => data['color'],
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            emptyPointSettings: EmptyPointSettings(
                mode: EmptyPointMode.average,
                color: Colors.red,
                borderColor: Colors.black,
                borderWidth: 2),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCountRow() {
    return _buildDataRow('total_count', '00');
  }

  Widget _buildDataRow(String label, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(value, style: TextStyle(fontSize: 20.v)).tr(),
        Text(label, style: theme.textTheme.labelLarge).tr(),
      ],
    );
  }

  Widget _buildAdvancedContainers() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (data.length / 2).ceil(),
      itemBuilder: (context, index) {
        int startIndex = index * 2;
        int endIndex = (index * 2) + 1;
        endIndex = endIndex >= data.length ? data.length - 1 : endIndex;

        return Container(
          margin: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: _buildAdvancedContainer(
                    data[startIndex]['value']!.toString(),
                    data[startIndex]['label']!.toString(),
                    data[startIndex]['cost']!.toString(),
                    data[startIndex]['color']!),
              ),
              const SizedBox(
                width: 4,
              ),
              if (startIndex != endIndex) // Handle odd number of items
                Flexible(
                  child: _buildAdvancedContainer(
                      data[endIndex]['value']!.toString(),
                      data[endIndex]['label']!.toString(),
                      data[endIndex]['cost']!.toString(),
                      data[endIndex]['color']!),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAdvancedContainer(
      String value, String label, String cost, color) {
    return Card(
      elevation: 4,
      child: Stack(
        children: [
          // Your main content here
          Container(
            padding: EdgeInsets.fromLTRB(18.v, 18.v, 18.v, 18.v),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.all(Radius.circular(14.v)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          value,
                          style: theme.textTheme.titleMedium,
                          maxLines: 1,
                        ).tr(),
                      ),
                      Text(
                        label,
                        style: theme.textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ).tr(),
                      Text(
                        '$cost ${'sr'.tr()}',
                        style: theme.textTheme.titleSmall,
                      ).tr(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Positioned widget to place the floating element
          Positioned(
            top: 1.0.v, // Adjust the top position as needed
            right: 0.0.v, // Adjust the right position as needed
            child: Container(

              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: color, // Set the desired color
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Icon(size: 15,CupertinoIcons.chart_bar_alt_fill,color: ColorConstant.whiteA700),
            ),
          ),
        ],
      ),
    );
  }
}
