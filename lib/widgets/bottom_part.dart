import 'package:flutter/material.dart';

class BottomPart extends StatelessWidget {
  final Widget child;

  const BottomPart({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32)
          )
      ),
      child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 8),
          child: child
      ),
    );
  }
}