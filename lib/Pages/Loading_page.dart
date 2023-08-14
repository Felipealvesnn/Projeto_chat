import 'package:flutter/material.dart';

class Loading_page extends StatelessWidget {
  const Loading_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Loading',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ],
      )),
    );
  }
}
