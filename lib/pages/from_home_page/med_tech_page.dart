import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../med_tech/med_tech.dart';

class MedtechPage extends StatefulWidget {
  const MedtechPage({super.key});

  @override
  State<MedtechPage> createState() => _MedtechPageState();
}

class _MedtechPageState extends State<MedtechPage> {
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
                    'Meditation Techniques',
                    style: TextStyle(fontSize: 28),
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
                    builder: (context) => MedTech(
                      title: 'Mindfulness Meditation',
                      description:
                          'How it Works: Focus on the present moment, paying attention to your thoughts, feelings, and sensations without judgment.\n\nBenefits: Increases awareness of stress triggers, helps you stay grounded, and reduces the impact of stress.\n\nDuration: 5-10 mins per session',
                      imagePath: 'assets/images/meditation.jpeg',
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
                      child: Image.asset('assets/images/icon10.png'),
                    ),
                    Text(
                      'Technique 1',
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
                    builder: (context) => MedTech(
                      title: 'Loving-Kindness Meditation',
                      description:
                          'How it Works: Cultivate feelings of kindness and compassion toward yourself and others by silently repeating phrases like, "May I be happy. May I be healthy! May I be at peace."\n\nWhy It’s Helpful for Students: This practice helps combat negative self-talk and overwhelming feelings, promoting emotional well-being.\n\nDuration: 5-10 mins',
                      imagePath: 'assets/images/meditation.jpeg',
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset('assets/images/icon18.png'),
                    ),
                    Text(
                      'Technique 2',
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
                    builder: (context) => MedTech(
                      title: 'Body Scan Meditation',
                      description:
                          'Description: Involves paying attention to different parts of the body, usually starting from the toes and moving up to the head. Practitioners observe sensations without trying to change them.\n\nBenefits: Enhances body awareness, reduces stress, and promotes relaxation.',
                      imagePath: 'assets/images/meditation.jpeg',
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset('assets/images/icon19.png'),
                    ),
                    Text(
                      'Technique 3',
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
                    builder: (context) => MedTech(
                      title: 'Breath Awareness Meditation',
                      description:
                          'How it Works: Focus on your breathing, noticing the rhythm, depth, and sensations of each breath.\n\nBenefits: Simple yet effective in calming the mind, reducing stress, and improving focus.\n\nDuration: 10-15 mins',
                      imagePath: 'assets/images/meditation.jpeg',
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset('assets/images/icon20.png'),
                    ),
                    Text(
                      'Technique 4',
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
