import 'package:habitz/models/habit.dart';
import 'package:habitz/state/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class HabitsBloc extends Bloc {
  final _subject = BehaviorSubject<List<Habit>>();

  ValueStream<List<Habit>> get habits$ => _subject.stream;

  void registerHabit(String name) {
    Habit habit = Habit(name, 0, DateTime.now());
    _subject.add([..._subject.value, habit]);
  }

  void removeHabit(Habit habit) {
    var value = _subject.value;
    var newHabits = value.where((element) => element == habit).toList();
    _subject.add(newHabits);
  }

  @override
  void dispose() {
    _subject.close();
  }
}