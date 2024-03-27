import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddSafetyVisitToProjectController extends GetxController {
  //1
  int? safetySignValue;
  int? surveillanceCamerasValue;
  int? firstAidValue;
  int? temporaryFenceValue;
  int? entryExitGatesValue;
  int? onDutyGuardValue;
  int? offDutyGuardValue;

  //2
  int? monitorResponsibleValue;
  int? firstAidSuppliesValue;
  int? helmetValue;
  int? safetyShoesValue;
  int? safetyGlovesValue;
  int? safetyFirstSignValue;
  int? workUniformsValue;
  int? fireExtinguishersValue;
  int? safeRoadsAndPassagesValue;
  int? restAreaValue;
  int? chargingAreasValue;
  int? generalCleanlinessValue;
  int? emergencyVehiclesValue;
  int? certifiedClinicValue;
  int? protectionOfHighBalconiesAndExcavationsValue;
  int? directionalSignsValue;

  //3
  RxList<XFile> images = RxList<XFile>([]);
  RxList<XFile> videos = RxList<XFile>([]);
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController reportVisualsController = TextEditingController();

  bool isFirstPageDataComplete() {
    // تحقق من اكتمال البيانات هنا
    if (  safetySignValue == 0 ||
     surveillanceCamerasValue == 0 ||
     firstAidValue == 0 ||
    temporaryFenceValue == 0 ||
    entryExitGatesValue == 0 ||
     onDutyGuardValue == 0 ||
     offDutyGuardValue == 0 ) {
      return true;
    }
    return true;
  }

  bool isSecondPageDataComplete() {
    // تحقق من اكتمال البيانات للصفحة الثانية هنا
    if (   monitorResponsibleValue == 0 ||
    firstAidSuppliesValue == 0 ||
     helmetValue == 0 ||
     safetyShoesValue == 0 ||
     safetyGlovesValue == 0 ||
     safetyFirstSignValue == 0 ||
     workUniformsValue == 0 ||
     fireExtinguishersValue == 0 ||
     safeRoadsAndPassagesValue == 0 ||
     restAreaValue == 0 ||
     chargingAreasValue == 0 ||
     generalCleanlinessValue == 0 ||
    emergencyVehiclesValue == 0 ||
     certifiedClinicValue == 0 ||
     protectionOfHighBalconiesAndExcavationsValue == 0 ||
     directionalSignsValue == 0 ) {
      return false;
    }
    return true; // قم بتحديد شرط اكتمال البيانات للصفحة الثانية
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
