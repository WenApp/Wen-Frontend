import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  String screen = '/alarms';
  Map<String, dynamic> args = {};

  void changeScreen(String newScreen) {
    screen = newScreen;
    notifyListeners();
  }

  void changeScreenWithArgs(String newScreen, Map<String, dynamic> pageArgs) {
    screen = newScreen;
    args = pageArgs;
    notifyListeners();
  }
}
