import 'package:flutter/material.dart';

import 'Pages/Loading_page.dart';
import 'Pages/auth_or_app_page.dart';
import 'Pages/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: const Auth_or_app_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
