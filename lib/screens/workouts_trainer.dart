import 'package:flutter/material.dart';

class TrainerWorkoutsScreen extends StatefulWidget {
  const TrainerWorkoutsScreen({super.key});

  @override
  State createState() => _TrainerWorkoutsScreenState();
}

class _TrainerWorkoutsScreenState extends State<TrainerWorkoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Trainer Workouts"),
    );
  }
}
