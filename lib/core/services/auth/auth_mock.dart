import 'dart:async';
import 'dart:io';
import 'dart:math';

import '../../models/Chat_user.dart';
import 'auth_service.dart';

class AuthMockServices implements AuthService {
  static final defaultUser = Chat_user(
    id: '0',
    name: 'Teste',
    email: 'teste@teste',
    password: '1234567',
  );

  static Map<String, Chat_user> _user = {
    defaultUser.email: defaultUser,
  };
  static Chat_user? _currentUser;
  static MultiStreamController<Chat_user?>? _userStreamController;

  static final _userStream = Stream<Chat_user?>.multi((p0) {
    _userStreamController = p0;
    _updateUser(defaultUser);
    return;
  });

  @override
  Chat_user? get currentUser => _currentUser;

  @override
  Stream<Chat_user?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> login(String email, String password) async {
    if (!_user.containsKey(email)) {
      throw Exception('Usuario não encontrado');
    }
    if (_user[email]!.password != password) {
      throw Exception('Senha incorreta');
    }
    _updateUser(_user[email]);
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    _updateUser(null);
  }

  @override
  Future<void> signup(
      String email, String password, String username, File? image) async {
    final newUser = Chat_user(
        id: Random().nextDouble().toString(),
        email: email,
        password: password,
        name: username,
        ImageUrl: image?.path ?? 'assets/images/avatar.png');
    _user.putIfAbsent(email, () => newUser);

    _updateUser(newUser);
  }

  static void _updateUser(Chat_user? User) {
    _currentUser = User;
    _userStreamController?.add(_currentUser);
  }
}
