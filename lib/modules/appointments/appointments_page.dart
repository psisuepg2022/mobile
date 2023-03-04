import 'package:flutter/material.dart';
import 'package:mobile/modules/appointments/appointments_controller.dart';
import 'package:mobile/shared/models/Schedule/schedule_event.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final appointmentsController = AppointmentsController();
  List days = [];
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  final RangeSelectionMode _rangeSelectionMode =
      RangeSelectionMode.toggledOff; //
  ValueNotifier<List<ScheduleEvent>> events = ValueNotifier([]);
  ValueNotifier<List<ScheduleEvent>> dayEvents = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      List<ScheduleEvent> newDayEvents = events.value.where((e) {
        final DateTime itemDate = DateTime(
            int.parse(e.startDate.split('T')[0].split('-')[0]),
            int.parse(e.startDate.split('T')[0].split('-')[1]),
            int.parse(e.startDate.split('T')[0].split('-')[2]));

        if (isSameDay(selectedDay, itemDate)) {
          return true;
        }
        return false;
      }).toList();

      setState(() {
        dayEvents.value = newDayEvents;
      });
    }
  }

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

  String getAppointmentHours(String startDate, String endDate) {
    final startHour = startDate.split('T')[1].split('.')[0].substring(0, 5);
    final endHour = endDate.split('T')[1].split('.')[0].substring(0, 5);

    return '$startHour - $endHour';
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TableCalendar<ScheduleEvent?>(
        locale: "pt_BR",
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.month,
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
        onDaySelected: _onDaySelected,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        onCalendarCreated: (pageController) async {
          final res = await appointmentsController.getCalendar(
              DateTime(2023, 02, 15), DateTime(2023, 03, 10));

          setState(() {
            events.value = res.content.appointments;
          });
        },
        sixWeekMonthsEnforced: true,
        eventLoader: ((day) {
          final dayEvents = events.value
              .map((e) {
                final DateTime itemDate = DateTime(
                    int.parse(e.startDate.split('T')[0].split('-')[0]),
                    int.parse(e.startDate.split('T')[0].split('-')[1]),
                    int.parse(e.startDate.split('T')[0].split('-')[2]));

                if (isSameDay(day, itemDate)) {
                  return e;
                }
                return null;
              })
              .where((element) => element != null)
              .toList();

          return dayEvents;
        }),
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
      Expanded(
          child: ValueListenableBuilder<List<ScheduleEvent>>(
        valueListenable: dayEvents,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  onTap: () => print('${value[index]}'),
                  title: Text(
                      '${value[index].title} | ${getAppointmentHours(value[index].startDate, value[index].endDate)}'),
                ),
              );
            },
          );
        },
      ))
    ]);
  }
}
