import 'dart:io';

import 'package:projeto_chat/core/models/Chat_user.dart';
import 'package:projeto_chat/core/services/auth/auth_mock.dart';

abstract class AuthService {
  Chat_user? get currentUser;
  Stream<Chat_user?> get userChanges;
  Future<void> signup(
    String email,
    String password,
    String username,
    File? image,
  );
  Future<void> login(String email, String password);
  Future<void> logout();

  factory AuthService() {
    return AuthMockServices();
  }
}
