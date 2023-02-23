// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:mobile/shared/models/Clinic/clinic_list.dart';

class ClinicResponseModel {
  final String message;
  final bool success;
  final ClinicListModel content;

  ClinicResponseModel({
    required this.message,
    required this.success,
    required this.content,
  });

  factory ClinicResponseModel.fromJson(Map<String, dynamic> json) =>
      ClinicResponseModel(
          content: ClinicListModel.fromJson(json['content']),
          message: json['message'],
          success: json['success']);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'success': success,
      'content': content.toMap(),
    };
  }

  factory ClinicResponseModel.fromMap(Map<String, dynamic> map) {
    return ClinicResponseModel(
      message: map['message'] as String,
      success: map['success'] as bool,
      content: ClinicListModel.fromMap(map['content'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());
}
