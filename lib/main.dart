import 'package:flutter/material.dart';
import 'content/habits_overview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.orange.shade300,
            textTheme: ButtonTextTheme.accent,
          ),
          scaffoldBackgroundColor: Colors.orange.shade100,
          primaryColor: Colors.orange.shade300,
          fontFamily: "VarelaRound",
          textTheme: TextTheme(
              bodyMedium: TextStyle(
                  color: Colors.brown.shade700
              ),
              headlineMedium: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade700
              ),
              headlineSmall: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.brown.shade700
              )
          )
      ),
      home: const HabitsOverviewPage()
    );
  }
}
