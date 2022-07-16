import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);
  @override
  _AlarmView createState() => _AlarmView();
}

class _AlarmView extends State<AlarmView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          PremiumContainer(headline: "Wen Tino!"),
          //AlarmViewContainer(),
          // TODO: add alarm detail cards
          Spacer(flex: 3),
          AlarmViewContainer(),
          Spacer(flex: 1),
          AlarmViewContainer(),
          Spacer(flex: 1),
          AlarmViewContainer(),
          Spacer(flex: 20),
        ],
      ),
    );
  }
}
