import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final int maxLines;
  final String hintText;
  final TextEditingController controller;

  const TextFormFieldWidget(
      {Key? key,
      required this.maxLines,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          height: 60,
          margin: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.black38),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                )),
                // ... المزيد من الحدود والتنسيقات هنا
              ),
            ),
          ),
        ),
      ),
    );
  }
}
