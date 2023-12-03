import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("MMS"),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
