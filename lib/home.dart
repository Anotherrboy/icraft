// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:icraft_project/models/news_feed/stories.dart';
import 'package:icraft_project/models/news_feed/stories_data.dart';
import 'package:icraft_project/models/news_feed/user_story.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<userStory> stories = [
    userStory(
        imgUrl:
            'assets/images/random people/samsung-memory-xS9KgKrR3ac-unsplash.jpg',
        userName: 'Aymen ph',
        userId: ""),
    userStory(
        imgUrl: 'assets/images/random people/rax-arn-hhChqzLkbTE-unsplash.jpg',
        userName: 'Farida',
        userId: ""),
    userStory(
        imgUrl:
            'assets/images/random people/khaled-ghareeb-xZSEvSlHRv8-unsplash.jpg',
        userName: 'Yasmine',
        userId: ""),
    userStory(
        imgUrl:
            'assets/images/random people/ivana-cajina-_7LbC5J-jw4-unsplash.jpg',
        userName: 'Omar',
        userId: ""),
    userStory(
        imgUrl: 'assets/images/plumber/istockphoto-1205228815-612x612.jpg',
        userName: 'fathi plomp',
        userId: ""),
  ];
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 230, 238, 250),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(0),
                        // <-- Splash color
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Icraft',
                    style: TextStyle(
                      fontFamily: 'Poppins_bold',
                      fontSize: 33,
                      color: Color.fromARGB(150, 134, 75, 181),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 230, 238, 250),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(0),
                        // <-- Splash color
                      ),
                      child: const Icon(
                        Icons.notifications,
                        size: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Column(
                              children: const [
                                CircleAvatar(
                                  radius: 33,
                                  backgroundColor: Colors.blue,
                                  child: CircleAvatar(
                                    radius: 31,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 29,
                                      backgroundImage: AssetImage(
                                          'assets/images/placo platre/placoProfile.jpg'),
                                    ),
                                  ),
                                ),
                                Text(
                                  'You',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const Positioned(
                              top: 17,
                              left: 17,
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: stories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Stories(
                                          userId: stories[index].userId,
                                          stories: stories_data,
                                          userImg: stories[index].imgUrl,
                                          user_story: stories[index],
                                        )),
                              );
                              setState(() {
                                stories[index].color = Colors.grey;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 33,
                                    backgroundColor: stories[index].color,
                                    child: CircleAvatar(
                                      radius: 31,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 29,
                                        backgroundImage:
                                            AssetImage(stories[index].imgUrl),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    stories[index].userName,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Color.fromARGB(255, 230, 238, 250)),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
