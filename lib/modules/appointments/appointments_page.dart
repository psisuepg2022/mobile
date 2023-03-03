import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile/modules/appointments/appointments_controller.dart';
import 'package:mobile/shared/widgets/calendar/calendar_widget.dart';

import '../../shared/models/Error/error_response_model.dart';
import '../../shared/widgets/snackbar/snackbar_widget.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final appointmentsController = AppointmentsController();
  List days = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: CalendarWidget(
      eventLoader: (day) {
        days.add(day);
        if (days.length == 42) {
          print('LOADER $day');
          List<dynamic> events = [];

          try {
            () async {
              final res = await appointmentsController.getCalendar(
                  days[0], days[days.length - 1]);

              final retrievedEvents =
                  res.content.appointments.map((item) => item.title).toList();

              events = retrievedEvents;

              print(events);
            }();

            return events;
          } catch (e) {
            if (e is DioError) {
              if (e.response == null) {
                GlobalSnackBar.show(context,
                    "Ocorreu um erro ao recuperar os dados. Tente novamente.");
                return [];
              }
              ErrorResponseModel response =
                  ErrorResponseModel.fromJson(e.response?.data);

              GlobalSnackBar.show(
                  context,
                  response.message != ""
                      ? response.message
                      : "Ocorreu um erro ao entrar. Tente novamente.");

              return [];
            }
          }

          days.clear();

          print("CLEAR ${days.length}");
        }

        return [];
      },
    ));
  }
}
