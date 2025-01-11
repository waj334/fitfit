import 'package:flutter/material.dart';

class ClientWorkoutsScreen extends StatefulWidget {
  const ClientWorkoutsScreen({super.key});

  @override
  State createState() => _ClientWorkoutsScreenState();
}

class _ClientWorkoutsScreenState extends State<ClientWorkoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Client Workouts"),
    );
  }
}