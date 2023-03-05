// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  final String id;
  final String city;
  final String state;
  final String zipCode;
  final String publicArea;
  final String district;

  AddressModel({
    required this.id,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.publicArea,
    required this.district,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      publicArea: json['publicArea'],
      district: json['district']);

  @override
  String toString() {
    return '{ id: $id, city: $city, state: $state, zipCode: $zipCode, district: $district, publicArea: $publicArea }';
  }
}
