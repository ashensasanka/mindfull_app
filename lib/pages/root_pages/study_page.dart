import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../utils/firestor.dart';
import '../../utils/stream_note.dart';
import 'add_task_screen.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

bool show = true;

class _StudyPageState extends State<StudyPage> {
  late List<GDPData> _chartdata;
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    _chartdata = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Add_screen(),
            ),
          );
        },
        backgroundColor: Color(0xffebd9b4),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stream_note(false),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Task You have Completed',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Stream_note(true),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<int> _fetchUserDataLength() async {
    // Fetch data from Firestore and return its length
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('notecount${user?.uid}')
        .get();
    return querySnapshot.size;
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData(
          'TASK', 70, Colors.black), // Set color for each data point if needed
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp, this.color);
  final String continent;
  final int gdp;
  final Color color; // Add a color property
}
