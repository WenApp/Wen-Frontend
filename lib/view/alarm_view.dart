import 'package:app/view/widgets/app_container.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/util/size/app_size.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

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
        children: [
          const PremiumItemContainer(headline: "Wen Tino!"),
          const Spacer(flex: 1),
          Flexible(
            flex: 25,
            child: ListView.builder(
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return UnconstrainedBox(
                  constrainedAxis: Axis.vertical,
                  child: AlarmViewItemContainer(
                    isStatic: false,
                    index: index,
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
