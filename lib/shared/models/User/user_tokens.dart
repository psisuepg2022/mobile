// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserTokensModel {
  final String accessToken;
  final String refreshToken;

  UserTokensModel({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserTokensModel.fromMap(Map<String, dynamic> map) => UserTokensModel(
        accessToken: map['accessToken'] as String,
        refreshToken: map['refreshToken'] as String,
      );

  String toJson() => json.encode(toMap());

  factory UserTokensModel.fromJson(Map<String, dynamic> json) =>
      UserTokensModel(
          accessToken: json['accessToken'], refreshToken: json['refreshToken']);

  @override
  String toString() =>
      'UserTokensModel(accessToken: $accessToken, refreshToken: $refreshToken)';
}
