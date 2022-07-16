import 'package:app/data/model/condition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/view/widgets/condition.dart';
import 'package:app/view/widgets/search_token.dart';
import 'package:flutter/material.dart';

class AddAlarmViewManager {
  final List<Widget> body;
  final List<ConditionCard> conditionCards;
  final List<Condition> conditions;

  AddAlarmViewManager(this.body, this.conditionCards, this.conditions);
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
