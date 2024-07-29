import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_portal/core/utils/api_constants.dart';
import 'package:project_portal/core/utils/color_constant.dart';
import 'package:project_portal/core/utils/pref_utils.dart';
import 'package:project_portal/core/utils/shared_preferences_manager.dart';
import 'package:project_portal/presentation/home_page/controller/home_controller.dart';
import 'package:project_portal/presentation/language_screen/controllers/language_controller.dart';
import 'package:project_portal/presentation/splash_screen/binding/splash_binding.dart';
import 'package:project_portal/routes/app_routes.dart';
import 'package:project_portal/src/jhijri/jhijri_widgets.dart';
import 'package:project_portal/theme/theme_helper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };


  Get.put(PrefUtils());
  Get.put(HomeController());

  // Initialize FlutterSecureStorage for storing the selected language
  const storage = FlutterSecureStorage();

  // Read the saved language from storage or set to 'ar' if not available
  String? savedLanguage = await storage.read(key: 'selectedLanguage') ?? 'ar';

  // Set the initial locale based on the saved language or use a default locale
  Locale locale = savedLanguage == 'ar'
      ? const Locale('ar', 'DZ')
      : const Locale('en', 'US');

  ThemeHelper().changeTheme('primary');

  // Run the app with localization settings
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar', 'DZ'),
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'DZ'),
      startLocale: locale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorConstant.primaryColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageController()),
      ],
      child: GetMaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialBinding: SplashBinding(),
        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutes.pages,
      ),
    );
  }
}
