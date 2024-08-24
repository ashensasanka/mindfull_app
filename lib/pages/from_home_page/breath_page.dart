import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../breath_tech/breath_tech.dart';

class BreathPage extends StatefulWidget {
  const BreathPage({super.key});

  @override
  State<BreathPage> createState() => _BreathPageState();
}

class _BreathPageState extends State<BreathPage> {
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
                    'Breathing Techniques',
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
                    builder: (context) => BreathTech(
                      title: 'Alternate Nostril Breathing',
                      description:
                          'How it Works: Close your right nostril with your thumb and inhale through your left nostril. Close your left nostril with your ring finger, open your right nostril, and exhale through the right side. Inhale through the right nostril, close it and exhale through the left. Continue alternating sides.\n\nWhy It’s Helpful for Students: Balances both sides of the brain, promoting calmness and mental clarity. It’s great for managing stress before starting a challenging task or project.\n\nDuration: 5-15 mins',
                      imagePath: 'assets/images/breathing_1.jpeg',
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
                      child: Image.asset('assets/images/icon11.png'),
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
                    builder: (context) => BreathTech(
                      title: '4-7-8 Breathing',
                      description:
                          'How it Works: Inhale quietly through your nose for 4 counts, hold your breath for 7 counts, and then exhale completely through your mouth for 8 counts. Repeat for 4 to 8 cycles.\n\nWhy It’s Helpful for Students: This technique helps manage stress and anxiety and can be particularly useful before bedtime to improve sleep quality during stressful periods.\n\nDuration: 10-20 mins',
                      imagePath: 'assets/images/breathing_2.jpeg',
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
                      child: Image.asset('assets/images/icon11.png'),
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
                    builder: (context) => BreathTech(
                      title: 'Deep Diaphragmatic Breathing (Abdominal Breathing)',
                      description:
                          'How it Works: Sit or lie down comfortably. Place one hand on your chest and the other on your abdomen. Take a deep breath through your nose, ensuring your abdomen rises more than your chest. Exhale slowly through your mouth.\n\nWhy It’s Helpful for Students: Activates the parasympathetic nervous system, which reduces stress and promotes relaxation. This technique is great for calming nerves before exams or presentations.\n\nDuration: 5-10 mins',
                        imagePath: 'assets/images/breathing_3.jpeg'
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
                      child: Image.asset('assets/images/icon11.png'),
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
                    builder: (context) => BreathTech(
                      title: 'Alternate Nostril Breathing',
                      description:
                      'How it Works: Close your right nostril with your thumb and inhale through your left nostril. Close your left nostril with your ring finger, open your right nostril, and exhale through the right side. Inhale through the right nostril, close it and exhale through the left. Continue alternating sides.\n\nWhy It’s Helpful for Students: Balances both sides of the brain, promoting calmness and mental clarity. It’s great for managing stress before starting a challenging task or project.\n\nDuration: 5-15 mins',
                      imagePath: 'assets/images/breathing_1.jpeg',
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
                      child: Image.asset('assets/images/icon11.png'),
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
