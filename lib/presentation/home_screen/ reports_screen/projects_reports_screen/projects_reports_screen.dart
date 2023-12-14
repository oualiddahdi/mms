
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/theme/theme_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProjectsReportsScreen extends StatefulWidget {
  const ProjectsReportsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsReportsScreenState createState() => _ProjectsReportsScreenState();
}

class _ProjectsReportsScreenState extends State<ProjectsReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildReportBody(),
      ),
    );
  }

  Widget _buildReportBody() {
    return Column(
      children: [
        _buildChart(),
        _buildTotalCountRow(),
        const Divider(thickness: 2, indent: 10, endIndent: 10, color: ColorConstant.blue50),
        _buildAdvancedContainers(),
      ],
    );
  }

  Widget _buildChart() {
    return   SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<Map<String, dynamic>, String>(
          dataSource: <Map<String, dynamic>>[
            {'label': 'A', 'value': 10},
            {'label': 'B', 'value': 20},
            {'label': 'C', 'value': 15},
            {'label': 'D', 'value': 25},
          ],
          xValueMapper: (Map<String, dynamic> data, _) => data['label'],
          yValueMapper: (Map<String, dynamic> data, _) => data['value'],
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
        ),
      ],
    );
  }

  Widget _buildTotalCountRow() {
    return Container(
      margin: EdgeInsets.fromLTRB(30.v, 10.v, 30.v, 10.v),
      child: Column(
        children: [
          _buildDataRow('total_count', '00.0'),
          SizedBox(height: 14.h),
          _buildDataRow('total_cost', '00.0'),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.titleMedium).tr(),
        Text(value, style: theme.textTheme.titleMedium).tr(),
      ],
    );
  }

  Widget _buildAdvancedContainers() {
    return Column(
      children: [
        _buildAdvancedRow('0', 'advanced', '00.0'),
        SizedBox(height: 14.h),
        _buildAdvancedRow('0', 'advanced', '00.0'),
      ],
    );
  }

  Widget _buildAdvancedRow(String value, String label, String cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildAdvancedContainer(value, label, cost),
        ),
        SizedBox(width: 14.v),
        Expanded(
          child: _buildAdvancedContainer(value, label, cost),
        ),
      ],
    );
  }

  Widget _buildAdvancedContainer(String value, String label, String cost) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ColorConstant.blueGray50,
        borderRadius: BorderRadius.all(Radius.circular(14.v)),
      ),
      child: Column(
        children: [
          Text(value, style: theme.textTheme.titleMedium).tr(),
          Text(label, style: theme.textTheme.titleMedium).tr(),
          Text('$cost ${'sr'.tr()}', style: theme.textTheme.titleMedium).tr(),
        ],
      ),
    );
  }
}
