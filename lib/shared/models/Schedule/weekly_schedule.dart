// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile/shared/models/Schedule/weekly_schedule_lock.dart';

class WeeklySchedule {
  final String? id;
  final String? startTime;
  final String? endTime;
  final int dayOfTheWeek;
  final List<WeeklyScheduleLock>? locks;

  WeeklySchedule(
      {this.id,
      this.startTime,
      this.endTime,
      required this.dayOfTheWeek,
      this.locks});

  factory WeeklySchedule.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      return WeeklySchedule(dayOfTheWeek: json['dayOfTheWeek']);
    }
    return WeeklySchedule(
        id: json['id'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        dayOfTheWeek: json['dayOfTheWeek'],
        locks: json['locks'] != null
            ? List<dynamic>.from(json['locks'])
                .map((item) => WeeklyScheduleLock.fromJson(item))
                .toList()
            : []);
  }

  @override
  String toString() {
    if (id == null) {
      return '{ dayOfTheWeek: $dayOfTheWeek }';
    }
    return '{ id: $id, startTime: $startTime, endTime: $endTime, dayOfTheWeek: $dayOfTheWeek, locks: $locks }';
  }
}
