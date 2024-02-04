import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';

import 'package:provider/provider.dart';

import 'controllers/language_controller.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'en'; // Default language code, e.g., English
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage(); // Load the selected language when the screen is initialized
  }

// Load the selected language from secure storage
  _loadSelectedLanguage() async {
    String? savedLanguage = await storage.read(key: 'selectedLanguage');
    if (savedLanguage != null) {
      if (savedLanguage.toLowerCase() != selectedLanguage.toLowerCase()) {
        setState(() {
          selectedLanguage = savedLanguage;
        });
      }
    }
  }

  // Save the selected language to secure storage
  _saveSelectedLanguage() async {
    await storage.write(key: 'selectedLanguage', value: selectedLanguage);

    Locale locale = Locale(selectedLanguage); //languageCode=ru or es
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    LanguageController controller = context.read<LanguageController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "language",
          style: TextStyle(
            fontSize: 14.v,
          ),
        ).tr(),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedLanguage = 'ar';
                    _saveSelectedLanguage(); // Save the selected language when tapped
                    // Apply logic to change the app's locale if needed

                    context.locale = const Locale('ar', 'DZ');

                    controller.onLanguageChanged();
                  });
                },
                child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: selectedLanguage == 'ar'
                            ? ColorConstant
                                .gray90033 // Change the color as needed
                            : ColorConstant.whiteA700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'arabic',
                      style: TextStyle(fontSize: 14.v),
                    ).tr()),
              ),
              const SizedBox(
                height: 14,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedLanguage = 'en';
                    _saveSelectedLanguage(); // Save the selected language when tapped
                    // Apply logic to change the app's locale if needed
                    context.locale = const Locale('en', 'US');

                    controller.onLanguageChanged();
                  });
                },
                child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: selectedLanguage == 'en'
                            ? ColorConstant
                                .gray90033 // Change the color as needed
                            : ColorConstant.whiteA700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'english',
                      style: TextStyle(fontSize: 14.v),
                    ).tr()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
