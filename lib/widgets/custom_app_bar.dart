import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: ColorConstant.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
           Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ).tr(),
          const SizedBox(width: 56), // To align the title in the center
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56); // Adjust the height as needed
}