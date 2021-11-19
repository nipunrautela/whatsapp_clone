import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    Container chat = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(1.0),
      child: Row(
        children: [
          const Divider(
            indent: 4.0,
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              'https://cdn.discordapp.com/attachments/775387982554333204/911101173082247168/download.png',
              scale: 1.0,
            ),
          ),
          const Divider(
            indent: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Divider(
                height: 15.0,
              ),
              Text(
                "Somebody",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Bot: This is a Message. It's just a dum...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const Text(
            "9:10 am",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );

    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(2.0),
      children: [
        chat,
        chat,
        chat,
        chat,
        chat,
        chat,
        chat,
        chat,
        chat,
        chat,
        chat,
        chat,
      ],
    );
  }
}
