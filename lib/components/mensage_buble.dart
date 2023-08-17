import 'package:flutter/material.dart';
import 'package:projeto_chat/core/models/ChatMessages.dart';

class Mensage_buble extends StatelessWidget {
  final ChatMessages message;
  final bool isMe;

  const Mensage_buble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isMe ? Colors.grey[300] : Colors.red[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
          bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
        ),
      ),
      child: Text(message.text));
  }
}