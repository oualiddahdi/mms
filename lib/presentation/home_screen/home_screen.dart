import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/home_screen/%20reports_screen/ir_requests_reports_screen/ir_requests_reports_screen.dart';
import 'package:project/presentation/home_screen/%20reports_screen/projects_reports_screen/projects_reports_screen.dart';
import 'package:project/presentation/home_screen/%20reports_screen/visits_reports_screen/visits_reports_screen.dart';

import '../../core/utils/color_constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _tabs = [

    ProjectsReportsScreen(),
    IRRequestsReportsScreen(),
    VisitsReportsScreen()

  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(


            backgroundColor: Colors.white,
            activeColor: ColorConstant.blue500,

            items: [

              BottomNavigationBarItem(
                icon: Icon(MaterialSymbols.grain, size: 25.v),
                label: 'projects'.tr(),

              ),
              BottomNavigationBarItem(
                icon: Icon(MaterialSymbols.folder, size: 25.v),
                label: 'iR-Requests'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  MaterialSymbols.business_center,
                  size: 25.v,
                ),
                label: 'visits'.tr(),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
    );
  }
}
