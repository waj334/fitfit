import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/exercise.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State createState() => _CreateExercisesScreenState();
}

class _CreateExercisesScreenState extends State<ExercisesScreen> {
    late List<Exercise> exercises;

    @override void initState() {
    super.initState();

    exercises = <Exercise>[
      Exercise(id: 0, metadata: {"name": "Movement A"}),
      Exercise(id: 1, metadata: {"name": "Movement B"}),
      Exercise(id: 2, metadata: {"name": "Movement C"}),
      Exercise(id: 3, metadata: {"name": "Movement D"}),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: List<Widget>.generate(exercises.length, (index) => excerciseCard(exercises[index])),
      ),
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.plus),
          onPressed: () {
            // TODO
          }),
    );
  }

  Widget excerciseCard(final Exercise exercise) {
    return Card(
        child: TextButton(
      onPressed: () => {},
      child: ListTile(
        title: Text(exercise.name),
      ),
    ));
  }
}
