import 'package:flutter/material.dart';

import '../../models/responce.dart';

class RespoProvider with ChangeNotifier {
  final List<Responce> _responces = [];

  List<Responce> get responces => _responces;

  void addRespo(String text) {
    _responces.add(Responce(text: text));
    notifyListeners();
  }
}
