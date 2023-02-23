import 'package:mobile/shared/models/User/login_response.dart';
import 'package:mobile/shared/models/User/user_request.dart';

import '../../service/index.dart';

class LoginController {
  UserRequestModel model = UserRequestModel();

  void onChange({String? accessCode, String? userName, String? password}) {
    model = model.copyWith(
        accessCode: accessCode, userName: userName, password: password);
  }

  Future<LoginResponseModel> signIn() async {
    final formData = {
      'accessCode': int.parse(model.accessCode!),
      'userName': model.userName,
      'password': model.password
    };

    final response = await dio.post('auth', data: formData);
    LoginResponseModel data = LoginResponseModel.fromJson(response.data);
    return data;
  }
}
