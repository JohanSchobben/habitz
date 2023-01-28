import 'package:flutter/material.dart';
import 'package:habitz/utils/date.dart';
import 'package:habitz/utils/string.dart';

class HabitCard extends StatelessWidget {
  final String name;
  final int times;
  final DateTime startTime;

  const HabitCard(this.name, this.times, this.startTime,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 16,
                spreadRadius: 0,
                offset: Offset.fromDirection(90, 5)
            )
          ],
          border: Border.all(
              color: Colors.grey.shade200
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              name.capitalize(),
              style: Theme.of(context).textTheme.headlineSmall
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    "Je bent begonnen met $name op ${startTime.day} ${startTime.monthText} ${startTime.year}",
                    maxLines: 3,
                    softWrap: true,
                  ),
                ),
                Container(
                  height: 48,
                  width: 48,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      color: Colors.lightGreen.shade300
                  ),
                  child: Center(
                    child: Text(
                      "$times",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
