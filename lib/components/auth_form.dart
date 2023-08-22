import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_chat/components/user_image_picker.dart';

import '../core/models/auth_form_data.dart';

class Auth_form extends StatefulWidget {
  final Future<void> Function(Auth_form_data) submitfn;

  const Auth_form({super.key, required this.submitfn});

  @override
  State<Auth_form> createState() => _Auth_formState();
}

class _Auth_formState extends State<Auth_form> {
  final Auth_form_data _formdata = Auth_form_data();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleImagePicker(File image) {
    _formdata.image = image;
  }

  void _subimit() {
    final isvalid = _formKey.currentState?.validate();
    if (isvalid == false) {
      return;
    } else {
      if (_formdata.image == null && !_formdata.islogin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Escolha uma imagem'),
            backgroundColor: Theme.of(context).copyWith().errorColor,
          ),
        );
        return;
      }

      widget.submitfn(_formdata);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size;
    final cardHeight = _formdata.isregister
        ? screenHeight.height * 1.1
        : screenHeight.height * 0.7;

    return AnimatedContainer(
      duration:
          Duration(milliseconds: 500), // Defina a duração desejada da animação
      curve: Curves.easeInOut, // Escolha uma curva de animação suave
      height: cardHeight, // Use o tamanho calculado com base na tela
     // width: screenHeight.width * 0.75,
      child: Card(
        margin: EdgeInsets.all(30),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_formdata.isregister)
                  UserImagePicker(imagePickFn: _handleImagePicker),
                if (!_formdata.islogin)
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value == null || value.trim().length < 4) {
                        return 'Username deve ter pelo menos 4 caracteres';
                      }
                      return null;
                    },
                    initialValue: _formdata.name,
                    onChanged: (value) => _formdata.name = value,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                TextFormField(
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                  initialValue: _formdata.email,
                  onChanged: (value) => _formdata.email = value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email Address'),
                ),
                TextFormField(
                  key: ValueKey('password'),
                  onChanged: (value) => _formdata.password = value,
                  validator: (value) {
                    if (value == null || value.trim().length < 7) {
                      return 'Password deve ter pelo menos 7 caracteres';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  child: Text(
                    _formdata.islogin ? 'Login' : 'Criar conta',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _subimit,
                ),
                SizedBox(height: 12),
                TextButton(
                  child: Text(_formdata.islogin
                      ? 'Criar nova conta?'
                      : 'Já tem uma conta?'),
                  onPressed: () {
                    setState(() {
                      _formdata.toggle_form();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
