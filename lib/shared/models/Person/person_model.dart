// ignore_for_file: non_constant_identifier_names

class PersonModel {
  final String id;
  final String name;
  final String? email;
  final String? contactNumber;
  final String? CPF;
  final String birthDate;

  PersonModel(
      {required this.id,
      required this.name,
      this.email,
      this.contactNumber,
      this.CPF,
      required this.birthDate});

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
      id: json['id'],
      name: json['name'],
      contactNumber: json['contactNumber'],
      email: json['email'],
      CPF: json['CPF'],
      birthDate: json['birthDate']);

  factory PersonModel.fromMap(Map<String, dynamic> map) => PersonModel(
        id: map['id'] as String,
        name: map['name'] as String,
        contactNumber: map['contactNumber'] as String,
        email: map['email'] as String,
        CPF: map['CPF'] as String,
        birthDate: map['birthDate'] as String,
      );

  @override
  String toString() {
    return '{ id: $id, name: $name, contactNumber: $contactNumber, email: $email, birthDate: $birthDate, CPF: $CPF }';
  }
}
