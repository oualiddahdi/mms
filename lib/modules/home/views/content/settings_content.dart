import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:project/common/app_size_text.dart';
import 'package:project/common/widgets/button_global_widget.dart';
import 'package:project/modules/settings/language/views/language_page.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({super.key});

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
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
        leading: Icon(icon, color: const Color(0XFF73BEBD)),
        title: Text(titleKey).tr(),
        trailing: const Icon(Icons.arrow_forward_ios,size: AppSizeText.largeTextSize, color: Color(0XFF73BEBD)),
        onTap: () {
          Get.to(const LanguageScreen());
        },
      ),
    );
  }
}
