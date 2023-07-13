import 'package:flutter/material.dart';
import 'package:template/chat.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {

  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatScreen(),
    );
  }
}


