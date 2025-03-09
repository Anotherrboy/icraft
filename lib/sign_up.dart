// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

import 'models/account_info/page1.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _last_name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone_number = TextEditingController();
  final TextEditingController _confirm_ps = TextEditingController();

  List<Step> stepList() => [
        Step(
          title: const Text('الحساب'),
          state: _currentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _currentStep >= 0,
          content: firstStep(
            name: _name,
            last_name: _last_name,
            email_address: _email,
            passwd: _password,
            phone_number: _phone_number,
            confirm_ps: _confirm_ps,
          ),
        ),
        Step(
          title: const Text('معلومات شخصية'),
          state: _currentStep <= 1 ? StepState.editing : StepState.complete,
          isActive: _currentStep >= 1,
          content: const Center(
            child: Text('two'),
          ),
        ),
        Step(
          title: const Text('التحقق'),
          state: _currentStep <= 2 ? StepState.editing : StepState.complete,
          isActive: _currentStep >= 2,
          content: const Center(
            child: Text('three'),
          ),
        ),
      ];
  int _currentStep = 0;
  void nextStep() {
    if (formkey.currentState!.validate() &&
        _currentStep < stepList().length - 1) {
      setState(() {
        _currentStep++;
        formkey.currentState!.save();
        print("firstName :${_name.text}");
        print("lastName :${_last_name.text}");
        print("Phone :${_phone_number.text}");
        print("email :${_email.text}");
      });
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('مراحل التسجيل'),
            shadowColor: Colors.blue,
            titleTextStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            foregroundColor: Colors.white,
          ),
          key: _scaffoldKey,
          body: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Stepper(
              currentStep: _currentStep,
              onStepContinue: nextStep,
              onStepCancel: previousStep,
              steps: stepList(),
              type: StepperType.horizontal,
            ),
          )),
    );
  }
}
