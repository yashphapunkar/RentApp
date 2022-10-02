import 'package:flutter/material.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:eventlistners/constants.dart';

class ChatScreen extends StatefulWidget {

   @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 08, vertical: 30),
      child: ListView(
        children: [
          Text(
            '  Chats',
            style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w800,
          ),
          ),
          gapMore,
          ChatBlock('Sarthak Sangamnerkar', 'Hey i would like to get in touch with you'),
          ChatBlock('Harshita Dharmadhikari', 'hi i would like to rent guitar from you please share more details'),
        ],
        
        
      ),
    );
  }
}
