

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DelightToast {

 static onOnTapSignInError(context) {

    DelightToastBar(
      autoDismiss: true,
      builder: (context) =>  const ToastCard(
        leading: Icon(
          Icons.error_outlined,
          color: Colors.red,
          size: 28,
        ),
        title: Text(
          "Invalid username or password!",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    ).show(context);

  }


}