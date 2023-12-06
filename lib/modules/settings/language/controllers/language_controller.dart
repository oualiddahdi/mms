import 'package:flutter/material.dart';

// LanguageController is a ChangeNotifier used for managing language-related state.
class LanguageController extends ChangeNotifier {
  // onLanguageChanged is called to indicate that the language has changed.
  // This method introduces a delay of 1000 milliseconds and then notifies listeners.
  onLanguageChanged() async {
    // Simulating an asynchronous operation (e.g., fetching new language data)
    await Future.delayed(Duration(milliseconds: 1000));

    // Notify all registered listeners that the internal state (language) has changed.
    notifyListeners();
  }
}
