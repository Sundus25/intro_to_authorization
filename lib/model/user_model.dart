class UserModel {
  String username;
  String password;
  UserModel({
    required this.username,
    required this.password,
  });

  toMap() {
    return {
      "username": username,
      "password": password,
    };
  }
}