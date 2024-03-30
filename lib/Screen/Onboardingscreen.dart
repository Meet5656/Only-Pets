import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/Screen/LoginScreen.dart';
import 'package:only_pets/model/Onboardingmodel.dart';

class onboardingscreen extends StatefulWidget {
  const onboardingscreen({super.key});

  @override
  State<onboardingscreen> createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  late PageController controller;
  int currentindex = 0;
  Timer? timer;

  void initState() {
    controller = PageController(initialPage: 0);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  void startTimer() {
    // Change page every 3 seconds
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentindex < contents.length - 1) {
        currentindex++;
      } else {
        currentindex = 0;
      }
      controller.animateToPage(
        currentindex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() {
                          currentindex = value;
                        });
                      },
                      itemCount: contents.length,
                      itemBuilder: (_, i) {
                        return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(contents[i].image),
                              fit: BoxFit.cover,
                            )),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    stops: [0.5, 1.0],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black38,
                                      Colors.black,
                                    ]),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    contents[i].title,
                                    style: TextStyle(
                                        fontFamily: "Alegreya",
                                        fontSize: 20.sp,
                                        // fontWeight: FontWeight.w100,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: Text(
                                      contents[i].description,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Alegreya",
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Row(
                    children: [
                      ...List.generate(
                        contents.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: builddot(index),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, bottom: 2.h,right: 5.w),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 0.2.w),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.w))),
                              backgroundColor: Colors.transparent),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => loginscreen(),
                                ));
                          },
                          child: Center(
                            child: Text(
                              'Start',
                              style: TextStyle(color: Colors.white,fontFamily: "Alegreya",fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Container builddot(int index) {
    return Container(
      height: 1.3.h,
      width: 1.3.h,
      margin: EdgeInsets.only(
        bottom: 3.h,
      ),
      decoration: BoxDecoration(
          color: currentindex == index ? Colors.white : Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(2.h)),
          border: Border.all(width: 0.3.w, color: Colors.white)),
    );
  }
}
