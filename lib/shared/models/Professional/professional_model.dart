// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:mobile/shared/models/Address/address_model.dart';
import 'package:mobile/shared/models/Person/person_model.dart';

class ProfessionalModel extends PersonModel {
  final AddressModel? address;
  final String profession;
  final String? specialization;
  final String registry;

  ProfessionalModel(
      {required super.name,
      required super.id,
      required super.birthDate,
      super.CPF,
      super.contactNumber,
      super.email,
      this.address,
      required this.profession,
      required this.registry,
      this.specialization});

  factory ProfessionalModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalModel(
          id: json['id'],
          name: json['name'],
          registry: json['registry'],
          contactNumber: json['contactNumber'],
          CPF: json['CPF'],
          email: json['email'],
          specialization: json['specialization'],
          profession: json['profession'],
          birthDate: json['birthDate'],
          address: json['address'] != null
              ? AddressModel.fromJson(json['address'])
              : null);

  @override
  String toString() {
    return '{ id: $id, name: $name, registry: $registry, profession: $profession, address: $address, specialization: $specialization, birthDate: $birthDate }';
  }
}
