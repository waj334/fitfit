import 'package:flutter/material.dart';

class ClientChatScreen extends StatefulWidget {
  const ClientChatScreen({super.key});

  @override
  State createState() => _ClientChatState();
}

class _ClientChatState extends State<ClientChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Client Chat"),
    );
  }
}