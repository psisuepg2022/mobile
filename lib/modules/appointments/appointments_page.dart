import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indexed/indexed.dart';
import 'package:mobile/modules/appointments/appointments_controller.dart';
import 'package:mobile/providers/home/home_provider.dart';
import 'package:mobile/shared/models/Schedule/schedule_event.dart';
import 'package:mobile/shared/utils/date_range.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_text_styles.dart';
import '../../shared/widgets/appointment_card/appointment_card.dart';

class AppointmentsPage extends ConsumerStatefulWidget {
  const AppointmentsPage({super.key});

  @override
  ConsumerState<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends ConsumerState<AppointmentsPage> {
  final appointmentsController = AppointmentsController();
  List days = [];
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  ValueNotifier<List<ScheduleEvent>> events = ValueNotifier([]);
  ValueNotifier<List<ScheduleEvent>> dayEvents = ValueNotifier([]);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getMonthEvents(DateTime.now());
    });
    super.initState();
  }

  @override
  void dispose() {
    events.dispose();
    dayEvents.dispose();
    super.dispose();
  }

  void getMonthEvents(DateTime date) async {
    ref.read(homeProvider).setLoading(true);
    setState(() {});
    final List<DateTime> monthRange = daysInMonth(date);

    final res =
        await appointmentsController.getCalendar(monthRange[0], monthRange[1]);
    ref.read(homeProvider).setLoading(false);
    setState(() {
      events.value = res.content.appointments;
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      List<ScheduleEvent> newDayEvents = events.value.where((e) {
        final DateTime itemDate = stringToDateTime(e.startDate);

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

  @override
  Widget build(BuildContext context) {
    return Indexer(children: [
      if (ref.read(homeProvider).loading)
        Indexed(
          index: 2,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
      Indexed(
        index: 1,
        child: Column(children: [
          TableCalendar<ScheduleEvent?>(
            locale: "pt_BR",
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            firstDay: DateTime.utc(2021, 12, 31),
            lastDay: DateTime.utc(2030, 3, 14),
            calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
                markersAlignment: Alignment.bottomRight,
                selectedDecoration: BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                todayDecoration: BoxDecoration(
                    color: AppColors.lock, shape: BoxShape.circle)),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) => events.isNotEmpty
                  ? Container(
                      width: 18,
                      height: 18,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: AppColors.primary, shape: BoxShape.circle),
                      child: Text(
                        '${events.length}',
                        style: TextStyles.eventCounter,
                      ),
                    )
                  : null,
            ),
            headerStyle: const HeaderStyle(titleCentered: true),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: _onDaySelected,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            eventLoader: ((day) {
              final dayEvents = events.value
                  .map((e) {
                    final DateTime itemDate = stringToDateTime(e.startDate);

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
              dayEvents.value = [];
              getMonthEvents(focusedDay);
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
                  return AppointmentCardWidget(
                    event: value[index],
                  );
                },
              );
            },
          ))
        ]),
      )
    ]);
  }
}
