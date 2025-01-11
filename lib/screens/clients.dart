import 'package:fitfit/dialogs/new_client.dart';
import 'package:fitfit/screens/client_trainer.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class ClientData {
  final String id;
  final String imgUrl;
  final String firstName;
  final String lastName;
  final String status;
  const ClientData(
      this.id, this.imgUrl, this.firstName, this.lastName, this.status);
}

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientsScreen> {
  List<ClientData> _clients = [
    const ClientData("", "", "Test", "User 1", "Invited"),
    const ClientData("", "", "Test", "User 2", "Invited"),
    const ClientData("", "", "Test", "User 3", "Invited"),
    const ClientData(
        "", "", "This user has", "a really really long name", "Invited"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:
            _clients.map<Widget>((e) => createListTile(context, e)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onAddClient(context),
        tooltip: "Invite a new client.",
        child: const Icon(Icons.add),
      ),
    );
  }

  void onAddClient(BuildContext context) {
    showDialog<NewClientInvitation>(
      context: context,
      builder: (BuildContext context) => const NewClientDialog(),
      barrierDismissible: false,
    ).then((NewClientInvitation? data) {
      if (data != null) {
        // TODO: Make client invitation API call that will send the invitation
        // request via email and text.

        // TODO: The invitation API call should be followed up with a request to
        // retrieve the updated client list.

        // Update the client list.
        setState(() {
          _clients.add(
              ClientData("", "", data.firstName, data.lastName, "Invited"));
        });
      }
    });
  }

  Widget createListTile(BuildContext context, final ClientData data) {
    return Card(
      child: MaterialButton(
        onPressed: () => onClientSelected(context, data),
        child: ListTile(
          leading: CircleAvatar(
              child: data.imgUrl.isEmpty
                  ? const Icon(Icons.account_box)
                  : Image.network(data.imgUrl)),
          title: Text('${data.firstName.titleCase} ${data.lastName.titleCase}'),
          subtitle: Text(data.status.titleCase),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  label: const Text("Message")),
              TextButton.icon(
                onPressed: () {},
                label: const Text("Drop Client"),
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClientSelected(BuildContext context, final ClientData data) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TrainerClientScreen(data)),
    );
  }
}
