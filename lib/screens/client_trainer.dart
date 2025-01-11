import 'package:fitfit/screens/clients.dart';
import 'package:flutter/material.dart';

class TrainerClientScreen extends StatefulWidget {
  final ClientData data;
  const TrainerClientScreen(this.data, {super.key});

  @override
  State createState() => _TrainerClientScreenState();
}

class _TrainerClientScreenState extends State<TrainerClientScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Trainer Client Screen"),
    );
  }
}
