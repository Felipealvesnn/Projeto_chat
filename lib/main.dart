import 'package:flutter/material.dart';

import 'Pages/Loading_page.dart';

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
          colorScheme: ColorScheme.fromSwatch().copyWith(
             primary: Colors.deepPurple,
             background: Colors.white,
             secondary: Colors.white,
             ),
          useMaterial3: true,
       ),
      home: const Loading_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
