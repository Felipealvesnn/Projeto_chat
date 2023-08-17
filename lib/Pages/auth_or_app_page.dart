import 'package:flutter/material.dart';
import 'package:projeto_chat/core/models/Chat_user.dart';
import '../core/services/auth/auth_service.dart';
import 'Chat_page.dart';
import 'Loading_page.dart';
import 'auth_page.dart';

class Auth_or_app_page extends StatelessWidget {
  const Auth_or_app_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<Chat_user?>(
        stream: AuthService().userChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Loading_page(),
            );
          } else if (snapshot.hasData) {
            return const Center(
              child: Chat_page(),
            );
          } else {
            return const Center(
              child: Auth_page(),
            );
          }
        },
      )
    );
  }
}