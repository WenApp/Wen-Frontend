import 'package:flutter/material.dart';
import 'package:app/view/util/theme/app_theme.dart';
import 'package:app/view/common/base_page.dart';

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
