// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserRequestModel {
  final String? accessCode;
  final String? userName;
  final String? password;

  UserRequestModel({this.accessCode, this.userName, this.password});

  UserRequestModel copyWith({
    String? accessCode,
    String? userName,
    String? password,
  }) {
    return UserRequestModel(
      accessCode: accessCode ?? this.accessCode,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessCode': accessCode,
      'userName': userName,
      'password': password,
    };
  }

  factory UserRequestModel.fromMap(Map<String, dynamic> map) {
    return UserRequestModel(
      accessCode:
          map['accessCode'] != null ? map['accessCode'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  @override
  String toString() =>
      'UserRequestModel(accessCode: $accessCode, userName: $userName, password: $password)';

  factory UserRequestModel.fromJson(String source) =>
      UserRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
