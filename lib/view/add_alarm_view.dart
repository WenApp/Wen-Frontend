import 'package:app/constants/alarm_attributes.dart';
import 'package:app/presentation/providers/alarm_provider.dart';
import 'package:app/view/util/navigation_controller/navigation_controller.dart';
import 'package:app/view/util/size/app_size.dart';
import 'package:app/view/widgets/app_bottom_sheet.dart';
import 'package:app/view/widgets/app_container.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/view/widgets/item_body.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app/data/model/alarm_attribute.dart';
import 'package:provider/provider.dart';

class AddAlarmView extends StatefulWidget {
  final bool edit;
  const AddAlarmView({Key? key, required this.edit}) : super(key: key);

  @override
  _AddAlarmView createState() => _AddAlarmView();
}

class _AddAlarmView extends State<AddAlarmView> {
  List<Widget> items = [];
  final Box<AlarmAttribute> _box = Hive.box<AlarmAttribute>('alarms');

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
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context, listen: true);
    items = [
      CoinSearchItemBody(
        title: pAlarmAttribute.coin,
        subtitle: pAlarmAttribute.coin,
      ),
      AlarmAttributeItemBody(
        icon: Icon(Icons.trending_up, color: AppColors.Malachite),
        title: pAlarmAttribute.indicator.type.name,
        itemType: 'indicator',
      ),
      AlarmAttributeItemBody(
        icon: Icon(Icons.calculate, color: AppColors.AmberSAE),
        title: pAlarmAttribute.operatorType.type == Operator.greater
            ? 'Greater Than'
            : 'Less Than',
        itemType: 'operator',
      ),
      AlarmAttributeItemBody(
        icon: Icon(Icons.money, color: AppColors.Malachite),
        title: pAlarmAttribute.targetPrice,
        itemType: 'value',
      ),
      AlarmAttributeItemBody(
        icon: Icon(Icons.volume_up, color: AppColors.AmberSAE),
        title: pAlarmAttribute.alertType.type.name,
        itemType: 'notification',
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AlarmViewItemContainer(
          isStatic: true,
          candleColor: pAlarmAttribute.operatorType.type == Operator.greater
              ? AppColors.Malachite
              : AppColors.OrangeRedCrayola,
          data: AlarmAttribute(
            coin: pAlarmAttribute.coin,
            currency: 'n/a',
            targetPrice: pAlarmAttribute.targetPrice,
            indicatorType: pAlarmAttribute.indicator,
            operatorType: pAlarmAttribute.operatorType,
            notificationType: pAlarmAttribute.alertType,
          ),
        ),
        const Spacer(flex: 1),
        Flexible(
          flex: 20,
          fit: FlexFit.tight,
          child: ListView.builder(
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: UnconstrainedBox(
                  child: AppItemContainer(
                    child: items[index],
                  ),
                ),
              );
            },
          ),
        ),
        const Spacer(flex: 1),
        Builder(
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
        const Spacer(flex: 1),
      ],
    );
  }

  Widget save() {
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context, listen: true);
    NavigationController navigation =
        Provider.of<NavigationController>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: AppItemContainer(
        color: AppColors.EerieBlack,
        border: Border.all(color: AppColors.Malachite, width: 2.0),
        onTap: () async {
          AlarmAttribute alarmAttribute = AlarmAttribute(
            coin: pAlarmAttribute.coin,
            currency: 'dollar',
            targetPrice: pAlarmAttribute.targetPrice,
            indicatorType: pAlarmAttribute.indicator,
            operatorType: pAlarmAttribute.operatorType,
            notificationType: pAlarmAttribute.alertType,
          );
          await _box.add(alarmAttribute);
          navigation.changeScreen('/alarms');
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
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context, listen: true);
    NavigationController navigation =
        Provider.of<NavigationController>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: AppItemContainer(
        color: AppColors.EerieBlack,
        border: Border.all(color: AppColors.OrangeRedCrayola, width: 2.0),
        onTap: () async {
          await _box.deleteAt(pAlarmAttribute.selectedIndex);
          navigation.changeScreen('/alarms');
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
