import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/modules/home/content/ir_requests/ir_requests_screen.dart';
import 'package:project/presentation/home_screen/home_screen.dart';
import 'package:project/presentation/login_screen/login_screen.dart';
import 'package:project/modules/home/content/about_app/about_app_screen.dart';
import 'package:project/modules/home/content/messages/messages_screen.dart';
import 'package:project/modules/home/content/notifications/notifications_screen.dart';
import 'package:project/presentation/list_projcts_screen/list_projcts_screen.dart';
import 'package:project/modules/home/content/settings/settings_screen.dart';
import 'package:project/modules/home/content/tasks/tasks_screen.dart';
import 'package:project/modules/home/content/visits/visits_screen.dart';
import 'package:project/presentation/home_page/home_page.dart';
import 'package:project/presentation/language_screen/language_screen.dart';
import '../presentation/login_screen/binding/login_binding.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/sign_in_screen';

  static const String homePage = '/home_page';

  static const String homeScreen = '/home_screen';

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
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    homePage: (context) => const HomePage(),
    languageScreen: (context) => const LanguageScreen(),
    aboutAppScreen: (context) => const AboutAppScreen(),
    iRRequests_screen: (context) => const iRRequestsScreen(),
    visitsScreen: (context) => const VisitsScreen(),
    homeScreen: (context) =>  HomeScreen(),
    messagesScreen: (context) => const MessagesScreen(),
    notificationsScreen: (context) => const NotificationsScreen(),
    projectsScreen: (context) => const ProjectsScreen(),
    settingsScreen: (context) => const SettingsScreen(),
    tasksScreen: (context) => const TasksScreen(),
  };

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
  ];
}
