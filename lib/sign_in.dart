import 'package:flutter/material.dart';
import 'package:icraft_project/models/account_info/email.dart';
import 'package:icraft_project/models/account_info/password.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login In'),
        shadowColor: Colors.blue,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        foregroundColor: Colors.white,
      ),
      key: _scaffoldKey,
      body: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(children: [
              const Text(
                'Icraft',
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 202, 116, 236),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              email(controller1: _email),
              const SizedBox(
                height: 10,
              ),
              password(
                controller1: _password,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
