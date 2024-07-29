import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/image_constant.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/theme/custom_text_style.dart';
import 'package:project_portal/widgets/custom_image_view.dart';
import 'package:project_portal/widgets/custom_text_form_field.dart';
import 'package:project_portal/widgets/info_section.dart';

import '../../routes/app_routes.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.v, vertical: 16.v),
              child: Text(
                "الملف الشخصي".tr(),
                style: CustomTextStyles.labelLargePrimary.copyWith(fontSize: 20.0.v),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 28.v),
                      InfoSection(label: "أسم المستخدم".tr(), content: "Hadeer Tarek"),
                      InfoSection(label: "الأسم الاول".tr(), content: "Hadeer"),
                      InfoSection(label: "الأسم الاخير".tr(), content: "Tarek"),
                      InfoSection(label: "أسم العائلة".tr(), content: "Hassan"),
                      InfoSection(label: "مسمى الوظيفي".tr(), content: ""),
                      InfoSection(label: "الادارة".tr(), content: ""),
                      InfoSection(label: "المنصب الأداري".tr(), content: ""),
                      InfoSection(label: "أسم الموظف".tr(), content: "Hassan"),
                      InfoSection(label: "رقم هاتف".tr(), content: "+ 966 34 762 1236"),
                      InfoSection(label: "البريد الالكتروني".tr(), content: "HadeerTarek@gmail.com"),
                      InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.recoverPasswordScreen,);
                        },
                        child: Text(
                          "تغيير كلمة المرور",
                          style: CustomTextStyles.labelLargePrimary.copyWith(fontSize: 16.0.v),
                        ),
                      ),
                      SizedBox(height: 28.v),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
