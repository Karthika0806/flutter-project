import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_modal.dart';

class UsersProvider with ChangeNotifier {
  List<User> userProfileData = [];
  User _selectedUserData = User();

  void setSelectedData(selectedUser) {
    _selectedUserData = selectedUser;
  }

  get getSelectedData {
    return _selectedUserData;
  }

  Future<void> fetchAndSet() async {
    final url =
        Uri.parse('https://easytouchcloudapibeta.kern-sohn.com/api/v1/users');
    try {
      final response = await http.get(url);
      final extractedUserData = json.decode(response.body) as List<dynamic>;
      if (extractedUserData.isEmpty) {
        return;
      }

      userProfileData = extractedUserData.map((e) => User.fromJson(e)).toList();
    } catch (error) {
      rethrow;
    }
    // notifyListeners();
  }
}


// extractedUserData.forEach((id, userdata) {
//         loadedUsers.add(User(
//           id: userdata['id'],
//           userName: userdata['userName'],
//           firstName: userdata['firstName'],
//           lastName: userdata['lastName'],
//           userEmail: userdata['userEmail'],
//           userImage: userdata['userImage'],
//           displayName: userdata['displayName'],
//           location: userdata['location'],
//           department: userdata['department'],
//           createdOn: userdata['createdOn'],
//           updatedOn: userdata['updatedOn'],
//         ));
//       });