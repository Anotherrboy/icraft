// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icraft_project/home.dart';
import 'package:icraft_project/models/account/notifications/notifications_ui.dart';
import 'package:icraft_project/profile.dart';
import 'package:icraft_project/search.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selected_index = 0;
  bool isBottomNavBarVisible = true;

  static final List<Widget> _NavScreens = <Widget>[
    const home(),
    const NotificationsPage(),
    const Search(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          // child: UserProfilePage(
          //     userName: "Mouh Placo",
          //     location: "tebéssa",
          //     backGroudnPic: "assets/images/placo platre/placoBackground.webp",
          //     profilePic: 'assets/images/placo platre/placoProfile.jpg',
          //     nameId: '@mou7_2022',
          //     followers: "122",
          //     following: "5",
          //     review: "4.2",
          //     votes: "40",
          //     bio: ' خبير ديكور اسقف المنازل و الجدران'),
          child: _NavScreens.elementAt(_selected_index),
        ),
        bottomNavigationBar: isBottomNavBarVisible
            ? Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: SafeArea(
                    child: GNav(
                  tabs: const [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                      textStyle: TextStyle(fontFamily: 'Poppins'),
                      hoverColor: Colors.blue,
                    ),
                    GButton(
                      icon: LineIcons.bellAlt,
                      text: 'Notific...',
                      textStyle: TextStyle(fontFamily: 'Poppins'),
                      hoverColor: Colors.red,
                    ),
                    GButton(
                      icon: LineIcons.search,
                      text: 'Search',
                      textStyle: TextStyle(fontFamily: 'Poppins'),
                      hoverColor: Colors.amber,
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                      textStyle: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ],
                  onTabChange: (index) {
                    setState(() {
                      _selected_index = index;
                    });
                  },
                  selectedIndex: _selected_index,
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: const Color.fromARGB(60, 87, 144, 223),
                  color: Colors.black,
                )),
              )
            : null,
      ),
    );
  }
}
