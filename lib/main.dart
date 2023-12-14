import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project/presentation/add_extraction_screen/add_extraction_screen.dart';
import 'package:project/presentation/language_screen/controllers/language_controller.dart';
import 'package:project/presentation/splash_screen/binding/splash_binding.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/theme/theme_helper.dart';
import 'package:provider/provider.dart';

import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize FlutterSecureStorage for storing the selected language
  const storage = FlutterSecureStorage();

// Read the saved language from storage
  String? savedLanguage = await storage.read(key: 'selectedLanguage');

// Set the initial locale based on the saved language or use a default locale
  Locale locale = savedLanguage == 'ar'
      ? const Locale('ar', 'DZ')
      : const Locale('en', 'US');

  ThemeHelper().changeTheme('primary');


  // Run the app with localization settings
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'DZ')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'SA'),
      startLocale: locale,
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
    return MultiProvider(
      providers: [
        // Provider for LanguageController
        ChangeNotifierProvider(create: (_) => LanguageController()),
      ],
      child: GetMaterialApp(
        theme: theme,

        // Disable the debug banner in development mode
        debugShowCheckedModeBanner: false,

       // home: _MyHomePage(),

        // // Localization settings
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        //
        initialBinding: SplashBinding(),
        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutes.pages,

      ),


    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return   SfCircularChart(
      series: <CircularSeries>[
      DoughnutSeries<Map<String, dynamic>, String>(
        dataSource: <Map<String, dynamic>>[
        {'label': 'A', 'value': 10},
        {'label': 'B', 'value': 20},
        {'label': 'C', 'value': 15},
        {'label': 'D', 'value': 25},
        ],
        xValueMapper: (Map<String, dynamic> data, _) => data['label'],
      yValueMapper: (Map<String, dynamic> data, _) => data['value'],
      dataLabelSettings: DataLabelSettings(
        isVisible: true,
      ),
    ),
    ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}