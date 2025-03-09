// ignore_for_file: must_be_immutable, camel_case_types, prefer_final_fields

import 'package:flutter/material.dart';

class password extends StatefulWidget {
  TextEditingController controller1;

  password({
    Key? key,
    required this.controller1,
  }) : super(key: key);

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: widget.controller1,
      obscureText: !_passwordVisible,
      onSaved: (value) {
        widget.controller1.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        } else if (value.length < 6) {
          return "قصير جدا";
        } else {
          return null;
        }
      }, //This will obscure text dynamically
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'كلمة المرور',
        // Here is key idea
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.lightBlue,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
