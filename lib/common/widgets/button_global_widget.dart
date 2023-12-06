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
          color:Color(0XFF0DAE91),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor,
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
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
