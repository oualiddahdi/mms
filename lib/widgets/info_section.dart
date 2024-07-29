import 'package:flutter/material.dart';
import 'package:project_portal/core/utils/size_utils.dart';
import 'package:project_portal/core/utils/color_constant.dart';

class InfoSection extends StatelessWidget {
  final String label;
  final String content;

  const InfoSection({Key? key, required this.label, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: ColorConstant.black900),
        ),
        SizedBox(height: 10.v), // Spacing between label and content
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(11.0.v), // Padding inside the container
          decoration: BoxDecoration(
            color: ColorConstant.blueGray50, // Background color
            borderRadius: BorderRadius.circular(8.0.v), // Rounded corners
            border: Border.all(
              color: ColorConstant.whiteA700, // Border color
              width: 2.0, // Border width
            ),
          ),
          child: Text(
            content,
            style: const TextStyle(
              color: ColorConstant.black900,
              fontSize: 14.0, // Font size
            ),
          ),
        ),
        SizedBox(height: 28.v),

      ],
    );
  }
}
