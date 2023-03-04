import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/shared/models/Schedule/schedule_event.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';
import 'package:mobile/shared/utils/date_range.dart';
import 'package:mobile/shared/utils/tz_date_time.dart';

class AppointmentCardWidget extends StatelessWidget {
  final ScheduleEvent event;
  const AppointmentCardWidget({super.key, required this.event});

  String getAppointmentHours(String startDate, String endDate) {
    final startHour = startDate.split('T')[1].split('.')[0].substring(0, 5);
    final endHour = endDate.split('T')[1].split('.')[0].substring(0, 5);

    return '$startHour - $endHour';
  }

  String statusSubtitle(String status) {
    switch (status) {
      case 'Agendado':
        return 'Agendado em: ';
      case 'Confirmado':
        return 'Confirmado em: ';
      case 'Concluído':
        return 'Concluído em: ';
      case 'Ausência':
        return 'Ausente em: ';
      case 'Cancelado':
        return 'Cancelado em: ';
      default:
        return 'Agendado em: ';
    }
  }

  String updateDate(DateTime date) =>
      DateFormat("dd 'de' MMMM 'de' yyyy 'às' HH:mm", 'pt_BR').format(date);

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                  const SizedBox(
                    height: 20,
                  ),
                  if (event.updatedAt != null)
                    Row(
                      children: [
                        const Icon(
                          Icons.event_available,
                          color: AppColors.primary,
                          size: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(statusSubtitle(event.resource),
                                style: TextStyles.eventModalContactDefault),
                            Text(
                                updateDate(convertTz(stringToDateTimeWithHours(
                                    event.updatedAt as String))),
                                style: TextStyles.eventModalContactNumber),
                          ],
                        )
                      ],
                    )
                ],
              ),
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
