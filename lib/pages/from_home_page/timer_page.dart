import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mindful_momentum/utils/firestor.dart';

import '../../utils/local_notifications.dart';
import '../../widgets/button_widgets.dart';

class TimerPage extends StatefulWidget {
  final int taskTime;
  final String uuid;
  const TimerPage({super.key, required this.taskTime, required this.uuid,});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late int maxSeconds;
  late int seconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    maxSeconds = widget.taskTime;  // Initialize maxSeconds here
    seconds = maxSeconds;
  }

  void resetTimer() => setState(
        () => seconds = maxSeconds,
  );

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    // Check if the timer has reached zero and show the notification
    if (seconds == 0) {
      LocalNotifications.showSimpleNotification(
        title: "Reminder",
        body: "Task Completed !",
        payload: "Payload data",
      );
    }

    setState(() => timer?.cancel());
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff808080),
          Color(0xff9546C4),
          Color(0xff5e61f4),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTimer(),
            SizedBox(
              height: 80,
            ),
            buildButtons(),
          ],
        ),
      ),
    ),
  );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == maxSeconds || seconds == 0;
    return isRunning || !isCompleted
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
          text: isRunning ? "Pause" : "Resume",
          onClicked: () {
            if (isRunning) {
              stopTimer(reset: false);
              Firestore_Datasource()
                  .UpdateTime(widget.uuid, seconds);
            } else {
              startTimer(reset: false);
            }
          },
        ),
        ButtonWidget(
          text: "Cancel",
          onClicked: () {
            stopTimer();
          },
        ),
      ],
    )
        : ButtonWidget(
      text: 'Start Timer!',
      onClicked: () {
        startTimer();
      },
    );
  }

  Widget buildTimer() => SizedBox(
    width: 300,
    height: 300,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: seconds / maxSeconds,
          valueColor: AlwaysStoppedAnimation(Colors.white),
          backgroundColor: Colors.greenAccent,
          strokeWidth: 12,
        ),
        Center(
          child: buildTime(),
        ),
      ],
    ),
  );

  Widget buildTime() {
    if (seconds == 0) {
      return Icon(Icons.done, color: Colors.greenAccent, size: 112);
    } else {
      final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
      final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
      final secs = (seconds % 60).toString().padLeft(2, '0');

      return Text(
        "$hours:$minutes:$secs",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      );
    }
  }

}

