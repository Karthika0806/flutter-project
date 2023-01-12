// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:task_app/widgets/login_box.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: deviceSize.width,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceSize.height * 0.17,
                ),
                SizedBox(
                    width: deviceSize.width * 0.18,
                    height: deviceSize.height * 0.18,
                    child: Image.asset(
                      'assets/images/login_icon.png',
                    )),
                SizedBox(
                  height: deviceSize.height * 0.08,
                ),
                Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: deviceSize.height * 0.1,
                ),
                LoginBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
