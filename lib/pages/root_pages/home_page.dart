import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mindful_momentum/pages/from_home_page/relax_music_page.dart';
import 'package:mindful_momentum/pages/root_pages/second_screen.dart';

import '../../utils/local_notifications.dart';
import '../from_home_page/breath_page.dart';
import '../from_home_page/chat_page.dart';
import '../from_home_page/med_tech_page.dart';
import '../from_home_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Timer? _notificationTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LocalNotifications.init();
      listenToNotification();
    });

    // Start a timer that triggers notifications periodically
    _notificationTimer = Timer.periodic(Duration(minutes: 3), (timer) {
      // First, show the simple notification
      LocalNotifications.showSimpleNotification(
        title: "Reminder",
        body: "You have to continue your Study",
        payload: "Payload data",
      );

      Future.delayed(Duration(minutes: 2), () {
        LocalNotifications.showSimpleNotification(
          title: 'Motivational Message',
          body: 'Your hard work is about to pay off. Trust your preparation and go for it.',
          payload: 'payload data5',
        );
      });

      Future.delayed(Duration(minutes: 3), () {
        LocalNotifications.showSimpleNotification(
          title: 'Reminder',
          body: 'Time to review your lecture notes!',
          payload: 'payload data2',
        );
      });

      Future.delayed(Duration(minutes: 2), () {
        LocalNotifications.showSimpleNotification(
          title: 'Motivational Message',
          body: 'Stay calm stay confident and remember why you started. You are ready for this.',
          payload: 'payload data6',
        );
      });

      Future.delayed(Duration(minutes: 3), () {
        LocalNotifications.showSimpleNotification(
          title: 'Reminder',
          body: 'Don’t forget your study session at 9 PM tonight',
          payload: 'payload data3',
        );
      });

      Future.delayed(Duration(minutes: 2), () {
        LocalNotifications.showSimpleNotification(
          title: 'Motivational Message',
          body: 'Remember, it is not about being perfect, it’s about doing your best. You have got this!',
          payload: 'payload data7',
        );
      });

      Future.delayed(Duration(minutes: 3), () {
        LocalNotifications.showSimpleNotification(
          title: 'Reminder',
          body: 'Your SE exam is in 1 week.',
          payload: 'payload data4',
        );
      });

      // After 5 seconds, show the notification with payload
      Future.delayed(Duration(minutes: 4), () {
        LocalNotifications.showNotificationWithPayload(
          id: 4,
          title: 'Chat Bot Notification',
          body: 'We have a chat bot.Do you like to chat with?',
          payload: 'payload navigation',
        );
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _notificationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff808080),
            Color(0xff9546C4),
            Color(0xff5e61f4),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Text(
              'Hello\nI\'m Alice!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RelaxMusicPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Image.asset('assets/images/icon9.png'),
                        ),
                      ),
                      Text(
                        'Relaxation\nMusic',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedtechPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Image.asset('assets/images/icon10.png'),
                        ),
                      ),
                      Text(
                        'Meditation\nTechniques',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BreathPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Image.asset('assets/images/icon11.png'),
                        ),
                      ),
                      Text(
                        'Breathing\nTechniques',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Image.asset('assets/images/icon14.png'),
                      ),
                      Text(
                        'Feedback',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, top: 20),
              child: Text(
                'How can I help you?',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(),
                  ),
                );
              },
              child: Container(
                width: 150,
                height: 55,
                decoration: BoxDecoration(
                  color: Color(0xffcd95db),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'TELL ME',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void listenToNotification() {
    LocalNotifications.onNotificationClick.stream.listen(onNotificationListener);
  }

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('Payload: $payload');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(),
        ),
      );
    }
  }
}
