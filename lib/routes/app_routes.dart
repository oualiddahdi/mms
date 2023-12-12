import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/presentation/login_screen/login_screen.dart';
import 'package:project/presentation/faqs_get_help_screen/faqs_get_help_screen.dart';
import 'package:project/modules/home/content/about_app/about_app_screen.dart';
import 'package:project/modules/home/content/delivery_requests/delivery_requests_screen.dart';
import 'package:project/presentation/home_container_screen/home_screen.dart';
import 'package:project/modules/home/content/messages/messages_screen.dart';
import 'package:project/modules/home/content/notifications/notifications_screen.dart';
import 'package:project/modules/home/content/projects/projects_screen.dart';
import 'package:project/modules/home/content/settings/settings_screen.dart';
import 'package:project/modules/home/content/tasks/tasks_screen.dart';
import 'package:project/modules/home/content/visits/visits_screen.dart';
import 'package:project/presentation/home_page/home_page.dart';
import 'package:project/presentation/language_screen/language_screen.dart';
import 'package:project/presentation/onboarding_screen/binding/onboarding_binding.dart';
import 'package:project/presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/login_screen/binding/login_binding.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/sign_in_screen';

  static const String serviceDescriptionScreen = '/service_description_screen';

  static const String homePage = '/home_page';

  static const String homeScreen = '/home_screen';

  static const String languageScreen = '/language_screen';

  static const String visitsScreen = '/visits_screen';

  static const String tasksScreen = '/tasks_screen';

  static const String settingsScreen = '/settings_screen';

  static const String projectsScreen = '/projects_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String messagesScreen = '/messages_screen';

  static const String deliveryRequestsScreen = '/delivery_requests_screen';

  static const String aboutAppScreen = '/about_app_screen';


  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) =>  LoginScreen(),
    serviceDescriptionScreen: (context) =>  ServiceDescriptionScreen(),
    homePage: (context) => const HomePage(),
    languageScreen: (context) => const LanguageScreen(),
    aboutAppScreen: (context) => const AboutAppScreen(),
    deliveryRequestsScreen: (context) => const DeliveryRequestsScreen(),
    visitsScreen: (context) => const VisitsScreen(),
    homeScreen: (context) => const HomeScreen(),
    messagesScreen: (context) => const MessagesScreen(),
    notificationsScreen: (context) => const NotificationsScreen(),
    projectsScreen: (context) => const ProjectsScreen(),
    settingsScreen: (context) => const SettingsScreen(),
    tasksScreen: (context) => const TasksScreen(),

  };


  static List<GetPage> pages = [

    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),

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