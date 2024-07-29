import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_portal/core/utils/progress_dialog_utils.dart';
import 'package:project_portal/model/projects/projects.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as path;

import 'package:http/http.dart' as http;


import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api_constants.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/pref_utils.dart';

class AddSurpriseVisitToProjectController extends GetxController {
  late final Project project;

  var images = <XFile>[].obs;
  var videos = <XFile>[].obs;
  VideoPlayerController? videoPlayerController;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController reportVisualsController = TextEditingController();

  late String visitFrom;
  late String visitTo;
  late String note;

  @override
  void onInit() {
    super.onInit();
    project = Get.arguments as Project;
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }

  bool isSixthPageDataComplete() {
    // التأكد من أن جميع الحقول النصية ليست فارغة
    bool isTextFieldsFilled = startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty &&
        reportVisualsController.text.isNotEmpty;

    // التأكد من أن هناك صور أو فيديوهات تم اختيارها
    bool hasMedia = images.isNotEmpty || videos.isNotEmpty;

    // التأكد من اكتمال جميع البيانات المطلوبة
    return isTextFieldsFilled && hasMedia;
  }


  Future<void> showImageSourceDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () async {
                    Navigator.pop(context);
                    await pickImage(ImageSource.camera);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                // GestureDetector(
                //   child: Text('Gallery'),
                //   onTap: () async {
                //     Navigator.pop(context);
                //     await pickImage(ImageSource.gallery);
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showVideoSourceDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('select_video_source').tr(),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () async {
                    Navigator.pop(context);
                    await pickVideo(ImageSource.camera);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                // GestureDetector(
                //   child: Text('Gallery'),
                //   onTap: () async {
                //     Navigator.pop(context);
                //     await pickVideo(ImageSource.gallery);
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }


  Future<void> pickImage(ImageSource source) async {
    final permissionStatus = await requestPermission(Permission.camera);
    if (permissionStatus.isGranted) {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        final extension = path.extension(pickedImage.path).toLowerCase();
        if (extension == '.jpg' || extension == '.jpeg' || extension == '.png') {
          images.add(pickedImage);
        } else {
          print('Unsupported image type: $extension');
        }
      }
    } else {
      Get.snackbar('Permission Denied', 'Camera access is required to take pictures.');
    }
  }

  Future<void> pickVideo(ImageSource source) async {
    final permissionStatus = await requestPermission(Permission.camera);
    if (permissionStatus.isGranted) {
      final pickedVideo = await ImagePicker().pickVideo(source: source);
      if (pickedVideo != null) {
        final extension = path.extension(pickedVideo.path).toLowerCase();
        if (extension == '.mp4' || extension == '.avi' || extension == '.mov') {
          videos.add(pickedVideo);
        } else {
          print('Unsupported video type: $extension');
        }
      }
    } else {
      Get.snackbar('Permission Denied', 'Camera access is required to record videos.');
    }
  }


  Future<PermissionStatus> requestPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isDenied) {
      // يمكنك طلب الإذن مرة أخرى هنا إذا رغبت في ذلك.
      // يمكن أيضًا تقديم رسالة للمستخدم لتوضيح سبب الحاجة للإذن.
      Get.snackbar('Permission Denied', 'Please grant the necessary permissions.');
    }
    return status;
  }



  Future<void> initializeVideoPlayer(String videoPath) async {
    videoPlayerController = VideoPlayerController.file(File(videoPath))
      ..addListener(() {
        if (videoPlayerController!.value.hasError) {
          print('Video player error: ${videoPlayerController!.value.errorDescription}');
        }
      })
      ..initialize().then((_) {
        videoPlayerController!.play();
        update(); // تحديث واجهة المستخدم إذا لزم الأمر
      });
  }

  Future<void> selectDateGregorian(
      BuildContext context, TextEditingController textEditingController) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 10, minute: 15),
      );

      if (selectedTime != null) {
        final DateTime finalDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        textEditingController.text =
            DateFormat('yyyy-MM-ddTHH:mm:ss').format(finalDateTime);
      }
    }
  }

  String getContentType(String extension) {
    switch (extension) {
      case '.jpg':
      case '.jpeg':
        return 'image/jpeg';
      case '.png':
        return 'image/png';
      case '.mp4':
        return 'video/mp4';
      case '.avi':
        return 'video/x-msvideo';
      case '.mov':
        return 'video/quicktime';
      default:
        return 'application/octet-stream'; // fallback
    }
  }

  Future<void> submitVisit() async {
    try {
      visitFrom = startDateController.text.toString();
      visitTo = endDateController.text.toString();
      note = reportVisualsController.text.toString();

      if (images.isNotEmpty &&
          visitFrom != '' &&
          visitTo != '' &&
          note != '') {
        // Combine images and videos into a single list
        List<XFile> allFiles = [];
        allFiles.addAll(images);
        allFiles.addAll(videos);

        // Create list of File objects for visitDoc
        List<File> visitDocList =
        allFiles.map((file) => File(file.path)).toList();

        // Construct the body of the request
        final token = Get.find<PrefUtils>().getToken();
        final Map<String, dynamic> body = {
          'proj_id': project.projectId,
          'visitFrom': visitFrom,
          'visitTo': visitTo,
          'visitType': "1",
          'note': note,
        };

        // Prepare the request
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(ApiService.visits),
        );

        // Add headers
        request.headers['Authorization'] = 'Bearer $token';
        request.headers['Content-Type'] = 'multipart/form-data';

        // Add fields to request
        body.forEach((key, value) {
          request.fields[key] = value.toString();
        });

        // Add files to request
        for (var file in visitDocList) {
          final extension = path.extension(file.path).toLowerCase();
          request.files.add(
            http.MultipartFile(
              'visitDoc',
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: path.basename(file.path),
              contentType: MediaType('application', getContentType(extension)),
            ),
          );
        }

        // Show progress dialog if needed
        ProgressDialogUtils.showProgressDialog();

        // Check network availability if needed
        await NetworkUtil.isNetworkAvailable();

        // Send the request
        var streamedResponse = await request.send();

        // Get the response
        var response = await http.Response.fromStream(streamedResponse);

        // Hide progress dialog
        ProgressDialogUtils.hideProgressDialog();

        // Handle the response
        if (response.statusCode == 200) {
          // Handle success
          print('Visit submitted successfully: ${response.body}');
          // You can handle the successful response here
        } else {
          // Handle failure
          print('HTTP Error ${response.statusCode}: ${response.body}');
          throw 'HTTP Error ${response.statusCode}: ${response.body}';
        }
      } else {
        // Handle the case where one or more variables are empty or null
        Get.snackbar('Error', 'Please fill in all required fields.');
      }
    } catch (error, stackTrace) {
      // Handle errors
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      Get.snackbar('Error', 'Failed to submit visit');
    }
  }
}

class VisitDoc {
  int visitId;
  String fileName;

  VisitDoc({required this.visitId, required this.fileName});

  Map<String, dynamic> toJson() => {
    'visitId': visitId,
    'fileName': fileName,
  };
}
