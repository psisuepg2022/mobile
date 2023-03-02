import 'package:dio/dio.dart';
import 'package:mobile/shared/models/Schedule/schedule_response.dart';

import '../../service/index.dart';

class AppointmentsController {
  Future<ScheduleResponseModel> getCalendar(
      DateTime startDate, DateTime endDate) async {
    final formData = {
      'startDate': startDate.toString().split(' ')[0],
      'endDate': endDate.toString().split(' ')[0],
    }; // weekly

    final response = await dio.post('appointment/calendar?weekly=true',
        data: formData, options: Options(followRedirects: true));
    ScheduleResponseModel data = ScheduleResponseModel.fromJson(response.data);
    return data;
  }
}
