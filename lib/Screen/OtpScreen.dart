import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/util/Color.dart';
import 'package:pinput/pinput.dart';

class otpscreen extends StatefulWidget {
  const otpscreen({super.key});

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        backgroundColor: CustomColors.maincolor,
        body: GestureDetector(
          onTap: () {
            // Unfocus the keyboard when tapping outside of text fields
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    // bottom: 0,
                    child: Container(
                      height: 20.h,
                      width: double.infinity,
                      child: Image.asset(
                          "asset/hand-drawn-paw-prints-background_23-2151132904.jpg",
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.w),
                              topRight: Radius.circular(10.w)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset(
                                "asset/all pets/20602804_6322675.jpg",
                                width: 35.h,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 6.w),
                                  child: Container(
                                    child: Text(
                                      "Verification Code",
                                      style: TextStyle(
                                        fontSize: 30.dp,
                                        fontFamily: "Alegreya",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 6.w, top: 0.3.h),
                                  child: Text(
                                    "Type the Verification code\nwe've sent you",
                                    style: TextStyle(
                                        fontSize: 18.dp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Alegreya"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Pinput(
                                  length: 4,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  defaultPinTheme: PinTheme(
                                      textStyle: TextStyle(
                                          fontSize: 21.dp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Alegreya"),
                                      height: 6.h,
                                      width: 6.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(11.dp)),
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 0.2.h,
                                              color: Colors.black
                                                  .withOpacity(0.5)))),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Didn't you receive any code",
                                      style: TextStyle(
                                          fontSize: 18.dp,
                                          fontFamily: "Alegreya")),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 5.5.h,
                                  width: 87.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.w),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        CustomColors.maincolor,
                                        Colors.black.withOpacity(0.6),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "SUBMIT",
                                      style: TextStyle(
                                          fontSize: 17.dp,
                                          color: Colors.white,
                                          fontFamily: "Alegreya"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
