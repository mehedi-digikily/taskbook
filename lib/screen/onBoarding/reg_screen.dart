
import 'package:flutter/material.dart';

import '../../styel/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ScreenBackground(context),
        Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Join With Us",
                    style: Head1Text(colorDarkBlue),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    "Learn with rabbil hasan",
                    style: Head6Text(colorLightGray),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration("Email Address"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration("First Name"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration("Last Name"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration("Mobile"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration("Password"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration("Confirm Password"),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild('Registration'),
                      onPressed: () {},
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
