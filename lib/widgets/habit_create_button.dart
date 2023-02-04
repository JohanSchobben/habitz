import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HabitCreateButton extends StatelessWidget {
  final  void Function() onPressed;

  const HabitCreateButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.brown),
          overlayColor: MaterialStatePropertyAll(Colors.white)
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: FaIcon(FontAwesomeIcons.plus),
          ),
          Text("nieuwe gewoonte")
        ],
      ),
    );
  }
}
