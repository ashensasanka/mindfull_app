import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mindful_momentum/pages/from_home_page/play_music.dart';

class RelaxMusicPage extends StatefulWidget {
  const RelaxMusicPage({super.key});

  @override
  State<RelaxMusicPage> createState() => _RelaxMusicPageState();
}

class _RelaxMusicPageState extends State<RelaxMusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 100),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Relaxation music',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10),
              height: 55,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: Text(
                'Search here .......',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayMusicPage(
                      file_name: 'assets/audio/music1.mp3',
                      name: 'Music1',
                    ),
                  ),
                );
              },
              child: Container(
                height: 95,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset('assets/images/icon9.png'),
                    ),
                    Text(
                      'Music 1',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayMusicPage(
                      file_name: 'assets/audio/music2.mp3',
                      name: 'Music2',
                    ),
                  ),
                );
              },
              child: Container(
                height: 95,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset('assets/images/icon9.png'),
                    ),
                    Text(
                      'Music 2',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayMusicPage(
                      file_name: 'assets/audio/music3.mp3',
                      name: 'Music3',
                    ),
                  ),
                );
              },
              child: Container(
                height: 95,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset('assets/images/icon9.png'),
                    ),
                    Text(
                      'Music 3',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayMusicPage(
                      file_name: 'assets/audio/music4.mp3',
                      name: 'Music4',
                    ),
                  ),
                );
              },
              child: Container(
                height: 95,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset('assets/images/icon9.png'),
                    ),
                    Text(
                      'Music 4',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
