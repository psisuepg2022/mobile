import 'package:dio/dio.dart';
import 'package:mobile/shared/models/Patient/patient_response.dart';

import '../../service/index.dart';

class PatientsController {
  Future<PatientResponseModel> getPatients(
      int page, int size, String? composed) async {
    final formData = {'composed': composed ?? ''};

    final response = await dio.post(
        'professional/my_patients?page=$page&size=$size',
        data: formData,
        options: Options(followRedirects: true));

    PatientResponseModel data = PatientResponseModel.fromJson(response.data);

    return data;
  }
}
