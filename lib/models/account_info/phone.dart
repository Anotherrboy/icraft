// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class phone extends StatelessWidget {
  TextEditingController controller1;
  phone({
    Key? key,
    required this.controller1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: controller1,
      onSaved: (value) {
        controller1.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        } else if (!RegExp(r'^[+0][567][0-9]{8}$').hasMatch(value)) {
          return "غير صحيح";
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
          labelText: 'الهاتف',
          prefixIcon: Icon(
            Icons.phone_outlined,
            color: Colors.lightBlue,
          ),
          hintText: '06 XX XX XX XX'),
    );
  }
}
