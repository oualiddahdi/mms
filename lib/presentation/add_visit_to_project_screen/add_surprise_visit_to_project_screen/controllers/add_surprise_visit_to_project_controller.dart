import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/core/network/network_info.dart';
import 'package:project/core/utils/api_constants.dart';
import 'package:project/core/utils/logger.dart';
import 'package:project/core/utils/pref_utils.dart';
import 'package:http/http.dart' as http;
import 'package:project/core/utils/progress_dialog_utils.dart';
import 'package:project/model/projects/projects.dart';
import 'package:path/path.dart' as path;

class AddSurpriseVisitToProjectController extends GetxController {
  late final Project project;

  @override
  void onInit() {
    super.onInit();
    project = Get.arguments as Project;
  }

  var images = <XFile>[].obs;
  var videos = <XFile>[].obs;
  late Long projId;
  late String visitFrom;
  late String visitTo;
  late String note;
  late VisitDoc visitDoc;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController reportVisualsController = TextEditingController();

  bool isSixthPageDataComplete() {
    // تحقق من اكتمال البيانات للصفحة السادسة هنا
    return true; // قم بتحديد شرط اكتمال البيانات للصفحة السادسة
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      final extension = path.extension(pickedImage.path).toLowerCase();
      if (extension == '.jpg' || extension == '.jpeg' || extension == '.png') {
        images.add(pickedImage);
      } else {
        // Handle unsupported file types if necessary
        print('Unsupported image type: $extension');
      }
    }
  }

  Future<void> pickVideo(ImageSource source) async {
    final pickedVideo = await ImagePicker().pickVideo(source: source);
    if (pickedVideo != null) {
      final extension = path.extension(pickedVideo.path).toLowerCase();
      if (extension == '.mp4' || extension == '.avi' || extension == '.mov') {
        videos.add(pickedVideo);
      } else {
        // Handle unsupported file types if necessary
        print('Unsupported video type: $extension');
      }
    }
  }

  Future<void> showImageSourceDialog(BuildContext context) async {
    pickImage(ImageSource.camera);
  }

  Future<void> showVideoSourceDialog(BuildContext context) async {
    pickVideo(ImageSource.camera);
  }

  Future<void> selectDateGregorian(
      BuildContext context, TextEditingController textEditingController) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
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
      note  = reportVisualsController.text.toString();

      if (images.isNotEmpty &&
          videos.isNotEmpty &&
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
          Uri.parse(ApiConstants.visits),
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

        // Proceed with your code (e.g., sending the request)
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
