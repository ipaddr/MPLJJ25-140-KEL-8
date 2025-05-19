import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'verification_screen.dart';
import 'facebook_login_screen.dart';
import 'facebook_verification_screen.dart';
import 'recover_account_screen.dart';
import 'verify_code_screen.dart';
import 'password_account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroFresh',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/facebook-login': (context) => const FacebookLoginScreen(),
        '/facebook_verification':
            (context) => const FacebookVerificationScreen(),
        '/recover-account': (context) => const RecoverAccountScreen(),
        '/verify-code': (context) => const VerifyCodeScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
      },
    );
  }
}
