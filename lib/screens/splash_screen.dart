import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Assuming HomeScreen and LoginScreen are defined in your project
import 'home_screen.dart';
import 'auth/login_screen.dart';

// Dummy APIs class for example purposes
// Replace with your actual authentication logic
class APIs {
  static final auth = _Auth();
}

class _Auth {
  final currentUser = null; // Example: Change based on your auth logic
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Exit full-screen mode
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.white));

        // Navigate based on authentication status
        if (APIs.auth.currentUser != null) {
          log('User: ${APIs.auth.currentUser}');
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Properly initialized MediaQuery data
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        // App logo
        Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset(
                'images/icon.png')), // Ensure this image asset is available in your project

        // Example text (or Google login button in your use case)
        Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: const Text('MADE IN INDIA WITH ❤️',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Colors.black87, letterSpacing: .5))),
      ]),
    );
  }
}

// // Dummy HomeScreen and LoginScreen for compilation
// // Replace with your actual screens
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text('Home Screen')));
//   }
// }

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text('Login Screen')));
//   }
// }
