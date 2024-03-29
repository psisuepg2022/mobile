// ignore_for_file: public_member_api_docs, sort_constructors_first

class ClinicModel {
  final int code;
  final String name;

  ClinicModel({
    required this.code,
    required this.name,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) =>
      ClinicModel(code: json['code'], name: json['name']);

  Map<String, dynamic> toJson() => {'code': code, 'name': name};

  @override
  String toString() => '{ code: $code, name: $name }';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
    };
  }

  factory ClinicModel.fromMap(Map<String, dynamic> map) {
    return ClinicModel(
      code: map['code'] as int,
      name: map['name'] as String,
    );
  }
}
