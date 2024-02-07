import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/modules/home/content/ir_requests/ir_requests_screen.dart';
import 'package:project/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:project/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:project/presentation/get_started_screen/binding/get_started_binding.dart';
import 'package:project/presentation/get_started_screen/get_started_screen.dart';
import 'package:project/presentation/home_screen/home_screen.dart';
import 'package:project/presentation/login_screen/login_screen.dart';
import 'package:project/modules/home/content/about_app/about_app_screen.dart';
import 'package:project/modules/home/content/messages/messages_screen.dart';
import 'package:project/modules/home/content/notifications/notifications_screen.dart';
import 'package:project/presentation/list_projcts_screen/list_projcts_screen.dart';
import 'package:project/presentation/otp_screen/otp_screen.dart';
import 'package:project/presentation/project_details_screen/binding/project_details_binding.dart';
import 'package:project/presentation/project_details_screen/project_details_screen.dart';
import 'package:project/presentation/recover_password_screen/binding/recover_password_binding.dart';
import 'package:project/presentation/recover_password_screen/recover_password_screen.dart';
import 'package:project/presentation/settings_screen/settings_screen.dart';
import 'package:project/modules/home/content/tasks/tasks_screen.dart';
import 'package:project/modules/home/content/visits/visits_screen.dart';
import 'package:project/presentation/home_page/home_page.dart';
import 'package:project/presentation/language_screen/language_screen.dart';
import '../presentation/login_screen/binding/login_binding.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String getStartedScreen = '/get_started_screen';

  static const String loginScreen = '/sign_in_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String otpScreen = '/otp_screen';

  static const String recoverPasswordScreen = '/recover_password_screen';

  static const String homePage = '/home_page';

  static const String homeScreen = '/home_screen';

  static const String projectDetailsScreen = '/project_details_screen';

  static const String languageScreen = '/language_screen';

  static const String visitsScreen = '/visits_screen';

  static const String tasksScreen = '/tasks_screen';

  static const String settingsScreen = '/settings_screen';

  static const String projectsScreen = '/projects_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String messagesScreen = '/messages_screen';

  static const String iRRequests_screen = '/ir_requests_screen';

  static const String aboutAppScreen = '/about_app_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    homePage: (context) => const HomePage(),
    languageScreen: (context) => const LanguageScreen(),
    aboutAppScreen: (context) => const AboutAppScreen(),
    iRRequests_screen: (context) => const iRRequestsScreen(),
    visitsScreen: (context) => const VisitsScreen(),
    homeScreen: (context) => HomeScreen(),
    messagesScreen: (context) => const MessagesScreen(),
    notificationsScreen: (context) => const NotificationsScreen(),
    projectsScreen: (context) => const ProjectsScreen(),
    settingsScreen: (context) => const SettingsScreen(),
    tasksScreen: (context) => const TasksScreen(),
  };

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: getStartedScreen,
      page: () => GetStartedScreen(),
      bindings: [
        GetStartedBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: otpScreen,
      page: () => const OtpScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: recoverPasswordScreen,
      page: () => RecoverPasswordScreen(),
      bindings: [
        RecoverPasswordBinding(),
      ],
    ),


  ];
}
