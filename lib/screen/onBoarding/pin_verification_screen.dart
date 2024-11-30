
import 'package:flutter/material.dart';
import 'package:note/screen/onBoarding/set_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../styel/style.dart';


class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
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
                Text("PIN Verification", style: Head1Text(colorDarkBlue)),
                const SizedBox(height: 10),
                Text("A 4 digit pin has been send to your mobile number",
                    style: Head1Text(colorLightGray)),
                const SizedBox(height: 20),
                PinCodeTextField(
                    appContext: context,
                    length: 6,
                    pinTheme: App0TPStyle(),
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {}),
                ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild('Verify'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SetPasswordScreen(),),
                    );
                  },
                ),
              ]
          ),
        ),
      ]),
    );
  }
}
