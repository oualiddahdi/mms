import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/pref_utils.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/presentation/language_screen/language_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    // Perform asynchronous work (e.g., fetching data from SharedPreferences).
    bool isEnabledValue = await PrefUtils().getSwitchValue();

    // Update the state inside a call to setState.
    setState(() {
      isEnabled = isEnabledValue;
    });
  }

  _saveSettings(bool value) async {
    setState(() {
      isEnabled = value;
    });

    await PrefUtils().setSwitchValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildListTile('language', MaterialSymbols.language),
        buildTileSwitch('use_fingerprint', MaterialSymbols.fingerprint),
      ],
    );
  }

  Padding buildListTile(String titleKey, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon, color: ColorConstant.primaryColor),
        title: Text(titleKey).tr(),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 16.v, color: ColorConstant.primaryColor),
        onTap: () {
          Get.to(const LanguageScreen());
        },
      ),
    );
  }

  Padding buildTileSwitch(String titleKey, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon, color: ColorConstant.primaryColor),
        title: Text(titleKey).tr(),
        trailing: Switch(
          activeTrackColor: ColorConstant.mysticWhite,
          value: isEnabled,
          onChanged: (value) {
            _saveSettings(value);
          },
        ),
      ),
    );
  }
}
