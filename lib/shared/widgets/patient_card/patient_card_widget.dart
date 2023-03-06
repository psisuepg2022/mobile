import 'package:flutter/material.dart';
import 'package:mobile/shared/models/Patient/patient_model.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';

class PatientCardWidget extends StatefulWidget {
  final PatientModel patient;
  const PatientCardWidget({super.key, required this.patient});

  @override
  State<PatientCardWidget> createState() => _PatientCardWidgetState();
}

class _PatientCardWidgetState extends State<PatientCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: AppColors.primary)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '${widget.patient.name} (${widget.patient.age} anos)',
          style: TextStyles.patientCardName,
        ),
        Text('Contato: ${widget.patient.contactNumber}',
            style: TextStyles.patientCardContactNumber),
      ]),
    );
  }
}
