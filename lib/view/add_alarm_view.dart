import 'package:app/data/model/alarm_data.dart';
import 'package:app/presentation/providers/alarm_data_provider.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/widgets/item_body.dart';
import 'package:app/view/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddAlarmView extends StatefulWidget {
  final bool edit;
  const AddAlarmView({Key? key, required this.edit}) : super(key: key);

  @override
  _AddAlarmView createState() => _AddAlarmView();
}

class _AddAlarmView extends State<AddAlarmView> {
  final Box<AlarmData> _box = Hive.box<AlarmData>('alarms');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AlarmDataProvider pAlarmData =
        Provider.of<AlarmDataProvider>(context, listen: true);
    Padding bottomSeperator = Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02));

    final currencyFormatter =
        NumberFormat.simpleCurrency(locale: 'en_US', decimalDigits: 2);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AlarmViewItemContainer(
          isStatic: true,
          candleColor:
              pAlarmData.currAlarmData.condition?.type == ConditionType.greater
                  ? AppColors.Malachite
                  : AppColors.OrangeRedCrayola,
          data: pAlarmData.currAlarmData,
        ),
        const Spacer(flex: 1),
        Flexible(
          flex: 20,
          fit: FlexFit.tight,
          child: ListView(
            children: [
              UnconstrainedBox(
                child: AppItemContainer(
                  child: CoinSearchItemBody(
                    title: pAlarmData.currAlarmData.coin,
                    subtitle: pAlarmData.currAlarmData.coin,
                  ),
                ),
              ),
              bottomSeperator,
              UnconstrainedBox(
                child: AppItemContainer(
                  child: AlarmDataItemBody(
                    icon: Icon(Icons.trending_up, color: AppColors.Malachite),
                    title: pAlarmData.currAlarmData.indicator?.type?.name,
                    itemType: 'indicator',
                  ),
                ),
              ),
              bottomSeperator,
              UnconstrainedBox(
                child: AppItemContainer(
                  child: AlarmDataItemBody(
                    icon: Icon(Icons.calculate, color: AppColors.AmberSAE),
                    title: pAlarmData.currAlarmData.condition?.type ==
                            ConditionType.greater
                        ? 'Greater Than'
                        : 'Less Than',
                    itemType: 'condition',
                  ),
                ),
              ),
              bottomSeperator,
              UnconstrainedBox(
                child: AppItemContainer(
                  child: AlarmDataItemBody(
                    icon: Icon(Icons.money, color: AppColors.Malachite),
                    title: pAlarmData.currAlarmData.targetPrice,
                    itemType: 'value',
                  ),
                ),
              ),
              bottomSeperator,
              UnconstrainedBox(
                child: AppItemContainer(
                  child: AlarmDataItemBody(
                    icon: Icon(Icons.volume_up, color: AppColors.AmberSAE),
                    title: pAlarmData.currAlarmData.alert?.type?.name,
                    itemType: 'alert',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Builder(
                  builder: (BuildContext context) {
                    return widget.edit
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              save(),
                              delete(),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [save()],
                          );
                  },
                ),
              )
            ],
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }

  Widget save() {
    AlarmDataProvider pAlarmData =
        Provider.of<AlarmDataProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: AppItemContainer(
        color: AppColors.EerieBlack,
        border: Border.all(color: AppColors.Malachite, width: 2.0),
        onTap: () async {
          AlarmData alarmAttribute = AlarmData(
            coin: pAlarmData.currAlarmData.coin,
            currency: 'dollar',
            targetPrice: pAlarmData.currAlarmData.targetPrice,
            indicator: pAlarmData.currAlarmData.indicator,
            condition: pAlarmData.currAlarmData.condition,
            alert: pAlarmData.currAlarmData.alert,
          );
          if (!widget.edit) {
            await _box.add(alarmAttribute);
          } else {
            await _box.putAt(pAlarmData.selectedIndex, alarmAttribute);
          }
          context.pop();
        },
        child: Center(
          child: Text(
            "Save",
            style:
                GoogleFonts.bungee(color: AppColors.Malachite, fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  Widget delete() {
    AlarmDataProvider pAlarmData =
        Provider.of<AlarmDataProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: AppItemContainer(
        color: AppColors.EerieBlack,
        border: Border.all(color: AppColors.OrangeRedCrayola, width: 2.0),
        onTap: () async {
          await _box.deleteAt(pAlarmData.selectedIndex);
          context.pop();
        },
        child: Center(
          child: Text(
            "Delete",
            style: GoogleFonts.bungee(
                color: AppColors.OrangeRedCrayola, fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  Widget searchItem(Icon icon, String title, String subtitle) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Spacer(flex: 1),
        icon,
        const Spacer(flex: 1),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.bungee(
                  color: AppColors.SpanishGrey, fontSize: 24.0),
            ),
            Text(
              subtitle,
              style: GoogleFonts.openSans(
                  color: AppColors.SpanishGrey, fontSize: 16.0),
            )
          ],
        ),
        const Spacer(flex: 10),
        Icon(
          Icons.search,
          color: AppColors.SpanishGrey,
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
