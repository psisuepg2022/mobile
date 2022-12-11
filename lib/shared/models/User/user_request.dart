class UserRequestModel {
  final int accessCode;
  final String userName;
  final String password;

  UserRequestModel(
      {required this.accessCode,
      required this.userName,
      required this.password});
}
