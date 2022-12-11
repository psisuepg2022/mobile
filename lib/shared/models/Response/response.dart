class ResponseModel<T> {
  final String message;
  final bool success;
  final T? content;

  ResponseModel({required this.message, required this.success, this.content});
}
