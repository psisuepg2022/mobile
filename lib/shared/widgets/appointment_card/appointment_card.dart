import 'package:flutter/material.dart';
import 'package:mobile/shared/models/Schedule/schedule_event.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';

class AppointmentCardWidget extends StatelessWidget {
  final ScheduleEvent event;
  const AppointmentCardWidget({super.key, required this.event});

  String getAppointmentHours(String startDate, String endDate) {
    final startHour = startDate.split('T')[1].split('.')[0].substring(0, 5);
    final endHour = endDate.split('T')[1].split('.')[0].substring(0, 5);

    return '$startHour - $endHour';
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Situação: ',
                          style: TextStyles.eventModalStatusDefault),
                      TextSpan(
                          text: event.resource,
                          style: TextStyles.eventModalStatus),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  event.title,
                  style: TextStyles.eventModalPatientName,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Contato: ',
                          style: TextStyles.eventModalContactDefault),
                      TextSpan(
                          text: event.contactNumber,
                          style: TextStyles.eventModalContactNumber),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  getAppointmentHours(event.startDate, event.endDate),
                  style: TextStyles.eventModalHours,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: event.resource == 'Agendado'
            ? AppColors.scheduled
            : event.resource == 'Confirmado'
                ? AppColors.confirmed
                : event.resource == 'Concluído'
                    ? AppColors.concluded
                    : event.resource == 'Ausência'
                        ? AppColors.absence
                        : AppColors.cancelled,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        onTap: () {
          _showBottomSheet(context);
        },
        title: Text(
          '${event.title} | ${getAppointmentHours(event.startDate, event.endDate)}',
          style: TextStyles.eventCardTitle,
        ),
      ),
    );
  }
}
