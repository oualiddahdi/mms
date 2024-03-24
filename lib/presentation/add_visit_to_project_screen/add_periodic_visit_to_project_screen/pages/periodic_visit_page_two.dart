import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/widgets/cupertino_radio_button_list_tile.dart';
import 'package:project/widgets/custom_radio_button_list_tile.dart';

class PeriodicVisitPageTwo extends StatefulWidget {
  const PeriodicVisitPageTwo({Key? key}) : super(key: key);

  @override
  _PeriodicVisitPageTwoState createState() => _PeriodicVisitPageTwoState();
}

class _PeriodicVisitPageTwoState extends State<PeriodicVisitPageTwo> {

  int _workersSafetyValue = 1; // State variable for workers' safety
  int _siteSafetyValue = 1; // State variable for site safety


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(largePaddingSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'عوامل الأمن والسلامة'.tr()} ( 1 / 6 )',
                style: const TextStyle(color: ColorConstant.black900, fontSize: 14),
              ),

              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: ColorConstant.primaryGold,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'سلامة العمال في الموقع'.tr() + ' * ',
                        style: const TextStyle(color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(mediumPaddingSize),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(mediumBorderSize)),
                        color: ColorConstant.primaryColor,
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 1,
                              groupValue: _workersSafetyValue ,
                              title: 'ملتزم',
                              onChanged: (value) {
                                setState(() {
                                  _workersSafetyValue = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 2,
                              groupValue: _workersSafetyValue ,
                              title: 'غير ملتزم',
                              onChanged: (value) {
                                setState(() {
                                  _workersSafetyValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 3,
                              groupValue: _workersSafetyValue ,
                              title: 'لا ينطبق',
                              onChanged: (value) {
                                setState(() {
                                  _workersSafetyValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(
                height: largeBorderSize,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: ColorConstant.primaryGold,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'سلامة الموقع العام'.tr() + ' * ',
                        style: const TextStyle(color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(mediumPaddingSize),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(mediumBorderSize)),
                        color: ColorConstant.primaryColor,
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 1,
                              groupValue: _siteSafetyValue  ,
                              title: 'ملتزم',
                              onChanged: (value) {
                                setState(() {
                                  _siteSafetyValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 2,
                              groupValue: _siteSafetyValue  ,
                              title: 'غير ملتزم',
                              onChanged: (value) {
                                setState(() {
                                  _siteSafetyValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 3,
                              groupValue: _siteSafetyValue  ,
                              title: 'لا ينطبق',
                              onChanged: (value) {
                                setState(() {
                                  _siteSafetyValue   = value; // Update the state
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
