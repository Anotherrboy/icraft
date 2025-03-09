import 'package:flutter/material.dart';
import 'package:icraft_project/models/account/notifications/notification_card.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 70,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Notifications',
                    style: TextStyle(fontFamily: 'Poppins_bold', fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) {
                return NotificationCard(
                    onPressed: () {},
                    type: Icons.email,
                    image:
                        'assets/images/random people/rax-arn-hhChqzLkbTE-unsplash.jpg',
                    subWidget: const Icon(Icons.email),
                    text: 'mouhamed',
                    subText: 'mouhamed Likes your comment',
                    time: '01:27 PM');
              }),
            ),
          ),
        ],
      ),
    );
  }
}
