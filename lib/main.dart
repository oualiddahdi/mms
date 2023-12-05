import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Import the WelcomeScreen file
import 'controller/language_controller.dart';
import 'screen/welcome_screen.dart';

void main() async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize FlutterSecureStorage for storing the selected language
  const storage = FlutterSecureStorage();

// Read the saved language from storage
  String? savedLanguage = await storage.read(key: 'selectedLanguage');

// Set the initial locale based on the saved language or use a default locale
  Locale locale = savedLanguage == 'ar'
      ? const Locale('ar', 'AR')
      : const Locale('en', 'US');

  // Run the app with localization settings
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: locale,
      child: const MyApp(),
    ),
  );
}

// The main class for the application, extending StatelessWidget
class MyApp extends StatelessWidget {
  // Constructor for MyApp, making it const for performance optimization
  const MyApp({Key? key}) : super(key: key);

  // Build method to define the structure of the widget
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider for LanguageController
        ChangeNotifierProvider(create: (_) => LanguageController()),
      ],
      child: GetMaterialApp(
        // Disable the debug banner in development mode
        debugShowCheckedModeBanner: false,

        // Set WelcomeScreen as the initial screen of the app
        home: WelcomeScreen(),

        // Localization settings
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
