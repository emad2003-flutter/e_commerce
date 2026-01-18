import 'package:e_commerce/domain/entities/login_response_entity.dart';

class LoginResponseDto extends LoginResponseEntity {
  String? token;
  String? statusMsg;
  LoginUserDto? loginUserDto;

  LoginResponseDto({
    super.message,
    this.loginUserDto,
    this.token,
    this.statusMsg,
  });

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    loginUserDto = json['loginUserDto'] != null
        ? new LoginUserDto.fromJson(json['loginUserDto'])
        : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.loginUserDto != null) {
      data['loginUserDto'] = this.loginUserDto!.toJson();
    }
    data['token'] = this.token;
    data['statusMsg'] = this.statusMsg;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
