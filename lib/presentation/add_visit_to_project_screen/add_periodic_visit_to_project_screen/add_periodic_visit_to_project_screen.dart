import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_periodic_visit_to_project_screen/pages/periodic_visit_page_five.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_periodic_visit_to_project_screen/pages/periodic_visit_page_four.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_periodic_visit_to_project_screen/pages/periodic_visit_page_six.dart';
import 'package:project/presentation/add_visit_to_project_screen/add_periodic_visit_to_project_screen/pages/periodic_visit_page_three.dart';
import 'package:project/widgets/custom_app_bar.dart';

import 'pages/periodic_visit_page_first.dart';
import 'pages/periodic_visit_page_two.dart';

class AddPeriodicVisitToProjectScreen extends StatefulWidget {
  const AddPeriodicVisitToProjectScreen({Key? key}) : super(key: key);

  @override
  _AddPeriodicVisitToProjectScreenState createState() =>
      _AddPeriodicVisitToProjectScreenState();
}

class _AddPeriodicVisitToProjectScreenState
    extends State<AddPeriodicVisitToProjectScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const PeriodicVisitPageFirst(),
    const PeriodicVisitPageTwo(),
    const PeriodicVisitPageThree(),
    const PeriodicVisitPageFour(),
    const PeriodicVisitPageFive(),
    const PeriodicVisitPageSix(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          title: 'periodic_visit'.tr(),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: _buildPage,
              ),
            ),
            _buildNavigationRow(),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  Widget _buildPage(BuildContext context, int index) {
    return _pages[index];
  }

  Widget _buildNavigationRow() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPageIndex > 0) _buildPreviousButton(),
          Text(
            '${_currentPageIndex + 1} / ${_pages.length}',
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          if (_currentPageIndex < _pages.length - 1) _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildPreviousButton() {
    return InkWell(
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios),
          Text(
            'previous'.tr(),
            style: const TextStyle(
                color: ColorConstant.primaryGold, fontSize: 14),
          ),
        ],
      ),
      onTap: () {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  Widget _buildNextButton() {
    return InkWell(
      child: Row(
        children: [
          Text(
            'next'.tr(),
            style: const TextStyle(
                color: ColorConstant.primaryColor, fontSize: 14),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }
}
