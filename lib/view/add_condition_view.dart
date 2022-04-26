import 'package:app/data/model/condition.dart';
import 'package:app/presentation/bloc/add_condition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/view/add_alarm_view.dart';

class AddConditionView extends StatefulWidget {
  const AddConditionView({Key? key}) : super(key: key);

  @override
  _AddConditionView createState() => _AddConditionView();
}

class _AddConditionView extends State<AddConditionView> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddAlarmViewManagerBloc>(context).add(AddConditionEvent(
        Condition(
            indicatorType: Price(),
            operatorType: LessThanEQ(),
            value: "SHEEESH")));
    return Container(
      color: Colors.white,
      child: const Text(
        "AddConditionView",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
