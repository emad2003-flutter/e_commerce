class RegisterResponseEntity {
  String? message;
  RegisterUserEntity? registerUserEntity;
  String? token;
  String? statusMsg;
  RegisterResponseEntity({
    this.message,
    this.registerUserEntity,
    this.token,
    this.statusMsg,
  });
}

class RegisterUserEntity {
  String? name;
  String? email;
  RegisterUserEntity({this.name, this.email});
}
