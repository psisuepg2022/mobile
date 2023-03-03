import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final List<dynamic> Function(DateTime)? eventLoader;
  const CalendarWidget({super.key, required this.eventLoader});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    print('NETREI');
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
    });

    // `start` or `end` could be null
    // if (start != null && end != null) {
    //   _selectedEvents.value = _getEventsForRange(start, end);
    // } else if (start != null) {
    //   _selectedEvents.value = _getEventsForDay(start);
    // } else if (end != null) {
    //   _selectedEvents.value = _getEventsForDay(end);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "pt_BR",
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      firstDay: DateTime.utc(2021, 12, 31),
      lastDay: DateTime.utc(2030, 3, 14),
      onRangeSelected: _onRangeSelected,
      calendarStyle: const CalendarStyle(
          selectedDecoration:
              BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          todayDecoration: BoxDecoration(
              color: AppColors.secondary, shape: BoxShape.circle)),
      headerStyle: const HeaderStyle(titleCentered: true),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      sixWeekMonthsEnforced: true,
      eventLoader: widget.eventLoader,
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
