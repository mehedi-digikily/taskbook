
import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../styel/style.dart';
import '../../utiliti/utility.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  Map<String, String> FormValues = {
    "email":"",
    "OTP":"",
    "password":"",
    "cpassword":"",
  };
  bool Loading = false;

  @override
  void initState() {
    callStoreUserData();
    super.initState();
  }

  callStoreUserData() async {
    String? OTP = await ReadUserData('OTPVerification');
    String? Email = await ReadUserData('EmailVerification');
    InputOnChange("OTP", OTP!);
    InputOnChange("email", Email!);

  }


  InputOnChange(String MapKey, String Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['password']!.length == 0) {
      ErrorToast('Password Rearguard');
    }
    else if(FormValues['password']!= FormValues['cpassword']){
      ErrorToast('Confirm  Password Should be same!');
    }else {
      setState(() {
        Loading = true;
      });

      bool res = await SetPasswordRequest(FormValues);

      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/login',
              (route) => false,
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
      body: Stack(children: [
        ScreenBackground(context),
        Container(
          padding: const EdgeInsets.all(30),
          child: Loading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              :  Column(
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
                  onChanged: (Textvalue){
                  InputOnChange('password', Textvalue);
                },
                  decoration: AppInputDecoration("Password"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (Textvalue){
                    InputOnChange('cpassword', Textvalue);
                  },
                  decoration: AppInputDecoration("Confirm Password"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild('Confirm'),
                  onPressed: () {
                    FormOnSubmit();
                  },
                ),
              ]),
        ),
      ]),
    );
  }
}
