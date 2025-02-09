import 'package:ai_agents_vertex_ai/models/meta_data.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  Metadata? metadata;

  void updateMetadata(Metadata newMetadata) {
    metadata = newMetadata;
    notifyListeners();
  }

  void clearMetadata() {
    metadata = null;
    notifyListeners();
  }
}

class ThemeNotifier extends ChangeNotifier {
  bool darkMode = false;

  Brightness get brightness => darkMode ? Brightness.dark : Brightness.light;

  void toggleDarkMode(bool val) {
    darkMode = val;
    notifyListeners();
  }
}