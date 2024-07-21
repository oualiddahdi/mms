import 'package:flutter/material.dart';
import 'package:project_portal/core/utils/sizes.dart';

class CustomCheckBoxes extends StatelessWidget {
  final String title;
  final dynamic groupValue;
  final dynamic value;
  final Function(dynamic) onChanged;

  const CustomCheckBoxes({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: ListTile(
        leading: _customRadioButton(context),
        title: Text(
          title,
          style: const TextStyle(fontSize: smallFontSize),
        ),
      ),
    );
  }

  Widget _customRadioButton(BuildContext context) {
    final bool isSelected = value == groupValue;
    final ThemeData themeData = Theme.of(context);

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: isSelected ? themeData.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(80),
        border: Border.all(color: themeData.primaryColor),
      ),
      child: Center(
        child: isSelected
            ? Icon(Icons.check, size: 10, color: Colors.white)
            : SizedBox.shrink(),
      ),
    );
  }
}
