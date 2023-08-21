import 'package:flutter/material.dart';
import 'package:projeto_chat/core/models/chat_notificaiton.dart';

class ChatNofication_service with ChangeNotifier{

  List<Chat_notification> _itens = [];

  List<Chat_notification> get itens => [..._itens];

  void add(Chat_notification item) {
    _itens.add(item);
    notifyListeners();
  }

  void remove(int item) {
    _itens.removeAt(item);
    notifyListeners();
  }
  
}