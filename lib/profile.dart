import 'package:flutter/material.dart';

import 'models/account/profile_ui.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserProfilePage(
        userName: "Mouh Placo",
        location: "tebéssa",
        backGroudnPic: "assets/images/placo platre/placoBackground.webp",
        profilePic: 'assets/images/placo platre/placoProfile.jpg',
        nameId: '@mou7_2022',
        followers: "122",
        following: "5",
        review: "4.2",
        votes: "40",
        bio: ' خبير ديكور اسقف المنازل و الجدران');
  }
}
