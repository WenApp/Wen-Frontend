import 'package:app/view/common/base_page.dart';
import 'package:app/view/widgets/candle.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestView createState() => _TestView();
}

class _TestView extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AlarmViewItemContainer(
            isStatic: false,
            index: 0,
            candleColor: AppColors.Malachite,
          ),
          AlarmViewItemContainer(
            isStatic: false,
            index: 1,
            candleColor: AppColors.OrangeRedCrayola,
          ),
          AlarmViewItemContainer(
            isStatic: false,
            index: 2,
            candleColor: AppColors.SpanishGrey,
          ),
        ],
      ),
    );
  }
}
