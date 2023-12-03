import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import the WelcomeScreen file
import 'screen/welcome_screen.dart';

void main() {
  // Run the app with the MyApp widget as the root
  runApp(const MyApp());
}

// The main class for the application, extending StatelessWidget
class MyApp extends StatelessWidget {
  // Constructor for MyApp, making it const for performance optimization
  const MyApp({super.key});

  // Build method to define the structure of the widget
  @override
  Widget build(BuildContext context) {
    // Use GetMaterialApp for GetX features and material design
    return const GetMaterialApp(
      // Disable the debug banner in development mode
      debugShowCheckedModeBanner: false,
      // Set WelcomeScreen as the initial screen of the app
      home: WelcomeScreen(),
    );
  }
}
