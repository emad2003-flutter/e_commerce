class LoginResponseEntity {
  String? message;
  UserEntity? user;
  String? token;
  LoginResponseEntity({this.message, this.user, this.token});
}

class UserEntity {
  String? name;
  String? email;
  UserEntity({this.name, this.email});
}
