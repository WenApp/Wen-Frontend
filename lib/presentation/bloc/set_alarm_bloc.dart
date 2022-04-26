// ignore_for_file: constant_identifier_names
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AlarmEvent {}

class AddAlarm extends AlarmEvent {}

class CancelAddAlarm extends AlarmEvent {}

class AlarmState {
  int? alarmID;

  AlarmState({this.alarmID});
}

class SetAlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  SetAlarmBloc(AlarmState initialState) : super(initialState) {
    on<AddAlarm>(onAddAlarm);
    on<CancelAddAlarm>(onAddAlarmCancel);
  }

  void onAddAlarm(AlarmEvent event, Emitter<AlarmState> emit) {
    emit(AlarmState(alarmID: event.hashCode));
  }

  void onAddAlarmCancel(AlarmEvent event, Emitter<AlarmState> emit) {
    emit(AlarmState(alarmID: 0));
  }
}

class AlarmBloc extends Cubit<int> {
  AlarmBloc(int initialState) : super(initialState);

  void onAddAlarm(int length) {
    emit(length);
  }
}
