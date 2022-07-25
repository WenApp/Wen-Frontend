import 'package:app/presentation/bloc/set_alarm_bloc.dart';
import 'package:app/view/widgets/app_container.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/view/widgets/item_body.dart';

class AddAlarmView extends StatefulWidget {
  final bool edit;
  const AddAlarmView({Key? key, required this.edit}) : super(key: key);

  @override
  _AddAlarmView createState() => _AddAlarmView();
}

class _AddAlarmView extends State<AddAlarmView> {
  List<ItemBodyMixin> items = [];
  @override
  void initState() {
    super.initState();
    items = [
      CoinSearchItemBody(
          title: 'SOL',
          subtitle: 'Solana',
          onTapped: () {
            debugPrint('Search button');
          }),
      AlarmAttributeItemBody(
          icon: Icon(Icons.trending_up, color: AppColors.Malachite),
          title: 'Price',
          onTapped: () {
            debugPrint('Price button');
          }),
      AlarmAttributeItemBody(
          icon: Icon(Icons.calculate, color: AppColors.AmberSAE),
          title: 'Greater',
          onTapped: () {
            debugPrint('Operator button');
          }),
      AlarmAttributeItemBody(
          icon: Icon(Icons.money, color: AppColors.Malachite),
          title: '40.00',
          onTapped: () {
            debugPrint('Value button');
          }),
      AlarmAttributeItemBody(
          icon: Icon(Icons.volume_up, color: AppColors.AmberSAE),
          title: 'Sound',
          onTapped: () {
            debugPrint('Notificaton type button');
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const AlarmViewItemContainer(isStatic: true),
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
                    onTap: items.elementAt(index).onTap(),
                    child: items[index],
                  ),
                ),
              );
            },
          ),
        ),
        const Spacer(flex: 1),
        Builder(
          builder: (BuildContext ontext) {
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: AppItemContainer(
        color: AppColors.EerieBlack,
        border: Border.all(color: AppColors.Malachite, width: 2.0),
        onTap: () {},
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
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: AppItemContainer(
        color: AppColors.EerieBlack,
        border: Border.all(color: AppColors.OrangeRedCrayola, width: 2.0),
        onTap: () {},
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

  Widget item(Icon icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 10,
        ),
        icon,
        const Spacer(
          flex: 1,
        ),
        Text(
          title,
          style: GoogleFonts.bungee(
            color: AppColors.SpanishGrey,
            fontSize: 24.0,
          ),
        ),
        const Spacer(
          flex: 10,
        ),
      ],
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
