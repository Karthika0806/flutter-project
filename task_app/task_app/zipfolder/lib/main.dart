// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/login_auth.dart';
import './providers/users_provider.dart';
import 'package:task_app/screens/login_screen.dart';
import 'package:task_app/screens/user_details_screen.dart';
import 'package:task_app/screens/users_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => LoginAuth())),
        ChangeNotifierProvider(create: ((context) => UsersProvider())),
      ],
      child: Consumer(
          builder: ((context, value, child) => MaterialApp(
                initialRoute: '/',
                routes: {
                  '/': (context) => LoginScreen(),
                  UsersListScreen.routername: (context) => UsersListScreen(),
                  UserDetailScreen.routename: (context) => UserDetailScreen()
                },
              ))),
    );
  }
}
