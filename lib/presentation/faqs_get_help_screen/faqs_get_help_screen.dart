import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:project/core/common/app_colors.dart';
import 'package:project/core/common/app_size_text.dart';
import 'package:project/presentation/login_screen/login_screen.dart';

class ServiceDescriptionScreen extends StatelessWidget {
  const ServiceDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildHeaderText('مستقبل الاشراف على المشاريع'),
                    buildHeaderText(
                        'منصة **** لإدارة ومتابعة المشاريع عن بعد',
                        fontSize: AppSizeText.smallTextSize,
                        color: AppColors.accentColor),
                    const SizedBox(height: 10),
                    buildSectionHeader('إدارة ومتابعة المشاريع عن بعد'),
                    buildSectionDescription(
                      '***** يقــدم لــك الحــل مــن خلال مجموعــة مــن الحلــول الالكترونيــة المتكاملــة ليتمكــن المسؤول وذوي القــرار مــن المعرفــة التامــة لواقــع المشروعــات مهـمـا كان بعدهــا الجغــرافي طبقــا للمعايــر العالميــة لإدارة المشاريع',
                    ),
                    buildSectionItem(
                        'متابعه لحظية لإنجاز المشاريع',
                        'يقــدم النظــام آليــات مختلفــة ومتنوعــة في رصــد نســب إنجــاز المشروعــات بمــا يتوافــق مــع الآليــات المتبعــة لــكل جهــة منهــا',
                        MaterialSymbols.receipt_long),
                    buildSectionItem(
                        'الاجراءات المناسبة في الوقت المناسب',
                        'يتمكــن متخــذي القــرار مــن اتخــاذ القــرارات الصحيحــة والمســتندة عـلـى معلومــات دقيقــة ومحدثــة لحظيــا مــن خــلال تقاريــر متنوعــة ومــؤشرات أداء ',
                        MaterialSymbols.view_in_ar),
                    buildSectionItem(
                        'اطلاع دائم لمستجدات المشاريع',
                        'يقــوم النظــام بتســجيل مدخــلات العمليــات وكافــة الإجــراءات ويتــم حفــظ المعلومــات ومعالجتهــا وتحليلهــا وعــرض احصائيــات ومــؤشرات ذات مرجعيــة موثقــة',
                        MaterialSymbols.imagesmode),
                    buildSectionItem(
                        'بيئة عمل متصلة بشكل فعال',
                        'تمكن المنصة من خلال تطبيقاتها المختلفة التكاملية اللازمة لضمان التواصل الفعال بين جميع القائمين على المشروع وذلك من خلال بيئة المراسلات',
                        MaterialSymbols.security),
                    const SizedBox(height: 30),
                    buildSectionHeader('خصائص النظام'),
                    buildSectionDescription(
                        'تتميز منصة **** بالعديد من الخصائص الفعالة التي تتيح للقائمين على المشاريع بمتابعة اعمالهم وادارتها بالشكل الفعال الذى يحقق اعلى درجات الافادة والمتابعة لكل تفاصيل المشاريع'),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Image(
                        image: AssetImage("assets/images/features.png"),
                        height: 100,
                      ),
                    ),
                    buildSectionItemWithIcon(
                        'تعزيز دقة انجاز المشاريع',
                        'يقــدم النظــام آليــات مختلفــة ومتنوعــة في رصــد نســب إنجــاز المشروعــات بمــا يتوافــق مــع الآليــات المتبعــة لــكل جهــة منهــا',
                        MaterialSymbols.check),
                    buildSectionItemWithIcon(
                        'نسب الانجاز من خلال تقارير',
                        'نسب الإنجاز من خلال دورة عمل تسليم واستلام البنود بين المقاول والاستشارى',
                        MaterialSymbols.check),
                    buildSectionItemWithIcon(
                        'نسب انجاز المهام والاعمال',
                        'التي يتم اعتمادها في الجدول الزمنى للمشروع',
                        MaterialSymbols.check),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Image(
                        image: AssetImage("assets/images/features_2.png"),
                        height: 100,
                      ),
                    ),
                    buildSectionItemWithIcon(
                        'حوكمة كافة المشاريع',
                        'يقــدم النظــام اطــار منضبــط لإدارة حيــاة المشروعــات ويتيــح دورات عمــل مختلفــة لــكل الاجــراءات الخاصــة بالمشروعــات مــن محــاضر ولجــان واجتماعــات وخلافـه'
                            'تحديــد الأدوار والمســؤوليات ومتابعــة تنفيــذ المهــام تــزداد الموثوقيــة والاعتمادية عــلى المعلومــات ويتــم تقديــم رؤيــة واضحــة لحالــة العمــل تكفــي لاتخــاذ القــرارات الصحيحــة وتوثيقهــا ونشرهــا.',
                        null),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Image(
                        image: AssetImage("assets/images/features_3.png"),
                        height: 100,
                      ),
                    ),
                    buildSectionItemWithIcon(
                        ' إدارة ومتابعة المشاريع من خلال الجداول الزمنية ',
                        'لا شــك ان الجــداول الزمنيــة محــور رئيــسي لإدارة المشروعــات ومتابعــة اعمالهــا ونشطتاها المختلفــة ومســتوى تقــدم سـيـر العمــل والتعــرف عـلـى النقــاط الحرجــة والتعــرف المســبق عــلى المعوقــات التــي مــن المتوقــع التعــرض لهــا ومعالجتهــا قبــل حدوثهــا ',
                        null),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: Text(
                        'المــؤشرات التــي يتــم بنائهــا بالاعتمــاد عــلى الجــداول الزمنيــة يمكــن التعــرف علــى الوضــع المســتقبلي للمــشروع وتحديــد خطــط الـصـرف ويمكــن ايضــا بنــاء اعـمـال الجــدول الزمنــي بنــاء علــى الســيولة النقديــة.',
                        style: TextStyle(
                          fontSize: AppSizeText.smallTextSize,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Image(
                        image: AssetImage("assets/images/features_4.png"),
                        height: 100,
                      ),
                    ),
                    buildSectionItemWithIcon(
                        ' تدقيق المستخلصات آليا باستخدام دورات عمل مرنة وفعالة ',
                        'دون التعــارض مــع أي أنظمــة أخــرى يمكــن لــكل جهــة اعتــاد الاســتغناء عــن الطريقــة الهرميــة في اعتــماد المســتخلصات الى الطريقــة الالكترونيــة باســتخدام دورات عمــل مرنــة',
                        null),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: Text(
                        'وجــود آليــة تدقيــق داخــل النظــام لجميــع حســابات المســتخلص وأيضــا تدقيــق الوثائــق المصاحبــة للمســتخلص الخاصــة بالمقــاول وتحديــد مســتوى صلاحياتهــا مــن عدمــه مــا يقلــل مــن الأخطــاء البشريــة الموجــودة في اعتـمـاد المســتخلصات.',
                        style: TextStyle(
                          fontSize: AppSizeText.smallTextSize,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.offAll( LoginScreen());
              },
               child: Container(
                  color: AppColors.primaryColor,
                  width: double.maxFinite,
                  child:   Padding(
                    padding: const EdgeInsets.all(18.0),
                    child:  const Text('getStarted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: AppSizeText.mediumTextSize)).tr(),

                ),
                           ),
             )
          ],
        ),
      ),
    );
  }

  Widget buildHeaderText(String text,
      {double fontSize = AppSizeText.mediumTextSize,
      Color color = AppColors.textColor}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: buildHeaderText(text),
    );
  }

  Widget buildSectionDescription(String text) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: AppSizeText.smallTextSize,
          color: AppColors.textColor,
        ),
      ),
    );
  }

  Widget buildSectionItem(String title, String description, IconData? icon) {
    return buildItem(
        title,
        description,
        Icon(icon,
            size: AppSizeText.largeTextSize, color: AppColors.accentColor));
  }

  Widget buildSectionItemWithIcon(
      String title, String description, IconData? icon) {
    return buildItem(
        title,
        description,
        Icon(icon,
            size: AppSizeText.largeTextSize, color: AppColors.accentColor));
  }

  Widget buildItem(String title, String description, Icon? icon) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (icon != null) ...[
            icon,
            const SizedBox(height: 12),
          ],
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizeText.mediumTextSize,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            description,
            style: const TextStyle(
              fontSize: AppSizeText.smallTextSize,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
