import 'package:e_commerce/domain/entities/register_response_entity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.message,
    super.registerUserEntity,
    super.token,
    super.statusMsg,
  });

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    registerUserEntity = json['registerUserEntity'] != null
        ? new RegisterUserDto.fromJson(json['registerUserEntity'])
        : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
}

class RegisterUserDto extends RegisterUserEntity {
  String? role;

  RegisterUserDto({super.name, super.email, this.role});

  RegisterUserDto.fromJson(Map<String, dynamic> json) {
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
