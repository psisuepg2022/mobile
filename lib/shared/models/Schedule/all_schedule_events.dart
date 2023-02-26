import 'dart:convert';

import 'package:mobile/shared/models/Schedule/schedule_event.dart';
import 'package:mobile/shared/models/Schedule/schedule_lock.dart';
import 'package:mobile/shared/models/Schedule/weekly_schedule.dart';

class AllScheduleEvents {
  final List<ScheduleEvent> appointments;
  final List<WeeklySchedule> weeklySchedule;
  final List<ScheduleLock> scheduleLocks;

  AllScheduleEvents(
      {required this.appointments,
      required this.weeklySchedule,
      required this.scheduleLocks});

  factory AllScheduleEvents.fromJson(Map<String, dynamic> json) =>
      AllScheduleEvents(
        appointments: List<ScheduleEvent>.from(jsonDecode(json['content'])
            .map((model) => ScheduleEvent.fromJson(model))),
        weeklySchedule: List<WeeklySchedule>.from(jsonDecode(json['content'])
            .map((model) => WeeklySchedule.fromJson(model))),
        scheduleLocks: List<ScheduleLock>.from(jsonDecode(json['content'])
            .map((model) => ScheduleLock.fromJson(model))),
      );
}
