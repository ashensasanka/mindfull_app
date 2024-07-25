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
                          'Description: Focuses on being present and fully engaged with the here and now. Practitioners pay attention to their thoughts, feelings, and sensations without judgment.\nBenefits: Reduces stress, enhances emotional regulation, improves focus and concentration.',
                      imagePath: 'assets/images/icon10.png',
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
                          'Description: Involves sending positive intentions and loving thoughts to oneself and others. Typically, practitioners repeat phrases like “May you be happy, may you be healthy, may you be safe.\nBenefits: Increases compassion, empathy, and overall sense of well-being.',
                      imagePath: 'assets/images/icon18.png',
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
                    builder: (context) => MedTech(title: 'Body Scan Meditation',
                      description: 'Description: Involves paying attention to different parts of the body, usually starting from the toes and moving up to the head. Practitioners observe sensations without trying to change them.\nBenefits: Enhances body awareness, reduces stress, and promotes relaxation.',
                      imagePath: 'assets/images/icon19.png',
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
                    builder: (context) => MedTech(title: 'Guided Meditation', description: 'Description: Involves listening to a guide or instructor who leads the practitioner through a series of visualizations or instructions. Often uses apps, recordings, or live instructors.\nBenefits: Provides structure, helps beginners, and can be tailored for specific goals like relaxation or sleep.',
                      imagePath: 'assets/images/icon20.png',
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
