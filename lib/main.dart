import 'package:flutter/material.dart';
import 'package:note/screen/onBoarding/email_verification_screen.dart';
import 'package:note/screen/onBoarding/login_screen.dart';
import 'package:note/screen/onBoarding/pin_verification_screen.dart';
import 'package:note/screen/onBoarding/reg_screen.dart';
import 'package:note/screen/onBoarding/set_password_screen.dart';
import 'package:note/screen/onBoarding/splash_screen.dart';
import 'package:note/component/new_task_.dart';
import 'package:note/screen/task/home_task_sreen.dart';
import 'package:note/utiliti/utility.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');
  if(token == null){
    runApp( const Myapp('/login'));
  }
  else{
    runApp( const Myapp('/'));
  }
}

class Myapp extends StatelessWidget {
  final String firstRoute;

  const Myapp(this.firstRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      initialRoute: firstRoute,
      routes: {
        '/' : (context) => const HomeTaskScreen(),
        '/login' : (context) => const LoginScreen(),
        '/registration' : (context) => const RegistrationScreen(),
        '/emailVerification' : (context) => const EmailVerificationScreen(),
        '/pin' : (context) => const PinVerificationScreen(),
        '/setPassword' : (context) => const SetPasswordScreen(),
      },
    );
  }
}