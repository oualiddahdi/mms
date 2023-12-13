import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project/presentation/language_screen/controllers/language_controller.dart';
import 'package:project/presentation/splash_screen/binding/splash_binding.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/theme/theme_helper.dart';
import 'package:provider/provider.dart';


import 'package:persian_linear_date_picker/persian_linear_date_picker.dart';

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

  ThemeHelper().changeTheme('primary');


  // Run the app with localization settings
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'AR'),
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

        home: const MyHomePage(title: 'انتخاب تاریخ شمسی و میلادی'),

        // // Localization settings
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        //
        // initialBinding: SplashBinding(),
        // initialRoute: AppRoutes.splashScreen,
        // getPages: AppRoutes.pages,

      ),


    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pickedDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent[100]!.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: PersianLinearDatePicker(

              endDate: "${DateTime.now().year - 578}/12/29", // Adjust based on the Persian calendar
              initialDate: "${DateTime.now().year - 578}/01/01", // Adjust based on the Persian calendar
              startDate: "${DateTime.now().year - 578}/01/01", // Adjust based on the Persian calendar

              dateChangeListener: (String selectedDate) {
                print(selectedDate);
              },

              showMonthName: true,
              columnWidth: 90,
              labelStyle:
              const TextStyle(fontFamily: 'IS_B', color: Colors.blue),
              selectedRowStyle: const TextStyle(fontFamily: 'IS_B'),
              unselectedRowStyle: const TextStyle(fontFamily: 'IS_UL'),
              isPersian: true,
            ),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent[100]!.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: PersianLinearDatePicker(
              yearText: 'Year',
              monthText: 'Month',
              dayText: 'Day',
              endDate: '2025/11/20',
              initialDate: "2023/05/17",
              startDate: "1980/04/10",
              dateChangeListener: (String selectedDate) {
                print(selectedDate);
              },
              showMonthName: true,
              columnWidth: 90,
              labelStyle:
              const TextStyle(fontFamily: 'DIN', color: Colors.blue),
              selectedRowStyle: const TextStyle(
                  fontFamily: 'DIN', fontWeight: FontWeight.bold),
              unselectedRowStyle: const TextStyle(fontFamily: 'DIN'),
              isPersian: false,
            ),
          ),
        ],
      ),
    );
  }
}
