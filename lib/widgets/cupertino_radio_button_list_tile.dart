import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/sizes.dart';

class CupertinoRadioButtonListTile extends StatelessWidget {
  final String title;
  final dynamic groupValue;
  final dynamic value;
  final Function(dynamic) onChanged;

  const CupertinoRadioButtonListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: _customRadioButton(context),
      ),
    );
  }

  Widget _customRadioButton(BuildContext context) {
    final bool isSelected = value == groupValue;

    return Container(
      padding: const EdgeInsets.all(mediumPaddingSize),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelected ? ColorConstant.whiteA700 : Colors.transparent,
        borderRadius: BorderRadius.circular(mediumBorderSize),
      ),
      child: Center(
        child: isSelected
            ? Text(
          title,
          style: const TextStyle(
            fontSize: smallFontSize,
            color: ColorConstant.primaryColor,

          ),
        )
            : Text(
          title,
          style: TextStyle(
            fontSize: smallFontSize,
            color: isSelected ? ColorConstant.primaryColor :ColorConstant.whiteA700,
          ),
        ),
      ),
    );
  }
}
