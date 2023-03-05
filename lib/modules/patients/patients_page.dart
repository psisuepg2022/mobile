import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/modules/patients/patients_controller.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/shared/models/Patient/patient_model.dart';

import '../../service/index.dart';

class PatientsPage extends ConsumerStatefulWidget {
  const PatientsPage({super.key});

  @override
  ConsumerState<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends ConsumerState<PatientsPage> {
  final patientsController = PatientsController();
  bool loading = true;
  List<PatientModel> patients = [];

  Future<void> getPatients() async {
    try {
      setState(() {
        loading = true;
      });
      final hasUser = await ref.read(authProvider).getUserData();

      if (hasUser) {
        final accessToken = ref.read(authProvider).accessToken;
        dio.options.headers[HttpHeaders.authorizationHeader] =
            "bearer $accessToken";
      }

      final value = await patientsController.getPatients(0, 10, '');
      print(value.toString());
      setState(() {
        patients = value.content.items;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("PACIENTES"),
    );
  }
}
