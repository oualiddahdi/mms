import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/image_constant.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/presentation/account_screen/models/profile_model.dart';
import 'package:project_portal/theme/custom_text_style.dart';
import 'package:project_portal/widgets/info_section.dart';
import 'package:project_portal/routes/app_routes.dart';

import 'controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.find<ProfileController>();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<ProfileModel>(
          future: profileController.fetchAndSaveProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final profile = snapshot.data!.profile;

              final locale = EasyLocalization.of(context)!.locale;
              // Determine the department name based on the current locale
              String job_title;
              if (locale.languageCode == 'ar') {
                job_title = profile.userDept.deptName; // Arabic
              } else {
                job_title = profile.userDept.nameEng; // English
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.v, vertical: 16.v),
                    child: Text(
                      "profile",
                      style: CustomTextStyles.labelLargePrimary.copyWith(fontSize: 20.0.v),
                    ).tr(),
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
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(ApiService.apiUrlDoc + profile.profileImageName),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                child: Image.network(
                                  ApiService.apiUrlDoc + profile.profileImageName,
                                  fit: BoxFit.scaleDown,
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) {
                                      return child;
                                    } else {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      ImageConstant.imgLogo,
                                      fit: BoxFit.scaleDown,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 28.v),
                            InfoSection(label: "username", content: profile.loginName),
                            InfoSection(label: "first_name", content: profile.firstName),
                            InfoSection(label: "last_name", content: profile.lastName),
                            InfoSection(label: "family_name", content: profile.familyName),
                            InfoSection(label: "job_title", content: job_title), // Add logic if available
                            InfoSection(label: "department", content: profile.userDept.deptName),
                            const InfoSection(label: "position", content: ""), // Add logic if available
                            InfoSection(label: "employee_name", content: profile.employeeName),
                            InfoSection(label: "phone", content: profile.mobileNumber),
                            InfoSection(label: "email", content: profile.email),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.recoverPasswordScreen);
                              },
                              child: Text(
                                "change_password",
                                style: CustomTextStyles.labelLargePrimary.copyWith(fontSize: 16.0.v),
                              ).tr(),
                            ),
                            SizedBox(height: 28.v),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
