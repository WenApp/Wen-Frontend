import 'package:app/data/model/condition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// abstract class AddConditionEvent {}

// class AddCondition extends AddConditionEvent {}

// class AddConditionState {
//   bool? isSet;
//   List<Condition>? conditions;
//   AddConditionState({this.isSet, this.conditions});
// }

// class AddConditionBloc extends Bloc<AddConditionEvent, AddConditionState> {
//   AddConditionBloc(AddConditionState initialState) : super(initialState) {
//     on<AddCondition>(onAddCondition);
//   }

//   void onAddCondition(
//       AddConditionEvent event, Emitter<AddConditionState> emit) {
//     emit(AddConditionState());
//   }
// }

class AddConditionCubit extends Cubit<List<Condition>> {
  final List<Condition> conditions;
  AddConditionCubit(this.conditions) : super(conditions);

  void addCondition(Condition condition) {
    state.add(condition);
    emit(List.from(state));
  }
}
