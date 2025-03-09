// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class userStory {
  final String imgUrl;
  final String userName;
  final String userId;
  Color color;

  userStory({
    required this.imgUrl,
    required this.userName,
    required this.userId,
    this.color = const Color.fromARGB(225, 100, 143, 217),
  });
}
