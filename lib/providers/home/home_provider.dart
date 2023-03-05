// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return Home();
});

class Home extends ChangeNotifier {
  bool loading = true;

  void setLoading(bool isLoading) {
    loading = isLoading;
    notifyListeners();
  }
}
