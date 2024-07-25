import 'package:flutter/material.dart';

import '../../models/message.dart';

class ChatProvider with ChangeNotifier {
  final List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(String text) {
    _messages.add(Message(text: text));
    notifyListeners();
  }
}
