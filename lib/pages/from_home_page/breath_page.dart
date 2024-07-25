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
                      title: 'Diaphragmatic Breathing',
                      description:
                          'Description: Diaphragmatic breathing involves fully engaging the stomach, abdominal muscles, and diaphragm when breathing. This technique helps increase lung capacity and promotes full oxygen exchange.',
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
                      title: 'Box Breathing',
                      description:
                          'Description: Box breathing is a simple, structured breathing technique that involves breathing in, holding, exhaling, and holding again for equal counts. It\'s often used by athletes, military personnel, and individuals seeking to calm their mind.',
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
                      title: 'Alternate Nostril Breathing',
                      description:
                          'Description: Alternate nostril breathing is a yogic breath control practice that balances the left and right hemispheres of the brain. It\'s used to calm the mind and promote mental clarity.',
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
                      title: '4-7-8 Breathing Technique',
                      description:
                          'Description: The 4-7-8 breathing technique is a powerful relaxation exercise that involves a specific pattern of inhaling, holding, and exhaling. It\'s particularly effective for reducing stress and improving sleep.',
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
