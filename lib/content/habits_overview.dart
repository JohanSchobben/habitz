import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habitz/model/habit.dart';
import '../widgets/bottom_part.dart';

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
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: FaIcon(FontAwesomeIcons.plus),
                              ),
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