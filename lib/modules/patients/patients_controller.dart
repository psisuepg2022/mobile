import 'package:dio/dio.dart';
import 'package:mobile/shared/models/Patient/patient_request_params.dart';
import 'package:mobile/shared/models/Patient/patient_response.dart';

import '../../service/index.dart';

class PatientsController {
  PatientRequestParams model = PatientRequestParams(
    page: 0,
    size: 10,
  );

  void onChange({int? page, int? size, String? composed}) {
    model = model.copyWith(page: page, size: size, composed: composed);
  }

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
