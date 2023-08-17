import 'dart:async';

import 'package:projeto_chat/core/models/ChatMessages.dart';

import 'package:projeto_chat/core/models/Chat_user.dart';

import 'chat_service.dart';

class Chat_mock_service implements Chat_service {
  static final List<ChatMessages> _msgs = [
    ChatMessages(
      id: '0',
      userName: 'bia',
      text: 'Teste',
      createdAt: DateTime.now(),
      userId: '6',
    ),
     ChatMessages(
      id: '1',
      userName: 'ano',
      text: 'Teste',
      createdAt: DateTime.now(),
      userId: '0',
    ),

  ];
  static MultiStreamController<List<ChatMessages>>? _msgsStreamController;
  static final _msgsStream = Stream<List<ChatMessages>>.multi((controller) {
    _msgsStreamController = controller;
    _msgsStreamController?.add(_msgs);
  });

  @override
  // TODO: implement messages
  Stream<List<ChatMessages>> get messages {
    return _msgsStream;
  }

  @override
  Future<ChatMessages> save(String text, Chat_user user) {
    
    final msg = ChatMessages(
      id: DateTime.now().toString(),
      userName: user.name,
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
    );
    _msgs.add(msg);
    _msgsStreamController?.add(_msgs);
    return Future.value(msg);
  }
}
