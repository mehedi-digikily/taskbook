
import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../styel/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  Map<String, String> FormValues = {
    "email":"",
  };
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email Required!');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await VerifyEmailRequest(FormValues['email']);

      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/pin',
              (route) => true,
        );

        setState(() {
          Loading = false;
        });
      } else {
        setState(() {
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
              child: Loading? const Center(child: CircularProgressIndicator(),) : Column(
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
                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange('email', Textvalue);
                      },
                        decoration: AppInputDecoration("Email Address"),),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild('Next'),
                      onPressed: () {
                        FormOnSubmit();
                      },
                    ),
                  ]
              ),
            ),
          ]),
    );
  }
}
