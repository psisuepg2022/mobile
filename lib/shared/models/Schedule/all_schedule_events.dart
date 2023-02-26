// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile/shared/models/Schedule/schedule_event.dart';
import 'package:mobile/shared/models/Schedule/schedule_lock.dart';
import 'package:mobile/shared/models/Schedule/weekly_schedule.dart';

class AllScheduleEvents {
  final List<ScheduleEvent> appointments;
  final List<WeeklySchedule>? weeklySchedule;
  final List<ScheduleLock> scheduleLocks;

  AllScheduleEvents(
      {required this.appointments,
      this.weeklySchedule,
      required this.scheduleLocks});

  factory AllScheduleEvents.fromJson(Map<String, dynamic> json) =>
      AllScheduleEvents(
          appointments: json['appointments'] != null
              ? List<dynamic>.from(json['appointments'])
                  .map((item) => ScheduleEvent.fromJson(item))
                  .toList()
              : [],
          weeklySchedule: json['weeklySchedule'] != null
              ? List<dynamic>.from(json['weeklySchedule'])
                  .map((item) => WeeklySchedule.fromJson(item))
                  .toList()
              : [],
          scheduleLocks: json['scheduleLocks'] != null
              ? List<dynamic>.from(json['scheduleLocks'])
                  .map((item) => ScheduleLock.fromJson(item))
                  .toList()
              : []);

  @override
  String toString() =>
      '{ appointments: $appointments, weeklySchedule: $weeklySchedule, scheduleLocks: $scheduleLocks }';
}
