import 'package:dio/dio.dart';
import 'package:mobile/shared/models/Clinic/clinic_response.dart';

class SplashController {
  Future<ClinicResponseModel> fetchClinics() async {
    final response = await Dio().get('http://10.0.2.2:3333/api/auth/clinics');
    ClinicResponseModel data = ClinicResponseModel.fromJson(response.data);

    return data;
  }
}
