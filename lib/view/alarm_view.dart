import 'package:app/data/model/alarm.dart';
import 'package:app/presentation/bloc/set_alarm_bloc.dart';
import 'package:app/view/add_alarm_view.dart';
import 'package:app/view/common/base_page.dart';
import 'package:app/view/widgets/add_alarm_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);
  @override
  _AlarmView createState() => _AlarmView();
}

class _AlarmView extends State<AlarmView> {
  Box<Alarm> alarms = Hive.box('user_alarms');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        fab: AddAlarmFAB(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddAlarmView();
          }));
        }),
        child: BlocConsumer<AlarmBloc, int>(
          listener: (context, state) {},
          builder: (context, state) {
            debugPrint(state.toString());
            return ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      alarms.values.elementAt(index).coin,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                });
          },
        ));
  }
}
