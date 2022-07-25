import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);
  @override
  _SettingsView createState() => _SettingsView();
}

class _SettingsView extends State<SettingsView> {
  List<Function()> _onTapped = [];
  @override
  Widget build(BuildContext context) {
    _onTapped = [
      () {
        debugPrint('1');
      },
      () {
        debugPrint('2');
      },
      () {
        debugPrint('3');
      },
      () {
        debugPrint('4');
      },
      () {
        debugPrint('5');
      },
    ];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const PremiumItemContainer(headline: "Wen Binance!"),
          const Spacer(flex: 1),
          Flexible(
            flex: 20,
            child: ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: UnconstrainedBox(
                    constrainedAxis: Axis.vertical,
                    child: AppItemContainer(
                      onTap: _onTapped[index],
                      child: Row(
                        children: [Container()],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
