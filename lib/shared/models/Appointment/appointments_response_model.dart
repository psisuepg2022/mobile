import 'dart:convert';

import 'package:mobile/shared/models/Appointment/appointment_model.dart';

class AppointmentsResponseModel {
  final String message;
  final bool success;
  final List<AppointmentModel> content;

  AppointmentsResponseModel(
      {required this.message, required this.success, required this.content});

  factory AppointmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      AppointmentsResponseModel(
          content: List<AppointmentModel>.from(jsonDecode(json['content'])
              .map((model) => AppointmentModel.fromJson(model))),
          message: json['message'],
          success: json['success']);
}
