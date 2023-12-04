import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

// Import the WelcomeScreen file
import 'screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = FlutterSecureStorage();
  String? savedLanguage = await storage.read(key: 'selectedLanguage');
  Locale locale;

  if (savedLanguage != null) {
    locale = Locale(savedLanguage);
  } else {
    // If no language is saved, use the device's locale or a default locale
    locale = Locale('en', ''); // Default to English if not saved
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en', ''),
      startLocale: locale, // Set the start locale based on saved language or device locale
      child: const MyApp(),
    ),
  );

}

// The main class for the application, extending StatelessWidget
class MyApp extends StatelessWidget {
  // Constructor for MyApp, making it const for performance optimization
  const MyApp({super.key});

  // Build method to define the structure of the widget
  @override
  Widget build(BuildContext context) {

    // Use GetMaterialApp for GetX features and material design
    return  GetMaterialApp(
      // Disable the debug banner in development mode
      debugShowCheckedModeBanner: false,

      // Set WelcomeScreen as the initial screen of the app
      home:  WelcomeScreen(),

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

    );
  }
}
