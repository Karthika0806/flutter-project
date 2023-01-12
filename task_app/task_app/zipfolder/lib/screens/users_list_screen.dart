// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/users_provider.dart';
import 'user_details_screen.dart';

class UsersListScreen extends StatelessWidget {
  static const routername = '/userlist';
  final GlobalKey<ScaffoldState> _keyEndDrawer = GlobalKey();
  int? crossCount;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final users = Provider.of<UsersProvider>(
      context,
    ).userProfileData;
    if (deviceSize.width < 900) {
      crossCount = 2;
    } else if (deviceSize.width < 1300) {
      crossCount = 3;
    } else {
      crossCount = 4;
    }
    return Scaffold(
      key: _keyEndDrawer,
      endDrawer: SizedBox(
          width: deviceSize.width * 0.6,
          child: Drawer(child: UserDetailScreen())),
      //   endDrawerEnableOpenDragGesture: false,
      // body: Text('data'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          // padding: EdgeInsets.all(10),
          itemCount: users.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossCount!,
            childAspectRatio: 3.6 / 1.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, i) => GestureDetector(
              onTap: (() {
                var selectedUserData = users[i];
                Provider.of<UsersProvider>(context, listen: false)
                    .setSelectedData(selectedUserData);
                _keyEndDrawer.currentState!.openEndDrawer();
              }),
              child: Flexible(
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: deviceSize.width * 0.02,
                      ),
                      //  ( users[i].userImage == null || users[i].userImage!.isEmpty)
                      //       ?
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(120)),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/profile_image.png'),
                        ),
                      ),
                      // : CircleAvatar(
                      //     radius: 40,
                      //     backgroundImage: NetworkImage(users[i].userImage!),
                      //   ),
                      SizedBox(
                        width: deviceSize.width * 0.02,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Name',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: Color.fromARGB(255, 102, 101, 101),
                                fontSize: 12),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 13),
                            child: Text(
                              users[i].userName!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.02,
                          ),
                          Text(
                            'First Name',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromARGB(255, 102, 101, 101),
                                fontSize: 12),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(users[i].firstName!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
