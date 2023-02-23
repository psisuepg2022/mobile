// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile/shared/models/Clinic/clinic.dart';

class UserModel {
  final String id;
  final String name;
  final int? baseDuration;
  final ClinicModel clinic;
  final List<dynamic> permissions;

  UserModel({
    required this.id,
    required this.name,
    this.baseDuration,
    required this.clinic,
    required this.permissions,
  });

  @override
  String toString() {
    return '{ id: $id, name: $name, baseDuration: $baseDuration, clinic: $clinic, permissions: $permissions }';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'baseDuration': baseDuration,
      'clinic': clinic.toMap(),
      'permissions': permissions,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'] as String,
        name: map['name'] as String,
        baseDuration:
            map['baseDuration'] != null ? map['baseDuration'] as int : null,
        clinic: ClinicModel.fromMap(map['clinic'] as Map<String, dynamic>),
        permissions: List<dynamic>.from(
          (map['permissions'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
