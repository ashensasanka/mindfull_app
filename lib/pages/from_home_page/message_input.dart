import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../function.dart';
import '../providers/chat_provider.dart';
import '../providers/responce_provider.dart';

class MessageInput extends StatefulWidget {

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();
  String output = 'Only First Question Ask Again';
  String url = '';
  var data;

  Future<void> getValue() async {
    url = 'http://10.0.2.2:5000/api?query=' + _controller.text;
    try {
      data = await fetchdata(url);
      var decoded = jsonDecode(data);
      if (decoded != null && decoded is Map && decoded.containsKey('output')) {
        setState(() {
          output = decoded['output'];
        });
        _controller.clear();
      } else {
        // Handle unexpected JSON structure
        print('Unexpected JSON structure: $decoded');
      }
    } catch (e) {
      // Handle JSON decode errors and other exceptions
      print('Error fetching data: $e');
    }
  }

  void _sendMessage() {
    if (_controller.text.isEmpty) {
      return;
    }
    Provider.of<ChatProvider>(context, listen: false)
        .addMessage(_controller.text);
    Provider.of<RespoProvider>(context, listen: false).addRespo(output);
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              height: 65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.5, // Change the width as needed
                ),
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: '  Type message here...'),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, size: 40,),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}