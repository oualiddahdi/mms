import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';

class PeriodicVisitPageFirst extends StatelessWidget {
  const PeriodicVisitPageFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${'basic_information'.tr()} ( 1 / 6 )',
              style:
                  const TextStyle(color: ColorConstant.black900, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(14.v),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                    color: ColorConstant.primaryGold), // تحديد لون الحدود هنا
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'لوحة المشروع'.tr(),
                      style: const TextStyle(
                          color: ColorConstant.black900, fontSize: 14),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
