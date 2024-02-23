import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:only_pets/Screen/HomeScreen.dart';
import 'package:only_pets/Screen/LoginScreen.dart';
import 'package:only_pets/Screen/Onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splash();
    super.initState();
  }
  
  splash() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loginscreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Center(
                child: Lottie.asset(
          "asset/Animation - 1706447955741.json",
          height: 200,
          width: 200,
        ))));
  }
}
