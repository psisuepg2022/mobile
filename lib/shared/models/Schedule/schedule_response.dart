// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile/shared/models/Schedule/all_schedule_events.dart';

class ScheduleResponseModel {
  final String message;
  final bool success;
  final AllScheduleEvents content;

  ScheduleResponseModel(
      {required this.message, required this.success, required this.content});

  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) =>
      ScheduleResponseModel(
          content: AllScheduleEvents.fromJson(json['content']),
          message: json['message'],
          success: json['success']);

  @override
  String toString() =>
      '{ message: $message, success: $success, content: $content }';
}
