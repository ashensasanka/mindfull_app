import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';
import '../providers/responce_provider.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final respoProvider = Provider.of<RespoProvider>(context);

    return ListView.builder(
      itemCount: chatProvider.messages.length,
      itemBuilder: (context, index) {
        final message = chatProvider.messages[index];
        final responce = respoProvider.responces[index];
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5, // Change the width as needed
                      ),
                      color: Color(0xffcd95db),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(message.text),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset('assets/images/icon22.png'),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset('assets/images/icon22.png'),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5, // Change the width as needed
                      ),
                      color: Color(0xffcd95db),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(responce.text),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}