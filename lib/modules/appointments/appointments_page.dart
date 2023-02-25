import 'package:flutter/material.dart';
import 'package:mobile/shared/widgets/calendar/calendar_widget.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: const CalendarWidget());
  }
}
