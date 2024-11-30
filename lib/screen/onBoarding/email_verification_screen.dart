
import 'package:flutter/material.dart';
import 'package:note/screen/onBoarding/pin_verification_screen.dart';

import '../../styel/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            ScreenBackground(context),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Email Address",
                      style: Head1Text(colorDarkBlue),
                    ),
                    const SizedBox(height: 1),
                    Text("A 6 digit verification pin will send to your email address",
                      style: Head6Text(colorLightGray),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(decoration: AppInputDecoration("Email Address")),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild('Next'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PinVerificationScreen(),));

                      },
                    ),
                  ]
              ),
            ),
          ]),
    );
  }
}
