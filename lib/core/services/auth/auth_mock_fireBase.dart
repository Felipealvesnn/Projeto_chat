import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

import '../../models/Chat_user.dart';
import 'auth_service.dart';

class AuthMockServicesFirebase implements AuthService {
  static Chat_user? _currentUser;

  static final _userStream = Stream<Chat_user?>.multi((p0) async {
    final authechanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authechanges) {
      _currentUser = user == null ? null : _tochatUser(User as User);
      p0.add(_currentUser);
    }
  });

  @override
  Chat_user? get currentUser => _currentUser;

  @override
  Stream<Chat_user?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> login(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user == null) {
      throw Exception('Usuario não encontrado');
    }
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup(
      String email, String password, String username, File? image) async {
    final userCredential = FirebaseAuth.instance;
    final UserCredential creado = await userCredential
        .createUserWithEmailAndPassword(email: email, password: password);

    if (creado.user == null) {
      throw Exception('Usuario não encontrado');
    }
    creado.user?.updateDisplayName(username);
    // creado.user?.updatePhotoURL(image.toString());
  }

  static Chat_user _tochatUser(User user) {
    return Chat_user(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      ImageUrl: user.photoURL ?? '',
    );
  }
}
