// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:icraft_project/models/account_info/password_confirmingpssws.dart';
import 'package:icraft_project/models/account_info/phone.dart';
import 'email.dart';
import 'first_name.dart';
import 'last_name.dart';

// ignore: must_be_immutable
class firstStep extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController passwd = TextEditingController();
  TextEditingController email_address = TextEditingController();
  TextEditingController phone_number = TextEditingController();
  TextEditingController confirm_ps = TextEditingController();
  firstStep({
    Key? key,
    required this.name,
    required this.email_address,
    required this.last_name,
    required this.passwd,
    required this.phone_number,
    required this.confirm_ps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                ' مَعلُومَات الحِسَاب',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: firstName(controller1: name),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 1,
                  child: lastName(controller1: last_name),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            phone(controller1: phone_number),
            const SizedBox(
              height: 8,
            ),
            email(controller1: email_address),
            const SizedBox(
              height: 8,
            ),
            password_confirm_password(
              controller1: passwd,
              controller2: confirm_ps,
            ),
            const SizedBox(
              height: 8,
            ),
          ]),
    );
  }
}
