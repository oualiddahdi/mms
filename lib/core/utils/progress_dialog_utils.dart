import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  /// Hides the progress dialog if it is currently visible.
  static void hideProgressDialog() {
    if (isProgressVisible) {
      Get.back();
      isProgressVisible = false;
    }
  }
}
