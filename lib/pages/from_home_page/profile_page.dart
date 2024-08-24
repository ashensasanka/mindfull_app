import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:mindful_momentum/pages/from_home_page/time_table_page.dart';
import 'package:mindful_momentum/pages/signin_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
List<List<String>> generateTableData() {
  List<List<String>> data = [];

  // Header row
  data.add(['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']);

  // List of subjects
  final List<String> subjects = ['Study', 'Listen to Music', 'Work', 'Meditation', 'Exercise', 'Breathe'];

  // Shuffle subjects to randomize order
  subjects.shuffle();

  // Generate data for each row (time slots)
  List<String> timeSlots = [
    '9.00 AM', '10.00 AM', '11.00 AM', '12.00 PM',
    '1.00 PM', '2.00 PM', '3.00 PM', '4.00 PM',
    '5.00 PM', '6.00 PM', '7.00 PM', '8.00 PM',
    '9.00 PM', '10.00 PM', '11.00 PM'
  ];

  for (int slotIndex = 0; slotIndex < timeSlots.length; slotIndex++) {
    List<String> row = [timeSlots[slotIndex]];
    for (int day = 0; day < 7; day++) {
      // Use the subject index modulo the number of subjects to cycle through the list
      String subject = subjects[(slotIndex * 7 + day) % subjects.length];
      row.add(subject);
    }
    data.add(row);
  }

  return data;
}
Future<void> generatePDF(BuildContext context) async {
  final pdf = pw.Document();
  final tableData = generateTableData();
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Center(
              child: pw.Text(
                'MINDFUL MOMENTUM',
                style: pw.TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            pw.SizedBox(height: 20), // Add some space between text and table
            pw.Table.fromTextArray(
              headers: tableData.first,
              data: tableData.sublist(1),
            ),
          ],
        );
      },
    ),
  );

  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/example.pdf';
  final file = File(path);
  await file.writeAsBytes(await pdf.save());
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('PDF Generated'),
      content: Text('PDF has been saved to $path'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    ),
  );
}

class _ProfilePageState extends State<ProfilePage> {
  String? dropdownValue;
  String time = '';
  TextEditingController timeController = TextEditingController();
  TextEditingController freetimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 70),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 120, right: 80),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Image.asset('assets/images/icon21.png'),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      // Sign out the current user
                      try {
                        await FirebaseAuth.instance.signOut();
                        // Navigate to the login screen or home screen after sign out
                        // Example:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        );
                      } catch (e) {
                        print('Error signing out: $e');
                        // Handle signout error
                      }
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                'Exam Dates:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Calendar(
                  startOnMonday: true,
                  weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
                  eventDoneColor: Colors.green,
                  selectedColor: Colors.pink,
                  selectedTodayColor: Colors.red,
                  todayColor: Colors.blue,
                  eventColor: null,
                  locale: 'de_DE',
                  todayButtonText: 'Heute',
                  allDayEventText: 'Ganztägig',
                  multiDayEndText: 'Ende',
                  isExpanded: true,
                  expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                  dayOfWeekStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 11),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Working Hours',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: timeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xffd9d9d9),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    // Check if timeController has a valid number
                    int? inputTime = int.tryParse(timeController.text);
                    if (inputTime != null) {
                      int calculatedTime = 24 - inputTime;
                      if (calculatedTime < 0) {
                        time = 'Enter valid time';
                      } else {
                        time = calculatedTime.toString();
                      }
                    } else {
                      // Handle invalid input
                      time = 'Put Free Time';
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xffcd95db),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Calculate Free Time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: DropdownButtonFormField<String>(
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.black,
                        ),
                        hint: const Text(
                          'Time',
                          style: TextStyle(color: Colors.grey),
                        ),
                        dropdownColor: Colors.white,
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(
                                () {
                              dropdownValue = newValue!;
                            },
                          );
                        },
                        items: <String>['Morning', 'Night']
                            .map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 50,
                  //   width: 130,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xffd9d9d9),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(20),
                  //     ),
                  //   ),
                  //   child: Center(
                  //     child: TextField(
                  //       controller: freetimeController,
                  //       keyboardType: TextInputType.number,
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(color: Colors.grey),
                  //       decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         hintText: 'Enter free time here',
                  //         hintStyle: TextStyle(color: Colors.grey),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomTimetableScreen(time: dropdownValue,),
                        ),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xffcd95db),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Generate Time Table',
                          style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Your Free Time $time h per day',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
