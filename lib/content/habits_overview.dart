import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitz/models/habit.dart';
import 'package:habitz/state/habits_bloc.dart';
import 'package:habitz/widgets/habit_create_button.dart';

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

  @override
  void dispose(){
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    HabitsBloc bloc = BlocProvider.of<HabitsBloc>(context);

    var createButton = HabitCreateButton(
        onPressed: () {
          showDialog(
              context: context,
              useRootNavigator: true,

              builder: (BuildContext context) {
                return Dialog(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Text(
                            "Nieuwe gewoonte toevoegen",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),

                        Form(
                          key: formKey,
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: "Naam",
                              contentPadding: const EdgeInsets
                                  .symmetric(
                                  vertical: 8, horizontal: 12),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.orange
                                          .shade300)
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade100)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
    );


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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 32),
                child: Center(
                  child: Text(
                    "Gewoontes",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                )
            ),
            Expanded(
              child: BottomPart(
                child: StreamBuilder<List<Habit>>(
                  stream: bloc.habits$,
                  initialData: const [],
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Je hebt geen gewoontes"),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: createButton,
                          )
                        ],
                      );
                    }

                    List<HabitCard> habits = snapshot.data!.map<HabitCard>((habit) => HabitCard(habit.name, habit.times, habit.startedAt)).toList();
                    return ListView(
                      children: [
                        ...habits,
                        createButton
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        )
    );
  }
}

