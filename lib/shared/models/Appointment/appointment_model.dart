// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile/shared/models/Appointment/appointment_status_model.dart';

class AppointmentModel {
  final String id;
  final String appointmentDate;
  final String updatedAt;
  final String createdAt;
  final String? comments;
  final AppointmentStatusModel status;

  AppointmentModel(
      {required this.id,
      required this.appointmentDate,
      required this.updatedAt,
      required this.createdAt,
      this.comments,
      required this.status});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
          id: json['id'],
          appointmentDate: json['appointmentDate'],
          createdAt: json['createdAt'],
          updatedAt: json['updatedAt'],
          status: json['status'],
          comments: json['comments']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'appointmentDate': appointmentDate,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'status': status,
        'comments': comments
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'appointmentDate': appointmentDate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'status': status,
      'comments': comments,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] as String,
      appointmentDate: map['appointmentDate'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      status: map['status'] as AppointmentStatusModel,
      comments: map['comments'] as String,
    );
  }

  @override
  String toString() {
    return '{ id: $id, appointmentDate: $appointmentDate, updatedAt: $updatedAt, createdAt: $createdAt, comments: $comments, status: $status }';
  }
}
