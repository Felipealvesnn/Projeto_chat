import 'package:flutter/material.dart';

import '../components/auth_form.dart';

class Auth_page extends StatelessWidget {
  const Auth_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Auth_form(),
        ),
      )
    );
  }
}