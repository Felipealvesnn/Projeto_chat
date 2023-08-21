import 'package:flutter/material.dart';
import 'package:projeto_chat/components/new_mesege.dart';
import 'package:projeto_chat/core/models/chat_notificaiton.dart';
import 'package:projeto_chat/core/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

import '../components/mensages.dart';
import '../core/services/notification/Push_notification_serice.dart';
import 'Notification_page.dart';

class Chat_page extends StatelessWidget {
  const Chat_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Notification_page(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.notifications)),
              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    '${Provider.of<ChatNofication_service>(context).total}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
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
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ChatNofication_service>(context, listen: false).add(Chat_notification(
      //       body: 'teste',
      //       title: 'teste',
      //     ));
      //   },
      //   child: const Icon(Icons.notifications),
      // ),
    );
  }
}
