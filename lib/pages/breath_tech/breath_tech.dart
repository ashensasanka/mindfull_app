import 'package:flutter/material.dart';

class BreathTech extends StatefulWidget {
  const BreathTech(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath});
  final String title;
  final String description;
  final String imagePath;

  @override
  State<BreathTech> createState() => _BreathTechState();
}

class _BreathTechState extends State<BreathTech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 50),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff455A64),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Meditation Techniques',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child: Image.asset(widget.imagePath),
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
