import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:project/presentation/upload_extracts_screen/model/upload_extracts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data_manager_interface.dart';

class DataManager implements DataManagerInterface {
  static const String dataKey = 'stored_data';
  static const String apiUrl =
      'https://example.com/api/data'; // قم بتعديل الرابط إلى رابط API الفعلي

  @override
  Future<bool> isInternetConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
/*
  @override
  Future<void> saveDataLocally(List<UploadExtractsModel> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonDataList = data.map((item) => item.toJson()).toList();
    await prefs.setString(dataKey, jsonEncode(jsonDataList));

    bool isConnected = await isInternetConnected();
    if (isConnected) {
      await uploadDataToApi(data);
    }
  }

  @override
  Future<void> uploadDataToApi(List<UploadExtractsModel> data) async {
    try {
      List<Map<String, dynamic>> jsonDataList = data.map((item) => item.toJson()).toList();
      await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(jsonDataList),
      );
    } catch (e) {
      print('Error uploading data to API: $e');
    }
  }

  @override
  Future<List<UploadExtractsModel>> getLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonDataString = prefs.getString(dataKey);

    if (jsonDataString != null && jsonDataString.isNotEmpty) {
      List<Map<String, dynamic>> jsonDataList = jsonDecode(jsonDataString);
      List<UploadExtractsModel> dataList = jsonDataList.map((jsonMap) => UploadExtractsModel.fromJson(jsonMap)).toList();
      return dataList;
    } else {
      return [];
    }
  }
*/
}
