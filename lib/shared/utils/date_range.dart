import 'package:mobile/shared/utils/tz_date_time.dart';

List<DateTime> dateRange() {
  final currentDate = convertTz(DateTime.now());

  final beforeDate = currentDate.subtract(const Duration(days: 7));
  final afterDate = currentDate.add(const Duration(days: 7));

  return [beforeDate, afterDate];
}
