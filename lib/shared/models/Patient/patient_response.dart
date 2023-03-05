// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile/shared/models/Patient/patient_list.dart';

class PatientResponseModel {
  final String message;
  final bool success;
  final PatientListModel content;

  PatientResponseModel({
    required this.message,
    required this.success,
    required this.content,
  });

  factory PatientResponseModel.fromJson(Map<String, dynamic> json) =>
      PatientResponseModel(
          content: PatientListModel.fromJson(json['content']),
          message: json['message'],
          success: json['success']);

  @override
  String toString() =>
      '{ message: $message, success: $success, content: $content }';
}
