import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:only_pets/Screen/BottomNavBar.dart';
import 'package:only_pets/Screen/LoginScreen.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:sizer/sizer.dart';

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
          builder: (context) => Bottomnavigatorbar(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        backgroundColor: white,
        body: Container(
            child: Center(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
            child: Lottie.asset(
              "asset/Splash_Screen_animation.json",
              height: 30.h,
              width: 40.w,
            ),
          ),
        )));
  }
}
