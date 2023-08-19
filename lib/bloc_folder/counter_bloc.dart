import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on<Increment>((event, emit) {
      final curVal = state.count;
      final newVal = curVal + 1;
      return emit(CounterState(count: newVal)); // or count : state.count+1
    });

    on<Decrement>((event, emit) {
      final newVal = state.count - 1;
      return emit(CounterState(count: newVal));
    });
  }
}
