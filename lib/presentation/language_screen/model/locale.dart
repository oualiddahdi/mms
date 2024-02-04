import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// AppLocale is a class representing a locale with a localeName and a languageCode.
class AppLocale extends Equatable {
  final String localeName;
  final String languageCode;

  // Constructor for creating an instance of AppLocale with required parameters.
  const AppLocale({required this.localeName, required this.languageCode});

  // A list of supported AppLocales.
  static List<AppLocale> supportedLocales = [
    const AppLocale(localeName: 'English', languageCode: 'en'),
    const AppLocale(localeName: 'Arabic', languageCode: 'ar'),
  ];

  // Getter method to convert the languageCode to a Locale.
  Locale get locale => Locale(languageCode);

  // Overriding the props getter from Equatable to compare instances by their locale.
  @override
  List<Object?> get props => [
        locale,
      ];
}
