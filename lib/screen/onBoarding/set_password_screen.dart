
import 'package:flutter/material.dart';

import '../../styel/style.dart';
import 'login_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ScreenBackground(context),
        Container(
          padding: const EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set Password",
                  style: Head1Text(colorDarkBlue),
                ),
                const SizedBox(height: 1),
                Text(
                  'Minimum length password 8 character with Latter and number combination',
                  style: Head6Text(colorLightGray),
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
                ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild('Confirm'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) =>
                      false, // This removes all previous routes.
                    );
                  },
                ),
              ]),
        ),
      ]),
    );
  }
}
