import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable


class PrefUtils {
  PrefUtils() {
    init();
  }
  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  // Ensure this method is static
  static PrefUtils getInstance() {
    return PrefUtils();
  }

  static SharedPreferences? _sharedPreferences;

  /// Initializes the [SharedPreferences] instance and sets it to the
  /// [_sharedPreferences] variable.
  ///
  /// This method should be called at the beginning of the application startup to
  /// ensure that [SharedPreferences] is ready to use.
  ///
  /// Throws an exception if there is an error while initializing the instance.
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    debugPrint('SharedPreference Initialized');
  }

  /// Clears all data from the SharedPreferences instance.
  void clearPreferencesData() async {
    await _sharedPreferences!.clear();
  }

  Future<void> setToken(String value) async {
    await _sharedPreferences!.setString('token', value);
  }

  String getToken() {
    try {
      return _sharedPreferences!.getString('token') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setId(String value) async {
    await _sharedPreferences!.setString('id', value);
  }

  String getId() {
    try {
      return _sharedPreferences!.getString('id') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setSwitchValue(bool value) async {
    await _sharedPreferences!.setBool('switchValue', value);
  }


  Future<bool> getSwitchValue() async {
    try {
      await initialize(); // Ensure _sharedPreferences is initialized
      return _sharedPreferences?.getBool('switchValue') ?? false;
    } catch (e) {
      print("Error reading switch value: $e");
      return false;
    }
  }
}
