import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/Loading_page.dart';
import 'Pages/auth_or_app_page.dart';
import 'Pages/auth_page.dart';
import 'core/services/notification/Push_notification_serice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatNofication_service(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => ChatService(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => AuthService(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple,
          ),
        ),
        home: const Auth_or_app_page(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
