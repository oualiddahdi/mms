import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:project/core/utils/api_constants.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/pref_utils.dart';
import 'package:project/core/utils/shared_preferences_manager.dart';
import 'package:project/presentation/language_screen/controllers/language_controller.dart';
import 'package:project/presentation/splash_screen/binding/splash_binding.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/src/jhijri/jhijri_widgets.dart';
import 'package:project/theme/theme_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(PrefUtils());

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          ColorConstant.primaryColor, // Change this color to match your AppBar
      statusBarIconBrightness:
          Brightness.dark, // Use Brightness.light for dark status bar icons
    ));

    return MultiProvider(
      providers: [
        // Provider for LanguageController
        ChangeNotifierProvider(create: (_) => LanguageController()),
      ],
      child: GetMaterialApp(
        theme: theme,

        // Disable the debug banner in development mode
        debugShowCheckedModeBanner: false,

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
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Use await to get the result from the openDialog function
            final result = await openDialog(context);

            // You can handle the result here if needed
            if (result != null) {
              // Do something with the result
              print("Selected date: ${result}");
            } else {
              // User canceled the date picker
              print("Date picker was canceled");
            }
          },
          child: const Text('Open Date Picker'),
        ),
      ),
    );
  }
}

Future<JPickerValue?> openDialog(BuildContext context) async {
  return await showGlobalDatePicker(
    context: context,
    startDate: JDateModel(
        jhijri: JHijri(
      fYear: 1442,
      fMonth: 12,
      fDay: 10,
    )),
    selectedDate: JDateModel(jhijri: JHijri.now()),
    endDate: JDateModel(jhijri: JHijri.now()),
    pickerMode: DatePickerMode.day,
    pickerTheme: Theme.of(context),

    //locale: const Locale("ar", "SA"),
    okButtonText: "save",
    cancelButtonText: "cancel",
    onOk: (value) {
      debugPrint(value.toString());
      Navigator.pop(context);
    },
    onCancel: () {
      Navigator.pop(context);
    },
    primaryColor: Colors.blue,
    calendarTextColor: Colors.white,
    backgroundColor: Colors.black,
    borderRadius: const Radius.circular(10),
    buttonTextColor: Colors.white,
    headerTitle: const Center(
      child: Text(
        "التقويم الهجري",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
