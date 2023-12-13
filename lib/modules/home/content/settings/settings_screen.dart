import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/presentation/add_extraction_screen/add_extraction_screen.dart';
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
        buildListTile('language', MaterialSymbols.language),
      ],
    );
  }



  Padding buildListTile(String titleKey, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon, color: ColorConstant.primaryColor),
        title: Text(titleKey).tr(),
        trailing:  Icon(Icons.arrow_forward_ios,
            size: 16.v, color: ColorConstant.primaryColor),
        onTap: () {
          Get.to( AddAddressScreen());
        },
      ),
    );
  }


}
