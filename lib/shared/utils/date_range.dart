import 'package:mobile/shared/utils/tz_date_time.dart';

List<DateTime> dateRange() {
  final currentDate = convertTz(DateTime.now());

  final beforeDate = currentDate.subtract(const Duration(days: 7));
  final afterDate = currentDate.add(const Duration(days: 7));

  return [beforeDate, afterDate];
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}
