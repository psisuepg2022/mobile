// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile/shared/models/Patient/patient_model.dart';

class PatientListModel {
  final int totalItems;
  final List<PatientModel> items;

  PatientListModel({
    required this.totalItems,
    required this.items,
  });

  factory PatientListModel.fromJson(Map<String, dynamic> json) =>
      PatientListModel(
          totalItems: json['totalItems'],
          items: List<dynamic>.from(json['items'])
              .map((item) => PatientModel.fromJson(item))
              .toList());

  @override
  String toString() => '{ items: $items, totalItems: $totalItems }';
}
