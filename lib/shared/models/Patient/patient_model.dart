// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile/shared/models/Address/address_model.dart';
import 'package:mobile/shared/models/Liable/liable_model.dart';
import 'package:mobile/shared/models/Person/person_model.dart';

class PatientModel extends PersonModel {
  final int? age;
  final String gender;
  final String maritalStatus;
  final LiableModel? liable;
  final AddressModel? address;

  PatientModel({
    required super.name,
    required super.id,
    required super.birthDate,
    super.CPF,
    super.contactNumber,
    super.email,
    this.age,
    required this.gender,
    required this.maritalStatus,
    this.liable,
    this.address,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      contactNumber: json['contactNumber'],
      CPF: json['CPF'],
      email: json['email'],
      age: json['age'],
      maritalStatus: json['maritalStatus'],
      birthDate: json['birthDate'],
      liable:
          json['liable'] != null ? LiableModel.fromJson(json['liable']) : null,
      address: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null);

  @override
  String toString() {
    return '{ id: $id, name: $name, gender: $gender, maritalStatus: $maritalStatus, address: $address, liable: $liable, birthDate: $birthDate }';
  }
}
