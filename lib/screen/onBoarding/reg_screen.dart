
import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../styel/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  Map<String, String> FormValues = {
    "email":"",
    "firstName":"",
    "lastName":"",
    "mobile":"",
    "password":"",
    "cpassword":"",
    "photo":""
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
    } else if (FormValues['firstName']!.length == 0) {
      ErrorToast('FirstName Required!');
    } else if (FormValues['lastName']!.length == 0) {
      ErrorToast('LastName Required!');
    } else if (FormValues['mobile']!.length == 0) {
      ErrorToast('Mobile Required!');
    } else if (FormValues['password']!= FormValues['cpassword'] ) {
      ErrorToast('Confirm  Password Should be same !');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await RegestationRequest(FormValues);

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
          child: SingleChildScrollView(
            child: Loading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                :  Column(
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
                    onChanged: (Textvalue) {
                      InputOnChange("email", Textvalue);
                    },
                    decoration: AppInputDecoration("Email Address"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("firstName", Textvalue);
                    },
                    decoration: AppInputDecoration("First Name"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("lastName", Textvalue);
                    },
                    decoration: AppInputDecoration("Last Name"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("mobile", Textvalue);
                    },
                    decoration: AppInputDecoration("Mobile"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("password", Textvalue);
                    },
                    decoration: AppInputDecoration("Password"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("cpassword", Textvalue);
                    },
                    decoration: AppInputDecoration("Confirm Password"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Registration'),
                    onPressed: () {
                      FormOnSubmit();
                    },
                  ),
                ]
            ),
          ),
        ),
      ]),
    );
  }
}
