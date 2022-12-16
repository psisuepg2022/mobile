// ignore_for_file: public_member_api_docs, sort_constructors_first

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
}
