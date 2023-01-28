import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habitz/models/habit.dart';
import 'package:habitz/state/habits.bloc.dart';

import '../state/bloc_provider.dart';
import '../widgets/bottom_part.dart';
import '../widgets/habit_card.dart';

class HabitsOverviewPage extends StatefulWidget {

  const HabitsOverviewPage({super.key});
  @override
  State<HabitsOverviewPage> createState() => _HabitsOverviewPageState();
}

class _HabitsOverviewPageState extends State<HabitsOverviewPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  List<Habit> habits = [];

  void addHabit() {
    String name = nameController.text;
    print(name);
    setState(() {
      habits = [...habits, Habit(name, 0, DateTime.now())];
    });
    nameController.text = "";
  }

  @override
  void dispose(){
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    HabitsBloc bloc = BlocProvider.of<HabitsBloc>(context);

    List<Widget> cards = habits.map((Habit habit) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: HabitCard(habit.name, habit.times, habit.startedAt),
      );
    }).toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
              systemNavigationBarColor: Colors.orange.shade100,
              statusBarColor: Colors.orange.shade100
          ),
          // foregroundColor: Colors.brown.shade700,
        ),

        backgroundColor: Colors.orange.shade100,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 32),
                child: Center(
                  child: Text(
                    "Gewoontes",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
            ),
            Expanded(
              child: BottomPart(
                child: ListView(
                  children: [
                    ...cards,
                    Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: TextButton(
                          style: const ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(Colors.brown),
                              overlayColor: MaterialStatePropertyAll(Colors.white)
                          ),
                          onPressed: () {
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(
                                title: const Text("Nieuwe gewoonte"),
                                content: Form(
                                  key: formKey,
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      labelText: "Naam",
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.orange.shade300)
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.shade100)
                                      ),
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: (){
                                        addHabit();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("aanmaken")
                                  )
                                ],
                              );
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: FaIcon(FontAwesomeIcons.plus),
                              ),
                              StreamBuilder<String>(
                                stream: bloc.foo,
                                initialData: "nothing",
                                builder: (context, snapshot) {
                                  return Text(snapshot.data!);
                                },
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}