// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserTokensModel {
  final String accessToken;
  final String refreshToken;

  UserTokensModel(this.accessToken, this.refreshToken);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserTokensModel.fromMap(Map<String, dynamic> map) {
    return UserTokensModel(
      map['accessToken'] as String,
      map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTokensModel.fromJson(String source) =>
      UserTokensModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
