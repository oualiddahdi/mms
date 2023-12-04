import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project/screen/auth/login_screen.dart';

// WelcomeScreen class represents the welcome screen of the app
class WelcomeScreen extends StatelessWidget {
  // Constructor for WelcomeScreen, making it const for performance optimization
   WelcomeScreen({super.key});

  static const storage = FlutterSecureStorage();


  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3), () {
      _onCheckToToken();
    });
    return ScaffoldMessenger(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Center(
      
            child: Image.asset('assets/images/logo.png',width: 100,height: 100,)
        ),
      ),
    );
  }

  Future<void> _onCheckToToken() async {

    String? token = await storage.read(key: "token");


    if(!token.isNull){

    }else{
      Get.offAll((const LoginScreen()));

    }

  }

}