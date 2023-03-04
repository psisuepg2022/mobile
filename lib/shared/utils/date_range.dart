List<DateTime> daysInMonth(DateTime date) {
  final int daysQnt = DateTime(date.year, date.month + 1, 0).day;

  return [
    DateTime(date.year, date.month, 1),
    DateTime(date.year, date.month, daysQnt)
  ];
}

DateTime stringToDateTime(String date) => DateTime(
    int.parse(date.split('T')[0].split('-')[0]),
    int.parse(date.split('T')[0].split('-')[1]),
    int.parse(date.split('T')[0].split('-')[2]));

DateTime stringToDateTimeWithHours(String date) => DateTime(
      int.parse(date.split('T')[0].split('-')[0]),
      int.parse(date.split('T')[0].split('-')[1]),
      int.parse(date.split('T')[0].split('-')[2]),
      int.parse(date.split('T')[1].substring(0, 2)),
      int.parse(date.split('T')[1].substring(3, 5)),
      int.parse(date.split('T')[1].substring(6, 8)),
    );
