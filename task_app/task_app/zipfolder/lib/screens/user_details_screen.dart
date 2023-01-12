// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/user_modal.dart';

import 'package:task_app/providers/users_provider.dart';
//import '../models/user_full_details.dart';

class UserDetailScreen extends StatefulWidget {
  static const routename = '/userdetailscreen';

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size * 0.5;
    User userdata =
        Provider.of<UsersProvider>(context, listen: false).getSelectedData;
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(40),
          width: deviceSize.width * 0.3,
          height: deviceSize.height * 0.6,
          decoration: BoxDecoration(
            border: Border.all(),
            image: DecorationImage(
              image: AssetImage('assets/images/profile_image.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        VerticalDivider(),
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'First Name',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.firstName ?? 'Null',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'DisplayName',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.displayName ?? 'Null',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Department',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.department ?? 'Null',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'CreatedOn',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.createdOn ?? 'Null',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Is Active',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.isActive.toString(),
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'User Name',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.userName ?? 'Null',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Last Name',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.lastName ?? 'Null',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'User Email',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.userEmail ?? 'Null',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Location',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  userdata.location ?? 'Null',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Updated On',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 101, 101), fontSize: 12),
                ),
              ),
              Text(
                userdata.updatedOn ?? 'Null',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              Spacer(),
              Container(
                height: deviceSize.height * 0.13,
                width: deviceSize.width * 0.27,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(7)),
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Close',
                      style: TextStyle(fontSize: 30, color: Colors.grey),
                    )),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
