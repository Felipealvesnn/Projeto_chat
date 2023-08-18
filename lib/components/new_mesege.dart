import 'package:flutter/material.dart';

import '../core/services/auth/auth_service.dart';

class New_meseges extends StatefulWidget {
  const New_meseges({super.key});

  @override
  State<New_meseges> createState() => _New_mesegesState();
}

class _New_mesegesState extends State<New_meseges> {
  String _enteredMessage = '';

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;
    FocusScope.of(context).unfocus();
    print(_enteredMessage);
    setState(() {
      _enteredMessage = '';
    });
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
              decoration: InputDecoration(
                labelText: 'Enviar mensagem...',
              ),
            ),
          ),
          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage ,
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}