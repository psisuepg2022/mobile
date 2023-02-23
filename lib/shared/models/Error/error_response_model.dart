// ignore_for_file: public_member_api_docs, sort_constructors_first
class ErrorResponseModel {
  String message;
  bool success;
  ErrorResponseModel({
    required this.message,
    required this.success,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel(message: json['message'], success: json['success']);

  @override
  String toString() => '{ message: $message, success: $success }';
}
