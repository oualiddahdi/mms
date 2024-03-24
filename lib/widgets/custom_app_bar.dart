import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onMorePressed, // تعريف وظيفة الاكشن كوسيط
    this.showMoreIcon = false,
  }) : super(key: key);

  final String title;
  final Function onMorePressed; // استخدام وظيفة الاكشن كوسيط
  final bool showMoreIcon;

  @override
  Widget build(BuildContext context) {
    Widget moreIcon = showMoreIcon
        ? PopupMenuButton<int>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      offset: Offset(0, 50),
      padding: EdgeInsets.zero,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text('visits').tr(),
          onTap: () {
            onMorePressed();
          },
        ),
      ],
      initialValue: 1,
      onSelected: (value) {
        // Handle the selection
      },
      onCanceled: () {
        // Handle the cancellation
      },
      tooltip: 'Show menu',
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      color: Colors.grey[200],
      enabled: true,
    )
        : Container(); // أو أي عنصر غير مرئي

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
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ).tr(),
          ),
          moreIcon, // عرض الأيقونة
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(56); // Adjust the height as needed
}
