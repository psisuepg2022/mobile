// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:mobile/shared/models/User/user_tokens.dart';

class LoginResponseModel {
  final String message;
  final bool success;
  final UserTokensModel content;

  LoginResponseModel({
    required this.message,
    required this.success,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'success': success,
      'content': content.toMap(),
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      message: map['message'] as String,
      success: map['success'] as bool,
      content: UserTokensModel.fromMap(map['content'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
          content: UserTokensModel.fromJson(json['content']),
          message: json['message'],
          success: json['success']);

  @override
  String toString() =>
      'LoginResponseModel(message: $message, success: $success, content: $content)';
}
