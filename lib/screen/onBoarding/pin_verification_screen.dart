import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../api/apiClient.dart';
import '../../styel/style.dart';
import '../../utiliti/utility.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  Map<String, String> FormValues = {
    "otp":"",
  };
  bool Loading = false;

  InputOnChange(String MapKey, String Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['otp']!.length!= 6) {
      ErrorToast('Please enter a valid 6-digit PIN.');
    } else{
    setState(() {
      Loading = true;
    });
      String? EmailAddress = await ReadUserData('EmailVerification');
      bool res = await VerifiOTPRequest(EmailAddress, FormValues['otp']);

      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/setPassword',
              (route) => false,
        );
      }else{
        setState(() {
          ErrorToast('Please enter a valid PIN and try again');
          Loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            child: Loading? const Center(child: CircularProgressIndicator(),): Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PIN Verification", style: Head1Text(colorDarkBlue)),
                const SizedBox(height: 10),
                Text(
                  "A 6-digit PIN has been sent to your email.",
                  style: Head6Text(colorLightGray),
                ),
                const SizedBox(height: 20),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  pinTheme: App0TPStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (Textvalue) {
                    InputOnChange('otp', Textvalue);
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild('Verify'),
                  onPressed: (){
                    FormOnSubmit();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
