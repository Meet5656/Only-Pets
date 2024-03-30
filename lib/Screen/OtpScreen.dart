import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_pets/Screen/dashboard.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:only_pets/Screen/formButton.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/controller/otpController.dart';
import 'package:only_pets/util/Color.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  OtpScreen({
    this.mobile,
    this.otp,
    this.isFromSignUp,
    this.isFromLogin,
    Key? key,
  }) : super(key: key);
  String? otp;
  String? mobile;
  bool? isFromSignUp;
  bool? isFromLogin;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var controller = Get.put(OtpController());
  String deviceType = 'mobile';
  @override
  void initState() {
    controller.clearFocuseNode();
    controller.fieldOne.text = '';
    controller.fieldTwo.text = '';
    controller.fieldThree.text = '';
    controller.fieldFour.text = '';
    controller.otpController.text = "";
    controller.otpController.clear();
    controller.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    controller.timer.cancel();
    controller.otpController.clear();
    controller.fieldOne.text = '';
    controller.fieldTwo.text = '';
    controller.fieldThree.text = '';
    controller.fieldFour.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.primaryColor,
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
                                        fontSize: 30.sp,
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
                                        fontSize: 18.sp,
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
                                  // controller: controller.otpController,
                                  // focusNode: controller.otpNode,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  defaultPinTheme: PinTheme(
                                      textStyle: TextStyle(
                                          fontSize: 21.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Alegreya"),
                                      height: 6.h,
                                      width: 6.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(11.sp)),
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
                                          fontSize: 18.sp,
                                          fontFamily: "Alegreya")),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),

                              Container(
                                margin: EdgeInsets.only(
                                  left: 8.w,
                                  right: 8.w,
                                ),
                                child: FadeInUp(
                                  from: 50,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.offAll(DashboardScreen());
                                    },
                                    child: Container(
                                      height: 5.h,
                                      width: 50.w,
                                      child: Center(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              //ORL
                              // Container(
                              //   margin: EdgeInsets.only(
                              //     left: 8.w,
                              //     right: 8.w,
                              //   ),
                              //   child: FadeInUp(
                              //     from: 50,
                              //     child: Obx(() {
                              //       return getSecondaryFormButton(() {
                              //         if (controller.isFormInvalidate.value ==
                              //             true) {
                              //           if (widget.isFromSignUp == true) {
                              //             controller.getLoginOtpApi(
                              //                 context,
                              //                 widget.otp.toString(),
                              //                 widget.mobile.toString());
                              //           } else {
                              //             controller.getOtpApi(
                              //                 context,
                              //                 widget.otp.toString(),
                              //                 widget.mobile.toString());
                              //           }
                              //         }
                              //       },
                              //           isFromCart: true,
                              //           BottomConstant.buttonLabel,
                              //           isvalidate:
                              //               controller.isFormInvalidate.value);
                              //     }),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 2.0.h,
                              // ),
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
