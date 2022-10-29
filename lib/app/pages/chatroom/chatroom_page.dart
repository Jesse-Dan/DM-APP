import 'package:divine_mercy_app_the_right_way/app/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key, required String title});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.all(kdefaultPadding),
          child: Container(
            color: Colors.amber,
            child: const Padding(
              padding:
                  EdgeInsets.all(kdefaultPadding),
              child: Text('chatrooms'),
            ),
          ),
        ),
        const Card(
          color: Colors.amber,
        )
      ],
    );
  }
}
