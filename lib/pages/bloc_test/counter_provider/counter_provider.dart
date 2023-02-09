import 'package:riverpod/riverpod.dart';

class Counter{
  const Counter(this.value,);
  final int value;
}

final counterNotifierProvider = StateNotifierProvider<CounterNotifier,Counter>((ref) {
  return CounterNotifier();

});

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter(0));

  increment(){
    state = Counter(state.value+1);
  }
  decrement(){
    state = Counter(state.value -1);
  }


}


final handler = Provider((ref) {
  if(ref.watch(eventsProvider)==CounterIncrementEvent()) ref.read(counterNotifierProvider.notifier).increment();
  if(ref.watch(eventsProvider)==CounterDecrementEvent()) ref.read(counterNotifierProvider.notifier).decrement();
});




class CounterIncrementEvent extends CounterEvent{}

class CounterDecrementEvent extends CounterEvent{}

abstract class CounterEvent{

}


final eventsProvider = StateNotifierProvider<EventNotifier, CounterEvent?>((ref) {


  return EventNotifier();
});

class EventNotifier extends StateNotifier<CounterEvent?> {
  EventNotifier() : super(null);

   increment(){
     state = CounterIncrementEvent();
  }
  decrement(){
     state = CounterDecrementEvent();
  }


}

