import 'dart:async';
import 'package:app/constants/alarm_attributes.dart';
import 'package:app/presentation/providers/alarm_provider.dart';
import 'package:app/view/widgets/app_container.dart';
import 'package:app/view/widgets/app_dropdown_button.dart';
import 'package:app/view/widgets/item_body.dart';
import 'package:flutter/material.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomSheetThumb extends StatelessWidget {
  const BottomSheetThumb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.0075,
      decoration: BoxDecoration(
        color: AppColors.SpanishGrey.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}

class AppBottomSheet extends StatelessWidget {
  final Widget body;
  const AppBottomSheet({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.EerieBlack,
      child: body,
    );
  }
}

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({Key? key}) : super(key: key);
  @override
  _SearchBottomSheet createState() => _SearchBottomSheet();
}

class _SearchBottomSheet extends State<SearchBottomSheet> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _items = [
    'BTC',
    'ADA',
    'ETH',
    'KDA',
    'DOT',
    'UNI',
    'POLK',
    'MATIC',
  ];
  List<String> filteredItems = [];

  final StreamController<List<String>> _streamController =
      StreamController<List<String>>();

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      onSearch();
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context);
    return AppBottomSheet(
      body: Column(
        children: [
          const Spacer(flex: 1),
          const BottomSheetThumb(),
          const Spacer(flex: 1),
          // Search field
          TextField(
            controller: _textController,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
              hintText: 'Search ... (BTC / BITCOIN)',
              hintStyle: GoogleFonts.quantico(
                fontSize: 20,
                color: AppColors.SpanishGrey.withOpacity(0.5),
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              isDense: true,
              //contentPadding:
            ),
            cursorColor: AppColors.AmberSAE,
            style: GoogleFonts.bungee(
              fontSize: 24.0,
              color: AppColors.SpanishGrey,
            ),
            onSubmitted: ((value) {
              for (String item in _items) {
                if (value.toLowerCase() == item.toLowerCase()) {
                  pAlarmAttribute.updateSelectedCoin(value);
                }
              }
            }),
          ),
          // Filter view
          const Spacer(flex: 1),
          Flexible(
            flex: 10,
            child: StreamBuilder<List<String>>(
              stream: _streamController.stream,
              initialData: _items,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.disabled_by_default,
                        color: AppColors.SpanishGrey,
                      ),
                      contentPadding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1),
                      title: Text(
                        snapshot.data![index],
                        style: GoogleFonts.quantico(fontSize: 20),
                      ),
                      textColor: AppColors.SpanishGrey,
                      onTap: (() {
                        onFilterItemSelect(index, pAlarmAttribute, snapshot);
                      }),
                    );
                  },
                );
              },
            ),
          ),
          const Spacer(flex: 1)
        ],
      ),
    );
  }

  void onSearch() {
    // Filter logic
    filteredItems = [];
    for (String item in _items) {
      if (item.toLowerCase().contains(_textController.text)) {
        filteredItems.add(item);
      }
    }
    _streamController.add(filteredItems);
  }

  void onFilterItemSelect(int index, AlarmAttributeProvider pAlarmAttribute,
      AsyncSnapshot<List<String>> snapshot) {
    _textController.text = snapshot.data![index];
    pAlarmAttribute.updateSelectedCoin(_textController.text);
  }
}

//TODO:
//modify the selection process by using a dropdown list instead of a button
//allows for further customisability
class ItemBottomSheet extends StatefulWidget {
  final String itemType;
  const ItemBottomSheet({Key? key, required this.itemType}) : super(key: key);
  @override
  _ItemBottomSheet createState() => _ItemBottomSheet();
}

class _ItemBottomSheet extends State<ItemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      body: Column(
        children: [
          const Spacer(flex: 1),
          const BottomSheetThumb(),
          const Spacer(flex: 1),
          if (widget.itemType == 'indicator')
            chooseIndicatorSheet()
          else if (widget.itemType == 'operator')
            chooseOperatorSheet()
          else if (widget.itemType == 'value')
            chooseValueSheet()
          else if (widget.itemType == 'notification')
            chooseNotificationSheet()
          else
            Container(),
          const Spacer(flex: 1)
        ],
      ),
    );
  }

  Widget itemSheet({required List<Widget> children}) {
    return Flexible(
      flex: 20,
      child: Column(
        children: [...children],
      ),
    );
  }

  Widget chooseIndicatorSheet() {
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context, listen: true);
    return itemSheet(children: [
      const Spacer(flex: 3),
      AppDropdownButton(
        value: pAlarmAttribute.indicator.type.name,
        onChanged: (value) {
          switch (value) {
            case 'price':
              pAlarmAttribute.updateSelectedIndicator(
                  IndicatorType(type: Indicator.price));
              break;
          }
        },
        items: [
          DropdownMenuItem<String>(
            value: 'price',
            child: AppDropdownButtonItemBody(
              title: 'Price',
              icon: Icon(
                Icons.attach_money_sharp,
                color: AppColors.Malachite,
              ),
            ),
          ),
        ],
      ),
      const Spacer(flex: 5),
      AppContainer(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Container(),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      const Spacer(flex: 10),
    ]);
  }

  Widget chooseOperatorSheet() {
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context, listen: true);
    return itemSheet(children: [
      const Spacer(flex: 1),
      AppDropdownButton(
        value: pAlarmAttribute.operatorType.type.name,
        onChanged: (value) {
          switch (value) {
            case 'greater':
              pAlarmAttribute
                  .updateSelectedOperator(OperatorType(type: Operator.greater));
              break;
            case 'less':
              pAlarmAttribute
                  .updateSelectedOperator(OperatorType(type: Operator.less));
              break;
          }
        },
        items: [
          DropdownMenuItem<String>(
            value: 'greater',
            child: AppDropdownButtonItemBody(
              title: 'Greater Than',
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.Malachite,
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: 'less',
            child: AppDropdownButtonItemBody(
              title: 'Less Than',
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.OrangeRedCrayola,
              ),
            ),
          )
        ],
      ),
      const Spacer(flex: 10)
    ]);
  }

  Widget chooseValueSheet() {
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context, listen: true);
    return itemSheet(children: [
      TextField(
        keyboardType: TextInputType.number,
        style: GoogleFonts.bungee(fontSize: 24, color: AppColors.SpanishGrey),
        textAlign: TextAlign.center,
        cursorColor: AppColors.AmberSAE,
        decoration: InputDecoration(
          hintText: 'Enter target price',
          hintStyle: GoogleFonts.quantico(
              fontSize: 20, color: AppColors.SpanishGrey.withOpacity(0.5)),
          border: InputBorder.none,
        ),
        onSubmitted: ((value) {
          if (value.isNotEmpty) pAlarmAttribute.updateValue(value);
        }),
      )
    ]);
  }

  Widget chooseNotificationSheet() {
    AlarmAttributeProvider pAlarmAttribute =
        Provider.of<AlarmAttributeProvider>(context, listen: true);
    return itemSheet(children: [
      const Spacer(flex: 1),
      AppDropdownButton(
        value: pAlarmAttribute.alertType.type.name,
        onChanged: (value) {
          switch (value) {
            case 'alarm':
              pAlarmAttribute
                  .updateSelectedAlertType(AlertType(type: Alert.alarm));
              break;
            case 'notify':
              pAlarmAttribute
                  .updateSelectedAlertType(AlertType(type: Alert.notify));
              break;
          }
        },
        items: [
          DropdownMenuItem<String>(
            value: 'alarm',
            child: AppDropdownButtonItemBody(
              title: 'Alarm',
              icon: Icon(
                Icons.alarm,
                color: AppColors.AmberSAE,
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: 'notify',
            child: AppDropdownButtonItemBody(
              title: 'Notify',
              icon: Icon(
                Icons.notification_add,
                color: AppColors.AmberSAE,
              ),
            ),
          )
        ],
      ),
      const Spacer(flex: 5),
      AppContainer(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Center(
          child: Text(
            'More notification types coming soon ...',
            style: GoogleFonts.bungee(
                color: AppColors.SpanishGrey.withOpacity(0.25), fontSize: 12.0),
          ),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      const Spacer(flex: 10),
    ]);
  }
}
