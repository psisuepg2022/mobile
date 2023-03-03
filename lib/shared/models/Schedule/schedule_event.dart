// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScheduleEvent {
  final String id;
  final String? updatedAt;
  final String title;
  final String contactNumber;
  final String startDate;
  final String endDate;

  ScheduleEvent(
      {required this.id,
      this.updatedAt,
      required this.contactNumber,
      required this.startDate,
      required this.endDate,
      required this.title});

  factory ScheduleEvent.fromJson(Map<String, dynamic> json) => ScheduleEvent(
      id: json['id'],
      updatedAt: json['updatedAt'],
      contactNumber: json['contactNumber'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      title: json['title']);

  @override
  String toString() {
    return '{ id: $id, updatedAt: $updatedAt, contactNumber: $contactNumber, startDate: $startDate, endDate: $endDate, title: $title }';
  }
}
