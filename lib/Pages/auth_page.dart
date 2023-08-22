import 'package:flutter/material.dart';

import '../components/auth_form.dart';
import '../core/models/auth_form_data.dart';
import '../core/services/auth/auth_service.dart';

class Auth_page extends StatefulWidget {
  const Auth_page({super.key});

  @override
  State<Auth_page> createState() => _Auth_pageState();
}

class _Auth_pageState extends State<Auth_page> {
  bool _isLoading = false;

  Future<void> _handleSubmit(Auth_form_data data) async {
    try {
      setState(() => _isLoading = true);

      if (data.islogin) {
        //login

        await AuthService().login(
          data.email,
          data.password,
        );
      } else {
        //signup

        await AuthService().signup(
          data.email,
          data.password,
          data.name,
          data.image,
        );
      }
    } catch (error) {
      print(error);
    } finally { 
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Auth_form(submitfn: _handleSubmit),
              ),
            ),
            if (_isLoading)
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ));
  }
}
