import 'package:habitz/state/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class HabitsBloc extends Bloc {
  final _subject = BehaviorSubject<String>();

  ValueStream<String> get foo {
    return _subject.stream;
  }

  void newName(String name) {
    _subject.add(name);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}