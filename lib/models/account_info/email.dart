// ignore_for_file: unnecessary_const, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class email extends StatelessWidget {
  TextEditingController controller1;
  email({
    Key? key,
    required this.controller1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller1,
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'الإيميل خاطئ';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          labelText: ' الإيمايل',
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.lightBlue,
          ),
          hintText: 'xyz@gmail.com'),
    );
  }
}
