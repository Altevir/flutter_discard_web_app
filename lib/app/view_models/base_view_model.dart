import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  RequestStatus? _status;
  RequestStatus? get status => _status;

  set status(RequestStatus? status) {
    _status = status;
    notifyListeners();
  }
}

enum RequestStatus {
  initial,
  loading,
  success,
  error,
}
