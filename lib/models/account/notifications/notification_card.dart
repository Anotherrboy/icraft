import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  final Function onPressed;
  final String image;
  final IconData type;
  final Widget subWidget;
  final String text;
  final String subText;
  final String time;
  final bool pressed;
  final Color color;
  const NotificationCard({
    Key? key,
    required this.onPressed,
    required this.image,
    required this.type,
    required this.subWidget,
    required this.text,
    required this.subText,
    required this.time,
    this.color = const Color.fromARGB(255, 230, 238, 250),
    this.pressed = false,
  }) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: widget.color,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(146, 60, 177, 255),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(widget.image),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.text,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'Poppins_bold',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.text,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      widget.time,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    widget.type,
                    color: Colors.blue.shade300,
                  )
                ],
              ),
            ),
          ),
          // const Divider(
          //   thickness: 1,
          //   height: 0,
          //   color: Color.fromARGB(146, 60, 177, 255),
          // ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
