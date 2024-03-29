// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScheduleLock {
  final String id;
  final String date;
  final String startTime;
  final String endTime;
  final String resource;

  ScheduleLock(
      {required this.id,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.resource});

  factory ScheduleLock.fromJson(Map<String, dynamic> json) => ScheduleLock(
        id: json['id'],
        date: json['date'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        resource: json['resource'],
      );

  @override
  String toString() {
    return '{ id: $id, date: $date, startTime: $startTime, endTime: $endTime, resource: $resource }';
  }
}
