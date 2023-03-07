import 'package:mobile/shared/models/Person/person_model.dart';

class LiableModel extends PersonModel {
  LiableModel(
      {required super.id,
      required super.name,
      required super.birthDate,
      super.CPF,
      super.email});

  factory LiableModel.fromJson(Map<String, dynamic> json) => LiableModel(
      id: json['id'],
      name: json['name'],
      birthDate: json['birthDate'],
      CPF: json['CPF'],
      email: json['email']);
}
