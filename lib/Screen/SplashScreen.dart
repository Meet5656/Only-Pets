import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';

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
          builder: (context) => SplashScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomLeft,
                //   colors: [
                //     // Colors.black,
                //     // Colors.brown.shade300,
                //     // Colors.white.withOpacity(0.6),
                //     // CustomColors.maincolor,
                //   ],
                // ),
                ),
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black,
                    BlendMode.srcIn), // Set the desired color here
                child: Lottie.asset(
                  "asset/Splash_Screen_animation.json",
                  height: 30.h,
                  width: 40.w,
                ),
              ),
            )));
  }
}
