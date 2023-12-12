import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:project/core/common/app_colors.dart';
import 'package:project/core/common/app_size_text.dart';
import 'package:project/presentation/language_screen/language_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Usage
        buildListTile(
            'language', MaterialSymbols.language),



      ],
    );
  }


  Padding buildListTile(String titleKey, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(titleKey).tr(),
        trailing: const Icon(Icons.arrow_forward_ios,size: AppSizeText.largeTextSize, color: AppColors.primaryColor),
        onTap: () {
          Get.to(const LanguageScreen());
        },
      ),
    );
  }
}
