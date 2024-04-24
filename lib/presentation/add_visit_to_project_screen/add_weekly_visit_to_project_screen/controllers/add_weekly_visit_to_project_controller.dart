import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddWeeklyVisitToProjectController extends GetxController {
  //1
  int? safetySignValue;
  int? workSiteCleanLinessValue;
  int? consultingTeamValue;
  int? qualityControlLevelValue;
  int? contractorsWorkforceValue;
  int? hardwareValue;


  //3
  RxList<XFile> images = RxList<XFile>([]);
  RxList<XFile> videos = RxList<XFile>([]);

  bool isFirstPageDataComplete() {
    // تحقق من اكتمال البيانات هنا
    if (safetySignValue == 0 ||
        workSiteCleanLinessValue == 0 ||
        consultingTeamValue == 0 ||
        qualityControlLevelValue == 0 ||
        contractorsWorkforceValue == 0 ||
        hardwareValue == 0 ) {
      return false;
    }
    return true;
  }


  bool isFifthPageDataComplete() {
    // تحقق من اكتمال البيانات للصفحة الخامسة هنا
    if (images.isNotEmpty ||
        videos.isNotEmpty ){
      return false;
    }
    return true; // قم بتحديد شرط اكتمال البيانات للصفحة الخامسة
  }

  ///////////////////////

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      images.add(pickedImage);
    }
  }

  Future<void> pickVideo(ImageSource source) async {
    final pickedVideo = await ImagePicker().pickVideo(source: source);
    if (pickedVideo != null) {
      videos.add(pickedVideo);
    }
  }

  Future<void> showImageSourceDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('اختيار مصدر المرئيات'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('الكاميرا'),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickImage(ImageSource.camera);
                  },
                ),
                SizedBox(height: 8), // Use SizedBox for spacing
                GestureDetector(
                  child: Text('الستوديو'),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showVideoSourceDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('اختيار مصدر الفيديو'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('الكاميرا'),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickVideo(ImageSource.camera);
                  },
                ),
                SizedBox(height: 8), // Use SizedBox for spacing
                GestureDetector(
                  child: Text('الستوديو'),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickVideo(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<Null> selectDateGregorian(
      BuildContext context, TextEditingController textEditingController) async {
    await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        textEditingController.text =
            DateFormat('d-MM-y').format(selectedDate).toString();
      }
      return null;
    });
  }
}
