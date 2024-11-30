import 'package:flutter/material.dart';
import 'package:note/screen/onBoarding/email_verification_screen.dart';
import 'package:note/screen/onBoarding/login_screen.dart';
import 'package:note/screen/onBoarding/pin_verification_screen.dart';
import 'package:note/screen/onBoarding/reg_screen.dart';
import 'package:note/screen/onBoarding/set_password_screen.dart';
import 'package:note/screen/onBoarding/splash_screen.dart';
import 'package:note/screen/task/new_task_list_screen.dart';
import 'package:note/utiliti/utility.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');
  if(token == null){
    runApp( Myapp('/login'));
  }
  else{
    runApp( Myapp('/newTask'));
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
        '/splash' : (context) => const SplashScreen(),
        '/login' : (context) => const LoginScreen(),
        '/registration' : (context) => const RegistrationScreen(),
        '/emailVerification' : (context) => const EmailVerificationScreen(),
        '/pin' : (context) => const PinVerificationScreen(),
        '/password' : (context) => const SetPasswordScreen(),
        '/newTask' : (context) => const NewTaskListScreen(),
      },
    );
  }
}