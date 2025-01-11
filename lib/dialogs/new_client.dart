import 'package:fitfit/constants.dart';
import 'package:flutter/material.dart';

class NewClientInvitation {
  String firstName = "";
  String lastName = "";
  String phoneNo = "";
  String email = "";
}

class NewClientDialog extends StatefulWidget {
  const NewClientDialog({super.key});

  @override
  State<StatefulWidget> createState() => _NewClientFormState();
}

class _NewClientFormState extends State<NewClientDialog> {
  final _formKey = GlobalKey<FormState>();
  final NewClientInvitation _data = NewClientInvitation();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final fieldSpacing =
        themeData.dialogTheme.actionsPadding?.vertical ?? kContentSpacing;

    return AlertDialog(
      title: const Text("Invite New Client"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "First Name",
                  ),
                  onChanged: (String input) => setState(() {
                    _data.firstName = input;
                  }),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                  ),
                  onChanged: (String input) => setState(() {
                    _data.lastName = input;
                  }),
                ),
              ]
                  .expand((x) =>
                      [Container(width: fieldSpacing), Expanded(child: x)])
                  .skip(1)
                  .toList(),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              onChanged: (String input) => setState(() {
                _data.email = input;
              }),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Phone Number",
              ),
              onChanged: (String input) => setState(() {
                _data.phoneNo = input;
              }),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => onSubmit(context),
          child: const Text("Send Invite"),
        )
      ],
    );
  }

  void onSubmit(BuildContext context) {
    // TODO: Gather form field values and return them to the last screen.
    Navigator.of(context).pop(_data);
  }
}
