import 'package:flutter/material.dart';
import 'package:project/common/app_colors.dart';


class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({Key? key, required this.onPress, required this.text})
      : super(key: key);

  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: const BoxDecoration(
          color:AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(14)),

        ),

        child: Text(
          text,
          style:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 16),
        ),
      ),
    );
  }
}
