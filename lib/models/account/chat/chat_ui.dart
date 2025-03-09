// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'Message.dart';

class chat extends StatefulWidget {
  const chat({
    Key? key,
    required this.profilePic,
    required this.userName,
    required this.nameId,
  }) : super(key: key);

  final String profilePic;
  final String userName;
  final String nameId;
  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  final TextEditingController _controller = TextEditingController();
  List<Message> messags = [
    Message(date: DateTime.now(), isSentByMe: false, text: 'السلام عليكم'),
    Message(
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true,
        text: 'و عليكم السلام, مرحبا '),
    Message(
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false,
        text: 'ربي يبارك خدمتك ما شاء الله '),
    Message(
        date: DateTime.now().subtract(const Duration(seconds: 50)),
        isSentByMe: true,
        text: 'شكرا نحن في الخدمة '),
    Message(
        date: DateTime.now().subtract(const Duration(seconds: 30)),
        isSentByMe: false,
        text: 'حاب تخدملي كيفها '),
    Message(date: DateTime.now(), isSentByMe: true, text: 'بالطبع'),
  ].toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 217, 232, 255),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 13, left: 20, bottom: 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(widget.profilePic),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.userName,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.nameId,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Color.fromARGB(255, 108, 122, 156),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        // primary: const Color.fromARGB(
                        //     255, 87, 144, 223), // <-- Button color
                        // onPrimary: const Color.fromARGB(
                        //     255, 108, 122, 156), // <-- Splash color
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
              color: Color.fromARGB(150, 108, 122, 156),
            ),
            Expanded(
              child: GroupedListView<Message, DateTime>(
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                  message.date.hour,
                ),
                elements: messags,
                padding: const EdgeInsets.all(8),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Card(
                    shadowColor: Colors.blue,
                    elevation: 5,
                    color: const Color.fromARGB(255, 87, 144, 223),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:
                          message.isSentByMe ? messageByMe() : messageNotByMe(),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: message.isSentByMe
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // const Divider(
            //   endIndent: 90,
            //   indent: 90,
            //   thickness: 1,
            //   color: Color.fromARGB(150, 108, 122, 156),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 128, 181, 255),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              color: Colors.grey[500]),
                          hintText: 'Type a message',
                          contentPadding: const EdgeInsets.all(16),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        messags.add(
                          Message(
                              date: DateTime.now(),
                              isSentByMe: true,
                              text: _controller.text),
                        );

                        _controller.clear();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      // primary: const Color.fromARGB(
                      //     255, 87, 144, 223), // <-- Button color
                      // onPrimary: const Color.fromARGB(
                      //     255, 108, 122, 156), // <-- Splash color
                    ),
                    child: const Icon(
                      Icons.send,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  //message field
                  //send icon
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration messageByMe() {
    return const BoxDecoration(
        color: Color.fromARGB(255, 87, 144, 223),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25)));
  }

  BoxDecoration messageNotByMe() {
    return const BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25)));
  }
}
