import 'package:e_commerce/domain/entities/login_response_entity.dart';

class LoginResponseDto extends LoginResponseEntity {
  String? statusMsg;
  LoginUserDto? loginUserDto;

  LoginResponseDto({
    super.message,
    this.loginUserDto,
    super.token,
    this.statusMsg,
  });

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    loginUserDto = json['loginUserDto'] != null
        ? LoginUserDto.fromJson(json['loginUserDto'])
        : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (loginUserDto != null) {
      data['loginUserDto'] = loginUserDto!.toJson();
    }
    data['token'] = token;
    data['statusMsg'] = statusMsg;
    return data;
  }
}

class LoginUserDto extends UserEntity {
  String? role;

  LoginUserDto({super.name, super.email, this.role});

  LoginUserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
