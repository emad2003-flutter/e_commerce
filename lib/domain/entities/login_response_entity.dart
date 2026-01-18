class LoginResponseEntity {
  String? message;
  UserEntity? user;
  LoginResponseEntity({this.message, this.user});
}

class UserEntity {
  String? name;
  String? email;
  UserEntity({this.name, this.email});
}
