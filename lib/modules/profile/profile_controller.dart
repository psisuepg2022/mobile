import 'package:dio/dio.dart';
import 'package:mobile/shared/models/Professional/professional_response_model.dart';

import '../../service/index.dart';

class ProfileController {
  Future<ProfessionalResponseModel> getProfile() async {
    final response = await dio.get('professional/profile',
        options: Options(followRedirects: true));

    ProfessionalResponseModel data =
        ProfessionalResponseModel.fromJson(response.data);

    return data;
  }
}
