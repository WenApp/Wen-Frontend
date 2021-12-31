import 'package:flutter/material.dart';
import 'package:app/screens/common/base_page.dart';
import 'package:app/util/theme/app_theme.dart';

void main() {
  runApp(const WenApp());
}

class WenApp extends StatefulWidget {
  const WenApp({Key? key}) : super(key: key);

  @override
  _WenApp createState() => _WenApp();
}

class _WenApp extends State<WenApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BasePage(),
      theme: AppTheme.primaryTheme,
    );
  }
}