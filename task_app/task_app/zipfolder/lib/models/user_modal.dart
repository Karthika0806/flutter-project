class User {
  int? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? userEmail;
  String? userImage;
  String? displayName;
  String? location;
  String? department;
  String? createdOn;
  String? updatedOn;
  bool? isActive;

  User(
      {this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.userEmail,
      this.userImage,
      this.displayName,
      this.location,
      this.department,
      this.createdOn,
      this.updatedOn,
      this.isActive});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        userName: json['userName'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        userEmail: json['userEmail'],
        userImage: json['userImage'],
        displayName: json['displayName'],
        location: json['location'],
        department: json['department'],
        createdOn: json['createdOn'],
        updatedOn: json['updatedOn'],
        isActive: json['isActive']);
  }
}
