import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/services/notification/Push_notification_serice.dart';

class Notification_page extends StatelessWidget {
  const Notification_page({super.key});

  @override
  Widget build(BuildContext context) {
    final notification = Provider.of<ChatNofication_service>(context);
    final messages = notification.itens;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: ListView.builder(
        itemCount: notification.total,
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            title: Text(message.title),
            subtitle: Text(message.body),
            onTap: () => notification.remove(message),
          );
        },
      ),
    );
  }
}
