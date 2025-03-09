// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class password_confirm_password extends StatefulWidget {
  TextEditingController controller1;
  TextEditingController controller2;

  password_confirm_password({
    Key? key,
    required this.controller1,
    required this.controller2,
  }) : super(key: key);

  @override
  State<password_confirm_password> createState() =>
      _password_confirm_passwordState();
}

class _password_confirm_passwordState extends State<password_confirm_password> {
  bool _password_confirm_passwordVisible = false;
  bool _confirmingpassword_confirm_passwordVisisble = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          controller: widget.controller1,
          obscureText: !_password_confirm_passwordVisible,
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
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            labelText: 'كلمة المرور',
            // Here is key idea
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Colors.lightBlue,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                // Based on password_confirm_passwordVisible state choose the icon
                _password_confirm_passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of password_confirm_passwordVisible variable
                setState(() {
                  _password_confirm_passwordVisible =
                      !_password_confirm_passwordVisible;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: widget.controller2,
          obscureText:
              !_confirmingpassword_confirm_passwordVisisble, //This will obscure text dynamically
          validator: (value) {
            if (value!.isEmpty) {
              return null;
            } else if (value != widget.controller1.text) {
              return "غير مطابق";
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            labelText: 'تأكيد كلمة المرور',
            prefixIcon: const Icon(
              Icons.lock_reset_outlined,
              color: Colors.lightBlue,
            ),
            // Here is key idea
            suffixIcon: IconButton(
              icon: Icon(
                // Based on password_confirm_passwordVisible state choose the icon
                _confirmingpassword_confirm_passwordVisisble
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of password_confirm_passwordVisible variable
                setState(() {
                  _confirmingpassword_confirm_passwordVisisble =
                      !_confirmingpassword_confirm_passwordVisisble;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
