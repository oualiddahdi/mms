import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/screen/language_screen.dart';
import 'package:project/utils/app_event_bus.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerEmail = TextEditingController();

  final _eventBus = AppEventBus();

  @override
  void initState() {
    super.initState();
    _eventBus.onLanguageChange.listen((_) {
      // قم بتحديث البيانات هنا
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: InkWell(
              onTap: () {
                setState(() {
                  Get.to(const LanguageScreen());
                });
              },
              child: const Icon(Icons.language, color: Colors.blueAccent)),
          backgroundColor: Colors.white,
        ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("MMS"),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  border: InputBorder.none,
                  hintText: "email".tr,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  border: InputBorder.none,
                  hintText: "password".tr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _eventBus.dispose();
    super.dispose();
  }

}
