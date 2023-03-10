import 'package:mobile/shared/models/Professional/professional_model.dart';

class ProfessionalResponseModel {
  final String message;
  final bool success;
  final ProfessionalModel content;

  ProfessionalResponseModel({
    required this.message,
    required this.success,
    required this.content,
  });

  factory ProfessionalResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalResponseModel(
          content: ProfessionalModel.fromJson(json['content']),
          message: json['message'],
          success: json['success']);

  @override
  String toString() =>
      '{ message: $message, success: $success, content: $content }';
}
