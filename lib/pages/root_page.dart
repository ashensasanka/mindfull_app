import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindful_momentum/pages/root_pages/music_page.dart';
import 'package:mindful_momentum/pages/root_pages/study_page.dart';
import 'package:mindful_momentum/pages/root_pages/study_page.dart';

import 'from_home_page/profile_page.dart';
import 'root_pages/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff808080),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
            child: Image.asset('assets/images/icon12.png'),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color(0xffD9D9D9),
        selectedIndex: currentPageIndex,
        backgroundColor: Color(0xffcd95db),
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Image(
              image: AssetImage('assets/images/icon1.png'),
            ),
            icon: Image(
              image: AssetImage('assets/images/icon5.png'),
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Image(
              image: AssetImage('assets/images/icon6.png'),
            ),
            icon: Image(
              image: AssetImage('assets/images/icon2.png'),
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Image(
              image: AssetImage('assets/images/icon7.png'),
            ),
            icon: Image(
              image: AssetImage('assets/images/icon3.png'),
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Image(
              image: AssetImage('assets/images/icon8.png'),
            ),
            icon: Image(
              image: AssetImage('assets/images/icon4.png'),
            ),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        HomePage(),

        /// Music page
        MusicPage(),

        /// Study page
        StudyPage(),

        /// Translate page
        HomePage(),
      ][currentPageIndex],
    );
  }
}
