import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);
  @override
  _SettingsView createState() => _SettingsView();
}

class _SettingsView extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          PremiumContainer(headline: "Wen Binance!"),
        ],
      ),
    );
  }
}
