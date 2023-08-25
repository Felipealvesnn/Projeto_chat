import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/Chat_user.dart';
import 'auth_service.dart';

class AuthMockServicesFirebase implements AuthService {
  static Chat_user? _currentUser;

  static final _userStream = Stream<Chat_user?>.multi((controller) async {
    final authechanges = FirebaseAuth.instance.authStateChanges();
    if (authechanges == null) {
      controller.add(null);
      return;
    } else {
      await for (final user in authechanges) {
        _currentUser = user == null ? null : _tochatUser(user);
        controller.add(_currentUser);
      }
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
    } else {
      final User? user = userCredential.user;
      _currentUser = _tochatUser(user!);
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
    //uploud da foto do usuario
    final nomeIMagem = '${creado.user!.uid}.jpg}';
    final imageUrl = _uploadUserImage(image!, nomeIMagem);
    await creado.user?.updateDisplayName(username);
    await creado.user?.updatePhotoURL(imageUrl.toString());

    //salvar usuario no firebase
    _SaveChatUser(_tochatUser(creado.user!));
  }

  Future<void> _SaveChatUser(Chat_user user) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    await userCollection.doc(user.id).set(user.toMap());
  }

  Future<String?> _uploadUserImage(File image, String ImageName) async {
    if (image == null) {
      return null;
    }
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child("User_images").child(ImageName);
    final uploadTask = await ref.putFile(image).whenComplete(() => null);
    return await uploadTask.ref.getDownloadURL();
  }

  static Chat_user _tochatUser(User user,[String? imageUrl]) {
    return Chat_user(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      ImageUrl: imageUrl ?? user.photoURL ?? '',
    );
  }
}
