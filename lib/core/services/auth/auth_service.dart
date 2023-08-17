import 'dart:io';

import 'package:projeto_chat/core/models/Chat_user.dart';

abstract class AuthService {
  Chat_user? get currentUser;
  Stream<Chat_user?> get userChanges;
  Future<void> signup(
    String email,
    String password,
    String username,
    File image,
  );
  Future<void> login(String email, String password);
  Future<void> logout();
}
