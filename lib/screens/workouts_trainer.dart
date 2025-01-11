import 'package:fitfit/screens/trainer_exercises_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrainerWorkoutsScreen extends StatefulWidget {
  const TrainerWorkoutsScreen({super.key});

  @override
  State createState() => _TrainerWorkoutsScreenState();
}

class _TrainerWorkoutsScreenState extends State<TrainerWorkoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(tabs: [
            Tab(
              text: "Exercises",
              icon: FaIcon(FontAwesomeIcons.personRunning)),
            Tab(
                text: "Workouts",
                icon: FaIcon(FontAwesomeIcons.list)),
            Tab(
                text: "Programs",
                icon: FaIcon(FontAwesomeIcons.calendar)),
          ]),
        ),
        body: const TabBarView(
          children: [
            ExercisesScreen(),
            Text("Workouts Screen"),
            Text("Programs Screen"),
          ],
        ),
      ),
    );
  }
}
