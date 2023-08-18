import 'package:flutter/material.dart';
import 'package:projeto_chat/components/new_mesege.dart';
import 'package:projeto_chat/core/services/auth/auth_service.dart';

import '../components/mensages.dart';

class Chat_page extends StatelessWidget {
  const Chat_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          actions: [
            PopupMenuButton(
                // add icon, by default "3 dot" icon
                // icon: Icon(Icons.book)
                itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("lOUGOUT"),
                ),
              ];
            }, onSelected: (value) {
              if (value == 0) {
                AuthService().logout();
              }
            }),
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: Mensages(),
            ),
            SizedBox(
              height: 9,
            ),
            New_meseges(),
          ],
        )));
  }
}
