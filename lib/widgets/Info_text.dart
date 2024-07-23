import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_portal/core/utils/color_constant.dart';

class InfoText extends StatelessWidget {
  final String label;
  final String value;

  InfoText({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.primaryColor,
              fontSize: 12.0, // Adjust font size as needed
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).tr(),
          SizedBox(
            width: 10.0, // Adjust size as needed
          ),
          Text(" : ",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 12.0, // Adjust font size as needed
              )),
          Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.textColor,
              fontSize: 12.0, // Adjust font size as needed
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
