import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_chat/core/models/ChatMessages.dart';
import 'package:projeto_chat/core/services/chat/chat_service.dart';

class Mensages extends StatelessWidget {
  const Mensages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessages>>(
      stream: Chat_service().messages,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final messages = snapshot.data!;
        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(message.userName),
              ),
              title: Text(message.userName),
              subtitle: Text(message.text),
            );
          },
        );

      },
    );
  }
}