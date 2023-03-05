// ignore_for_file: public_member_api_docs, sort_constructors_first
class PatientRequestParams {
  final int page;
  final int size;
  final String? composed;

  PatientRequestParams({
    required this.page,
    required this.size,
    this.composed,
  });
}
