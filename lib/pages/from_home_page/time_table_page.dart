import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_timetable/flutter_timetable.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import '../../utils/local_notifications.dart';
class CustomTimetableScreen extends StatefulWidget {
  CustomTimetableScreen({Key? key, required this.time,}) : super(key: key);

  final String? time;
  @override
  State<CustomTimetableScreen> createState() => _CustomTimetableScreenState();
}

class _CustomTimetableScreenState extends State<CustomTimetableScreen> {
  late final List<TimetableItem<String>> items;
  late final TimetableController controller;
  Timer? _notificationTimer;

  @override
  void initState() {
    super.initState();
    // Start a timer that triggers a notification every 5 seconds
    _notificationTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      LocalNotifications.showSimpleNotification(
        title: "Motivation",
        body: "You can Pass the Exams",
        payload: "Payload data",
      );
    });
    controller = TimetableController(
      start: DateUtils.dateOnly(DateTime.now()).subtract(const Duration(days: 2)),
      initialColumns: 3,
      cellHeight: 150.0,
      startHour: widget.time == 'Morning' ? 3 : 21,
      endHour: widget.time == 'Morning' ? 6 : 24,
    );
    items = generateItems();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(milliseconds: 100), () {
        controller.jumpTo(DateTime.now());
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
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white.withOpacity(0.8),
    appBar: AppBar(
      backgroundColor: Colors.white,
      actions: [
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.calendar_view_day),
          onPressed: () => controller.setColumns(1),
        ),
        IconButton(
          icon: const Icon(Icons.calendar_view_month_outlined),
          onPressed: () => controller.setColumns(3),
        ),
        IconButton(
          icon: const Icon(Icons.calendar_view_week),
          onPressed: () => controller.setColumns(5),
        ),
        IconButton(
          icon: const Icon(Icons.zoom_in),
          onPressed: () => controller.setCellHeight(controller.cellHeight + 10),
        ),
        IconButton(
          icon: const Icon(Icons.zoom_out),
          onPressed: () => controller.setCellHeight(controller.cellHeight - 10),
        ),
      ],
    ),
    body: Timetable<String>(
      controller: controller,
      items: items,
      cellBuilder: (datetime) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 0.6),
        ),
        child: Center(
          child: Text(
            DateFormat("MM/d/yyyy\nha").format(datetime),
            style: TextStyle(
              color: Colors.black
              // color: Color(0xff000000 + (0x002222 * datetime.hour) + (0x110000 * datetime.day)).withOpacity(0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      cornerBuilder: (datetime) => Container(
        color: Colors.accents[datetime.day % Colors.accents.length],
        child: Center(child: Text("${datetime.year}", style: TextStyle(fontSize: 17),),),
      ),
      headerCellBuilder: (datetime) {
        final color = Colors.primaries[datetime.day % Colors.accents.length];
        return Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: color, width: 4)),
          ),
          child: Center(
            child: Text(
              DateFormat("E\nMMM d").format(datetime),
              style: TextStyle(
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      hourLabelBuilder: (time) {
        final hour = time.hour == 12 ? 12 : time.hour % 12;
        final period = time.hour < 12 ? "am" : "pm";
        final isCurrentHour = time.hour == DateTime.now().hour;
        return Text(
          "$hour$period",
          style: TextStyle(
            fontSize: 14,
            fontWeight: isCurrentHour ? FontWeight.bold : FontWeight.normal,
          ),
        );
      },
      itemBuilder: (item) {
        final coloredItem = item as ColoredTimetableItem<String>;
        return Container(
          decoration: BoxDecoration(
            color: coloredItem.color.withAlpha(220),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              coloredItem.data ?? "",
              style: const TextStyle(fontSize: 14),
            ),
          ),
        );
      },
      nowIndicatorColor: Colors.red,
      snapToDay: true,
    ),
    floatingActionButton: FloatingActionButton(
      child: const Text("Now"),
      onPressed: () => controller.jumpTo(DateTime.now()),
    ),
  );
  final List<String> subjects = ['Study','Listn a Music','Meditation','Breath'];
  /// Generates some random items for the timetable.
  List<ColoredTimetableItem<String>> generateItems() {
    final items = <ColoredTimetableItem<String>>[];
    final today = DateUtils.dateOnly(DateTime.now());

    final startDate = today.subtract(const Duration(days: 2));
    final endDate = today.add(const Duration(days: 5));
    final random = Random();

    for (var day = startDate; day.isBefore(endDate); day = day.add(Duration(days: 1))) {
      DateTime lastEndTime = day.add(Duration(hours: controller.startHour)); // Start from the beginning of the time range

      while (lastEndTime.hour < controller.endHour) {
        final startTime = lastEndTime;

        // Generate a random duration between 30 minutes to 2.5 hours, ensuring it doesn't go beyond the end hour
        final maxDuration = (controller.endHour - startTime.hour) * 60 - startTime.minute;
        if (maxDuration <= 15) break; // If less than 30 minutes left, stop generating items for the day
        final randomDuration = Duration(minutes: 15 + random.nextInt(min(150, maxDuration - 15)));

        final endTime = startTime.add(randomDuration);
        if (endTime.hour > controller.endHour) break; // Ensure the item ends within the allowed hours

        // Generate a random color
        final randomColor = Colors.primaries[random.nextInt(Colors.primaries.length)];

        items.add(ColoredTimetableItem(
          startTime: startTime,
          endTime: endTime,
          data: subjects[(startTime.hour - controller.startHour) % subjects.length],
          color: randomColor,
        ));

        lastEndTime = endTime; // Update lastEndTime to the end of the current item
      }
    }

    return items;
  }
}

class ColoredTimetableItem<T> extends TimetableItem<T> {
  final Color color;

  ColoredTimetableItem({
    required DateTime startTime,
    required DateTime endTime,
    required T data,
    required this.color,
  }) : super(startTime, endTime, data: data);
}



