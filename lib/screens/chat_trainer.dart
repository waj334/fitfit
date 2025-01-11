import 'package:flutter/material.dart';

class TrainerChatScreen extends StatefulWidget {
  const TrainerChatScreen({super.key});

  @override
  State createState() => _TrainerChatState();
}

class _TrainerChatState extends State<TrainerChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Trainer Chat"),
    );
  }
}