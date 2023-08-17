import 'package:flutter/material.dart';
import 'package:projeto_chat/core/services/chat/chat_service.dart';

class Mensages extends StatelessWidget {
  const Mensages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Chat_service().messages,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: null,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data![index].userName),
              subtitle: Text(snapshot.data![index].text),
            );
          },
        );
      },
    );
  }
}