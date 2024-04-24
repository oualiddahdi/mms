import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddAestheticVisitToProjectController extends GetxController {
  //1
  int projectPanelValue = 0;
  int siteCleanlinessValue = 0;
  int consultantTeamValue = 0;
  int qualityControlValue = 0;
  int contractorWorkforceValue = 0;
  int equipmentValue = 0;
  bool sampleApproval = false;
  bool timetableDelayed = false;

  //2
  int workersSafetyValue = 0; // State variable for workers' safety
  int siteSafetyValue = 0; // State variable for site safety

  //3
  TextEditingController sum = TextEditingController();

  //4
  int? groupValue1;
  TextEditingController comment = TextEditingController();
  TextEditingController actionsRemoveDelaysCauses = TextEditingController();

  //5
  RxList<XFile> images = RxList<XFile>([]);
  RxList<XFile> videos = RxList<XFile>([]);
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController reportVisualsController = TextEditingController();

  bool isFirstPageDataComplete() {
    // تحقق من اكتمال البيانات هنا
    if (projectPanelValue == 0 ||
        siteCleanlinessValue == 0 ||
        consultantTeamValue == 0 ||
        qualityControlValue == 0 ||
        contractorWorkforceValue == 0 ||
        equipmentValue == 0 ||
        !sampleApproval ||
        !timetableDelayed) {
      return false;
    }
    return true;
  }

  bool isSecondPageDataComplete() {
    // تحقق من اكتمال البيانات للصفحة الثانية هنا
    if (workersSafetyValue == 0 || siteSafetyValue == 0) {
      return false;
    }
    return true; // قم بتحديد شرط اكتمال البيانات للصفحة الثانية
  }

// اكمل باقي الصفحات بنفس الطريقة

  bool isThirdPageDataComplete() {
    // تحقق من اكتمال البيانات للصفحة الثالثة هنا
    if (sum.text == '') {
      return false;
    }
    return true; // قم بتحديد شرط اكتمال البيانات للصفحة الثالثة
  }

  bool isFourthPageDataComplete() {
    // تحقق من اكتمال البيانات للصفحة الرابعة هنا
    if (groupValue1 == 0 ||
        comment.text == '' ||
        actionsRemoveDelaysCauses.text == '') {
      return false;
    }
    return true; // قم بتحديد شرط اكتمال البيانات للصفحة الرابعة
  }

  bool isFifthPageDataComplete() {
    // تحقق من اكتمال البيانات للصفحة الخامسة هنا
    if (images.isNotEmpty ||
        videos.isNotEmpty ||
        startDateController.text == '' ||
        endDateController.text == '' ||
        reportVisualsController.text == '') {
      return false;
    }
    return true; // قم بتحديد شرط اكتمال البيانات للصفحة الخامسة
  }

  bool isSixthPageDataComplete() {
    // تحقق من اكتمال البيانات للصفحة السادسة هنا

    return true; // قم بتحديد شرط اكتمال البيانات للصفحة السادسة
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
