import 'package:mobile/shared/models/Schedule/schedule_lock.dart';

class WeeklySchedule {
  final String id;
  final String startTime;
  final String endTime;
  final String dayOfTheWeek;
  final List<ScheduleLock>? locks;

  WeeklySchedule(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.dayOfTheWeek,
      this.locks});

  factory WeeklySchedule.fromJson(Map<String, dynamic> json) => WeeklySchedule(
        id: json['id'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        dayOfTheWeek: json['dayOfTheWeek'],
        locks: json['locks'],
      );
}
