import 'dart:io';

import '../../models/ChatMessages.dart';
import '../../models/Chat_user.dart';
import 'chat_mock_service.dart';


abstract class Chat_service {
  Stream<List<ChatMessages>> get messages;
  Future<ChatMessages> save(String text,  Chat_user user);

  factory Chat_service() {
    return Chat_mock_service();
  }

}