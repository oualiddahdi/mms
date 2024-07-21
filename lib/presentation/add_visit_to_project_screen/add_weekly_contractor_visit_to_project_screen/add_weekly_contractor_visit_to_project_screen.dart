import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/sizes.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_weekly_contractor_visit_to_project_screen/pages/weekly_contractor_visit_page_first.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_weekly_contractor_visit_to_project_screen/pages/weekly_contractor_visit_page_five.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_weekly_contractor_visit_to_project_screen/pages/weekly_contractor_visit_page_four.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_weekly_contractor_visit_to_project_screen/pages/weekly_contractor_visit_page_six.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_weekly_contractor_visit_to_project_screen/pages/weekly_contractor_visit_page_three.dart';
import 'package:project_portal/presentation/add_visit_to_project_screen/add_weekly_contractor_visit_to_project_screen/pages/weekly_contractor_visit_page_two.dart';
import 'package:project_portal/widgets/custom_app_bar.dart';

import 'controllers/add_weekly_contractor_visit_to_project_controller.dart';

class AddWeeklyContractorVisitToProjectScreen extends StatefulWidget {
  const AddWeeklyContractorVisitToProjectScreen({Key? key}) : super(key: key);

  @override
  _AddWeeklyContractorVisitToProjectScreenState createState() =>
      _AddWeeklyContractorVisitToProjectScreenState();
}

class _AddWeeklyContractorVisitToProjectScreenState
    extends State<AddWeeklyContractorVisitToProjectScreen> {
  final controller = Get.find<AddWeeklyContractorVisitToProjectController>();

  late PageController _pageController;
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const WeeklyContractorVisitPageFirst(),
    const WeeklyContractorVisitPageTwo(),
    const WeeklyContractorVisitPageThree(),
    const WeeklyContractorVisitPageFour(),
    const WeeklyContractorVisitPageFive(),
    const WeeklyContractorVisitPageSix(),
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
          title: 'weekly_contractor_visit'.tr(),
          showMoreIcon: false,
          controller: null,
          project: null,
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
      padding: const EdgeInsets.all(largePaddingSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPageIndex > 0) _buildPreviousButton(),
          Text(
            '${_currentPageIndex + 1} / ${_pages.length}',
            style:
                const TextStyle(color: Colors.black, fontSize: smallFontSize),
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
                color: ColorConstant.primaryGold, fontSize: smallFontSize),
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
                color: ColorConstant.primaryColor, fontSize: smallFontSize),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () {
        // تحقق من اكتمال البيانات بناءً على الصفحة الحالية
        if (_isDataComplete()) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          // أظهر رسالة أو اتخذ إجراء إذا لم تكن البيانات مكتملة
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('complete_data_warning').tr(),
            ),
          );
        }
      },
    );
  }

  bool _isDataComplete() {
    switch (_currentPageIndex) {
      case 0:
        return controller.isFirstPageDataComplete();
      case 1:
        return controller.isSecondPageDataComplete();
      case 2:
        return controller.isThirdPageDataComplete();
      case 3:
        return controller.isFourthPageDataComplete();
      case 4:
        return controller.isFifthPageDataComplete();
      case 5:
        return controller.isSixthPageDataComplete();
      default:
        return false;
    }
  }
}
