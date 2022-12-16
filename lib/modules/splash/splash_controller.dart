import 'package:mobile/service/index.dart';
import 'package:mobile/shared/models/Clinic/clinic_response.dart';

class SplashController {
  Future<ClinicResponseModel> fetchClinics() async {
    final response = await dio.get('auth/clinics');
    ClinicResponseModel data = ClinicResponseModel.fromJson(response.data);
    return data;
  }
}
