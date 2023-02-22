import 'package:flutter/material.dart';

abstract class Bloc {
  void dispose();
}

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  const BlocProvider({
    super.key,
    required this.child,
    required this.bloc,
  });


  static T of<T extends Bloc>(BuildContext context) => context.findAncestorWidgetOfExactType<BlocProvider<T>>()!.bloc;

  @override
  State<StatefulWidget> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T> extends State<BlocProvider<Bloc>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}