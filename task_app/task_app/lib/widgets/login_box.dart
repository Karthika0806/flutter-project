// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/login_auth.dart';
import 'package:task_app/providers/users_provider.dart';
import 'package:task_app/screens/users_list_screen.dart';

class LoginBox extends StatefulWidget {
  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final GlobalKey<FormState> _key = GlobalKey();
  // TextEditingController userNameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  final Map<String, String> _authData = {'userName': '', 'password': ''};

  Future<void> _submit() async {
    if (!_key.currentState!.validate()) {
      return;
    }
    _key.currentState!.save();

    try {
      final loginResponse = await Provider.of<LoginAuth>(context, listen: false)
          .login(_authData['userName']!, _authData['password']!);

      if (loginResponse == 200) {
        await Provider.of<UsersProvider>(context, listen: false).fetchAndSet();
        Navigator.of(context).pushNamed(UsersListScreen.routername);
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Authentication Error!'),
            actions: <Widget>[
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Form(
      key: _key,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Color.fromARGB(255, 110, 129, 137),
            width: deviceSize.width * 0.33,
            height: deviceSize.height * 0.08,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                VerticalDivider(
                  color: Colors.white,
                ),
                Flexible(
                  child: TextFormField(
                    // controller: userNameController,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'User Name',
                        hintStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid UserName';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _authData['userName'] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: deviceSize.height * 0.025,
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Color.fromARGB(255, 110, 129, 137),
            width: deviceSize.width * 0.33,
            height: deviceSize.height * 0.08,
            child: Row(
              children: [
                Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                VerticalDivider(
                  color: Colors.white,
                ),
                Flexible(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    // controller: userNameController,
                    obscureText: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid UserName';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _authData['password'] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: deviceSize.height * 0.025,
          ),
          SizedBox(
            width: deviceSize.width * 0.33,
            height: deviceSize.height * 0.08,
            child: TextButton(
              style: ButtonStyle(
                //fixedSize: MaterialStateProperty.all(Size.fromHeight(10)),
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 175, 47, 65),
                ),
              ),
              child: Text(
                'LOGIN',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: _submit,
            ),
          ),
        ],
      ),
    );
  }
}
