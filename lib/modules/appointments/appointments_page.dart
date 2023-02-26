import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile/modules/appointments/appointments_controller.dart';
import 'package:mobile/shared/widgets/calendar/calendar_widget.dart';

import '../../service/index.dart';
import '../../shared/models/Error/error_response_model.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final appointmentsController = AppointmentsController();

  @override
  Widget build(BuildContext context) {
    return Container(child: CalendarWidget(
      onCalendarCreated: () async {
        print(dio.options.headers["authorization"]);
        try {
          final res = await appointmentsController.getCalendar(
              DateTime(2022, 11, 30), DateTime(2022, 12, 30));

          print(res);
        } catch (e) {
          if (e is DioError) {
            ErrorResponseModel response =
                ErrorResponseModel.fromJson(e.response?.data);

            print(response);

            // GlobalSnackBar.show(
            //     context,
            //     response.message != ""
            //         ? response.message
            //         : "Ocorreu um erro ao entrar. Tente novamente.");
          }
        }
      },
    ));
  }
}
