// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mobile/shared/models/Clinic/clinic.dart';

class ClinicListModel {
  final List<ClinicModel> items;
  final int totalItems;

  ClinicListModel({
    required this.items,
    required this.totalItems,
  });

  factory ClinicListModel.fromJson(Map<String, dynamic> json) =>
      ClinicListModel(
          totalItems: json['totalItems'],
          items: List<dynamic>.from(json['items'])
              .map((item) => ClinicModel.fromJson(item))
              .toList());

  Map<String, dynamic> toJson() => {
        'totalItems': totalItems,
        'items': items.map((item) => item.toJson()).toList(),
      };

  @override
  String toString() =>
      'ClinicListModel(items: $items, totalItems: $totalItems)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
      'totalItems': totalItems,
    };
  }

  factory ClinicListModel.fromMap(Map<String, dynamic> map) {
    return ClinicListModel(
      items: List<ClinicModel>.from(
        (map['items'] as List<int>).map<ClinicModel>(
          (x) => ClinicModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalItems: map['totalItems'] as int,
    );
  }
}
