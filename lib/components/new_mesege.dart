import 'package:flutter/material.dart';
import 'package:projeto_chat/core/services/chat/chat_service.dart';

import '../core/services/auth/auth_service.dart';

class New_meseges extends StatefulWidget {
  const New_meseges({super.key});

  @override
  State<New_meseges> createState() => _New_mesegesState();
}

class _New_mesegesState extends State<New_meseges> {
  String _enteredMessage = '';
  final _controller = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;
    if (user != null) {
      Chat_service().save(_enteredMessage, user);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border(
          top: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                if (_enteredMessage.trim().isNotEmpty) {
                  _sendMessage();
                }
              },
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enviar mensagem...',
              ),
            ),
          ),
          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
