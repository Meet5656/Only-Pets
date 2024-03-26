import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:only_pets/Screen/LoginScreen.dart';
import 'package:only_pets/util/Color.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({super.key});

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 200, left: 30),
              child: LottieBuilder.asset(
                "asset/Animation - 1706500945314.json",
                height: 400,
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                  height: 55,
                  width: 430,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primaryColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginscreen(),
                            ));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 17.dp, color: Colors.white),
                      ))),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //    height: 55,
            //       width: 430,
            //       decoration: BoxDecoration(
            //         color: Colors.black,
            //         border: Border.all(width: 1),
            //       ),
            // ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 30),
              child: Container(
                  height: 55,
                  width: 430,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.primaryColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 17.dp, color: Colors.white),
                      ))),
            ),
          ],
        ));
  }
}
