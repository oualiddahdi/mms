import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:project_portal/core/utils/api_constants.dart';
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
    _initializeApiService();
  }

  void _initializeApiService() async {
    await ApiService.initialize();
    setState(() {});
  }



  Future<void> _showApiUrlDialog() async {
    String newApiUrl = ApiService.apiUrl;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit API URL'),
          content: TextField(
            controller: TextEditingController(text: ApiService.apiUrl),
            decoration: const InputDecoration(hintText: 'Enter new API URL'),
            onChanged: (value) {
              newApiUrl = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                await ApiService.setBaseUrl(newApiUrl);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildListTile('language', MaterialSymbols.language, () {
          Get.to(const LanguageScreen());
        }),
        buildListTile('API URL', MaterialSymbols.api, () {
          _showApiUrlDialog();
        }),
        buildTileSwitch('use_fingerprint', MaterialSymbols.fingerprint),
        // Add more ListTiles as needed
      ],
    );
  }

  Padding buildListTile(String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon, color: ColorConstant.primaryColor),
        title: Text(title).tr(),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.v, color: ColorConstant.primaryColor),
        onTap: onTap,
      ),
    );
  }

  Padding buildTileSwitch(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title).tr(),
        trailing: Switch(
          activeTrackColor: Colors.grey[300],
          value: isEnabled,
          onChanged: (value) {
            setState(() {
              isEnabled = value;
            });
          },
        ),
      ),
    );
  }
}
