import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_portal/widgets/custom_app_bar.dart';

class ImageViewScreen extends StatelessWidget {
  final String imageUrl;

  const ImageViewScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'image_view'.tr(),
          showMoreIcon: false,
          controller: null,
          project: null,
        ),
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
