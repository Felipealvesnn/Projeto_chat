import 'package:flutter/material.dart';

class Auth_form extends StatelessWidget {
  const Auth_form({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email Address'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 12),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text('Login', style: TextStyle(color: Colors.white),),
                onPressed: () {},
              ),
               SizedBox(height: 12),
              TextButton(
                child: Text('Criar nova conta?'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}