import 'dart:ffi';

import 'package:app/data/model/alarm.dart';
import 'package:app/presentation/bloc/set_alarm_bloc.dart';
import 'package:app/view/add_condition_view.dart';
import 'package:app/view/common/base_page.dart';
import 'package:app/view/util/theme/app_colors.dart';
import 'package:app/view/widgets/search_token.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:app/view/widgets/condition.dart';
import 'package:app/data/model/condition.dart';
import 'package:app/presentation/bloc/add_condition_bloc.dart';

class AddAlarmViewManager {
  final List<Widget> body;
  final List<ConditionCard> conditionCards;
  final List<Condition> conditions;

  AddAlarmViewManager(this.body, this.conditionCards, this.conditions);

  // void initBody() {
  //   body?.add(const SearchToken());
  //   body?.add(const AddCondition());
  // }

  // void populateBody(List<Condition> conditions) {
  //   conditionCards?.clear();
  //   for (int i = 0; i < conditions.length; i++) {
  //     conditionCards?.add(ConditionCard());
  //   }
  //   for (int i = 1; i <= conditions.length - 1; i++) {
  //     body.insert(i, _conditionCards.elementAt(i - 1));
  //   }
  // }

  // AddAlarmViewManager update() {
  //   return AddAlarmViewManager(
  //       body: body, conditionCards: conditionCards, conditions: conditions);
  // }
}

abstract class AddAlarmViewManagerEvent {}

class InitEvent extends AddAlarmViewManagerEvent {}

class AddConditionEvent extends AddAlarmViewManagerEvent {
  Condition condition;
  AddConditionEvent(this.condition);
}

class AddAlarmViewManagerBloc
    extends Bloc<AddAlarmViewManagerEvent, AddAlarmViewManager> {
  AddAlarmViewManagerBloc(AddAlarmViewManager initialState)
      : super(initialState) {
    on<AddConditionEvent>(addCondition);
    on<InitEvent>(init);
  }

  void init(
      AddAlarmViewManagerEvent event, Emitter<AddAlarmViewManager> emitter) {
    state.body.add(const SearchToken());
    state.body.add(const AddCondition());
    emitter(AddAlarmViewManager(
        state.body, state.conditionCards, state.conditions));
  }

  void addCondition(
      AddConditionEvent event, Emitter<AddAlarmViewManager> emitter) {
    state.conditions.add(event.condition);
    state.conditionCards.add(ConditionCard());
    state.body.removeLast();
    state.body.add(state.conditionCards.last);
    state.body.add(const AddCondition());
    emitter(AddAlarmViewManager(
        state.body, state.conditionCards, state.conditions));
  }
}

class AddAlarmView extends StatefulWidget {
  final IconData ops = Icons.arrow_back_ios;

  AddAlarmView({Key? key}) : super(key: key);
  @override
  _AddAlarmView createState() => _AddAlarmView();
}

class _AddAlarmView extends State<AddAlarmView> {
  Box<Alarm> alarms = Hive.box('user_alarms');

  TextEditingController searchInputController = TextEditingController();
  TextEditingController priceInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddAlarmViewManagerBloc>(context).add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(fab: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddConditionView()));
      },
    ), child: BlocBuilder<AddAlarmViewManagerBloc, AddAlarmViewManager>(
        builder: (BuildContext context, AddAlarmViewManager manager) {
      return ListView.builder(
          itemCount: manager.body.length,
          itemBuilder: (BuildContext context, int index) {
            return manager.body.elementAt(index);
          });
    }));
  }
}
