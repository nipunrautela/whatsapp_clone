import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          callCard(),
        ],
      ),
    );
  }

  Widget callCard() {
    return ListTile(
        leading: CircleAvatar(
          radius: 30,
        ),
        title: const Text("Mr.X"),

        // ignore: prefer_const_literals_to_create_immutables
        subtitle: Row(children: [
          Icon(Icons.call_end, color: Colors.red),
          SizedBox(width: 3),
          Text("Yesterday, 11:36pm")
        ]),
        trailing: Icon(Icons.call));
  }
}
