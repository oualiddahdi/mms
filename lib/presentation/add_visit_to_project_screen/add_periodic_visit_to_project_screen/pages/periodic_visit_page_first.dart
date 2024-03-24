import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/core/utils/sizes.dart';
import 'package:project/widgets/cupertino_radio_button_list_tile.dart';
import 'package:project/widgets/custom_radio_button_list_tile.dart';

class PeriodicVisitPageFirst extends StatefulWidget {
  const PeriodicVisitPageFirst({Key? key}) : super(key: key);

  @override
  _PeriodicVisitPageFirstState createState() => _PeriodicVisitPageFirstState();
}

class _PeriodicVisitPageFirstState extends State<PeriodicVisitPageFirst> {
  int _projectPanelValue = 1;
  int _siteCleanlinessValue = 1;
  int _consultantTeamValue = 1;
  int _qualityControlValue = 1;
  int _contractorWorkforceValue = 1;
  int _equipmentValue = 1;
  bool _sampleApproval = false;
  bool _timetableDelayed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(largePaddingSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'basic_information'.tr()} ( 1 / 6 )',
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
                        'لوحة المشروع'.tr() + ' * ',
                        style: const TextStyle(color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CustomRadioButtonListTile(
                            value: 1,
                            groupValue: _projectPanelValue,
                            title: 'منفذة',
                            onChanged: (value) {
                              setState(() {
                                _projectPanelValue = value; // Update the state
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: CustomRadioButtonListTile(
                            value: 2,
                            groupValue: _projectPanelValue,
                            title: 'مطابقة للمواصفات',
                            onChanged: (value) {
                              setState(() {
                                _projectPanelValue = value; // Update the state
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: largeBorderSize,),
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
                        'نظافة موقع العمل'.tr() + ' * ',
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
                              groupValue: _siteCleanlinessValue ,
                              title: 'ممتاز',
                              onChanged: (value) {
                                setState(() {
                                  _siteCleanlinessValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 2,
                              groupValue: _siteCleanlinessValue ,
                              title: 'مقبول',
                              onChanged: (value) {
                                setState(() {
                                  _siteCleanlinessValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 3,
                              groupValue: _siteCleanlinessValue ,
                              title: 'غير مقبول',
                              onChanged: (value) {
                                setState(() {
                                  _siteCleanlinessValue  = value; // Update the state
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

              const SizedBox(height: largeBorderSize,),
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
                        'فريق الاستشاري'.tr() + ' * ',
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
                        children: [
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 1,
                              groupValue: _consultantTeamValue ,
                              title: 'متواجد بالكامل',
                              onChanged: (value) {
                                setState(() {
                                  _consultantTeamValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 2,
                              groupValue: _consultantTeamValue ,
                              title: 'يوجد غيابات',
                              onChanged: (value) {
                                setState(() {
                                  _consultantTeamValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 3,
                              groupValue: _consultantTeamValue ,
                              title: 'غير متواجد',
                              onChanged: (value) {
                                setState(() {
                                  _consultantTeamValue  = value; // Update the state
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

              const SizedBox(height: largeBorderSize,),
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
                        'مستوي مراقبة الجودة'.tr() + ' * ',
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
                              groupValue: _qualityControlValue ,
                              title: 'ممتاز',
                              onChanged: (value) {
                                setState(() {
                                  _qualityControlValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 2,
                              groupValue: _qualityControlValue ,
                              title: 'مقبول',
                              onChanged: (value) {
                                setState(() {
                                  _qualityControlValue  = value; // Update the state
                                });
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CupertinoRadioButtonListTile(
                              value: 3,
                              groupValue: _qualityControlValue ,
                              title: 'غير مقبول',
                              onChanged: (value) {
                                setState(() {
                                  _qualityControlValue  = value; // Update the state
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
                        'القوى العاملة للمقاول'.tr() + ' * ',
                        style: const TextStyle(color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CustomRadioButtonListTile(
                            value: 1,
                            groupValue: _contractorWorkforceValue ,
                            title: 'العدد كافى',
                            onChanged: (value) {
                              setState(() {
                                _contractorWorkforceValue  = value; // Update the state
                              });
                            },
                          ),
                        ),

                      ],
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
                        'المعدات'.tr() + ' * ',
                        style: const TextStyle(color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: CustomRadioButtonListTile(
                            value: 1,
                            groupValue: _equipmentValue ,
                            title: 'العدد كافى',
                            onChanged: (value) {
                              setState(() {
                                _equipmentValue  = value; // Update the state
                              });
                            },
                          ),
                        ),

                      ],
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
                    const Padding(
                      padding: EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'اعتماد العينات / المخططات',
                        style: TextStyle(color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SwitchListTile(

                            title: Text(_sampleApproval  ? 'متوفر' : 'غير متوفر'),
                            value: _sampleApproval ,
                            onChanged: (bool value) {
                              setState(() {
                                _sampleApproval  = value;
                              });
                            },
                          ),
                        ),
                      ],
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
                    const Padding(
                      padding: EdgeInsets.all(largePaddingSize),
                      child: Text(
                        'الجداول الزمنية',
                        style: TextStyle(color: ColorConstant.black900, fontSize: 14),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SwitchListTile(

                            title: Text(_timetableDelayed  ? 'متأخر' : 'غير متأخر'),
                            value: _timetableDelayed ,
                            onChanged: (bool value) {
                              setState(() {
                                _timetableDelayed  = value;
                              });
                            },
                          ),
                        ),
                      ],
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
