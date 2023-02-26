class WeeklyScheduleLock {
  final String id;
  final String startTime;
  final String endTime;
  final String resource;

  WeeklyScheduleLock(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.resource});

  factory WeeklyScheduleLock.fromJson(Map<String, dynamic> json) =>
      WeeklyScheduleLock(
        id: json['id'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        resource: json['resource'],
      );

  @override
  String toString() {
    return '{ id: $id, startTime: $startTime, endTime: $endTime, resource: $resource }';
  }
}
