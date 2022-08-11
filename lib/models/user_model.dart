class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? state;
  String? churchName;
  bool? subscribed;

  UserModel(
      {this.uid,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.state,
      this.churchName,
      this.subscribed});

  UserModel.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        firstName = data["firstName"];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'state': state,
      'churchName': churchName,
      'subscribed': subscribed,
    };
  }
}
