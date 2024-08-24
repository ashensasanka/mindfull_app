import 'dart:math'; // Import the dart:math package
import 'package:flutter/material.dart';
import '../../utils/firestor.dart';

class Add_screen extends StatefulWidget {
  const Add_screen({super.key});

  @override
  State<Add_screen> createState() => _Add_screenState();
}

class _Add_screenState extends State<Add_screen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();
  final taskTime = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  int indexx = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo1.png', // Replace 'your_image.png' with your image file path
                width: 500, // Adjust width as needed
                height: 150, // Adjust height as needed
              ),
              SizedBox(height: 40),
              title_widgets(),
              SizedBox(height: 20),
              subtite_wedgite(),
              SizedBox(height: 20),
              taskTime_wedgite(),
              SizedBox(height: 20),
              imagess(),
              SizedBox(height: 20),
              button()
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffebd9b4),
            minimumSize: Size(170, 48),
          ),
          onPressed: () {
            int taskTimeValue = int.tryParse(taskTime.text)!*60 ?? 0;
            Firestore_Datasource().AddTask(subtitle.text, title.text, indexx, taskTimeValue);
            Firestore_Datasource()
                .AddTaskFirebase(subtitle.text, title.text, indexx, taskTimeValue);
            Navigator.pop(context);
          },
          child: Text(
            'Add Task',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF9EFDB),
            minimumSize: Size(170, 48),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Container imagess() {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(
                    () {
                  indexx = index;
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 7 : 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: indexx == index ? Color(0xff18DAA3) : Colors.grey,
                  ),
                ),
                width: 140,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset('assets/images/${index}.png'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget title_widgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Task  Title ....',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xff18DAA3),
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding subtite_wedgite() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,
          focusNode: _focusNode2,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Add Note....',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xff18DAA3),
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget taskTime_wedgite() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: taskTime,
          focusNode: _focusNode3,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Task  Time ....',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xff18DAA3),
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
