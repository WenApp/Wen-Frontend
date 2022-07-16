import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  String screen = '/alarms';

  void changeScreen(String newScreen) {
    screen = newScreen;
    notifyListeners();
  }
}
