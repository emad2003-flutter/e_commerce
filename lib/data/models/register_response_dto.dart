import 'package:e_commerce/domain/entities/register_response_entity.dart';

class RegisterResponseDto extends RegisterResponseEntity {

  RegisterResponseDto({super.message, super.user, super.token, super.statusMsg});

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  
}

class UserDto extends UserEntity {
  String? role;

  UserDto({super.name, super.email, this.role});

  UserDto.fromJson(Map<String, dynamic> json) {
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