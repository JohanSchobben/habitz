import 'package:flutter/material.dart';

abstract class Bloc {
  void dispose();
}

class BlocProvider<T extends Bloc> extends InheritedWidget {
  final T bloc;
  const BlocProvider({
    super.key,
    required super.child,
    required this.bloc,
  });



  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static T of<T extends Bloc>(BuildContext context) {
    var bloc = context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>()?.bloc;
    if (bloc == null){
      throw Error();
    } else {
      return bloc;
    }

  }

}