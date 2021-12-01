import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => {
        if (state.counterValue < 10)
          emit(CounterState(counterValue: state.counterValue + 1))
        else
          emit(CounterState(counterValue: state.counterValue))
      };

  void decrement() => {
        if (state.counterValue > 0)
          emit(CounterState(counterValue: state.counterValue - 1))
        else
          emit(CounterState(counterValue: state.counterValue))
      };

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return CounterState.fromMap(json);
    }
    return CounterState(counterValue: 0);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }
}
