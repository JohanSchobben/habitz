import 'package:flutter/material.dart';

class BottomPart extends StatelessWidget {
  final Widget child;

  const BottomPart({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    double width = screenWidth > 400 ? screenWidth * 0.7 : screenWidth;

    return Container(
      width: width,
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