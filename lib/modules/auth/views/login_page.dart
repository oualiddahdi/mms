import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/common/widgets/button_global_widget.dart';
import 'package:project/modules/home/views/home_page.dart';
import 'package:project/modules/settings/language/controllers/language_controller.dart';

import 'package:project/modules/settings/language/views/language_page.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool _isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {

    context.watch<LanguageController>();

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: InkWell(
              onTap: () {
                setState(() {

                 Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => const LanguageScreen(),
                  ));

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
            const Text("MMS").tr(),
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
                  hintText: "email".tr(),
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: controllerPassword,
                textAlignVertical: TextAlignVertical.center,
                obscureText: !_isPasswordVisible, // Toggle visibility based on the state
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Toggle the visibility state
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: "password".tr(),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonGlobal(onPress: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));

            }, text: 'signIn'.tr())
          ],
        ),
      ),
    );
  }


}
