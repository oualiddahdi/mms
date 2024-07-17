import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocaleUtils {
  static const storage = FlutterSecureStorage();

  static Future<Locale> getSavedLocale() async {
    String? savedLanguage = await storage.read(key: 'selectedLanguage');
    return savedLanguage == 'ar'
        ? const Locale('ar', 'DZ')
        : const Locale('en', 'US');
  }
}
