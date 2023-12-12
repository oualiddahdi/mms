import 'package:flutter/material.dart';

// Custom widget representing a styled TextFormField
class TextFormFieldWidget extends StatelessWidget {
  final int maxLines; // Maximum number of lines for the TextFormField
  final String hintText; // Hint text for the TextFormField
  final TextEditingController controller; // Controller to manage the text input

  // Constructor for the TextFormFieldWidget
  const TextFormFieldWidget({
    Key? key,
    required this.maxLines,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Expanded widget to take all available vertical space within its parent
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
            // TextFormField for text input
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
                  ),
                ),
                // Additional borders and formatting can be added here
              ),
            ),
          ),
        ),
      ),
    );
  }
}
