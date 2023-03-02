import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile/modules/appointments/appointments_controller.dart';
import 'package:mobile/shared/utils/date_range.dart';
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: CalendarWidget(
      onCalendarCreated: () async {
        try {
          final res = await appointmentsController.getCalendar(
              DateTime(2022, 11, 30), DateTime(2022, 12, 30));

          print(dateRange());
        } catch (e) {
          if (e is DioError) {
            ErrorResponseModel response =
                ErrorResponseModel.fromJson(e.response?.data);

            GlobalSnackBar.show(
                context,
                response.message != ""
                    ? response.message
                    : "Ocorreu um erro ao entrar. Tente novamente.");
          }
        }
      },
    ));
  }
}
