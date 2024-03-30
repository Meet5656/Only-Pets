import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:only_pets/Screen/formButton.dart';
import 'package:only_pets/config/form_input.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/controller/LoginController.dart';
import 'package:only_pets/util/Color.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  var controller = Get.put(LoginController());

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.numberCtr.text = "";
    super.initState();
  }

  @override
  void dispose() {
    controller.numberCtr.text = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.primaryColor,
      body: Form(
        key: _formkey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: FadeInDown(
                  duration: Duration(milliseconds: 700),
                  child: Container(
                    height: 31.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "asset/hand-drawn-paw-prints-background_23-2151132904.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: FadeInUp(
                  duration: Duration(milliseconds: 700),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.w),
                          topRight: Radius.circular(10.w)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset(
                                  "asset/all pets/mylogo.png",
                                  height: 20.h,
                                  width: 45.w,
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 7.w),
                            child: Text(
                              "Log in!",
                              style: TextStyle(
                                  fontSize: 23.sp, fontFamily: "Alegreya"),
                            ),
                          ),
                          // SizedBox(
                          //   height: 2.h,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h, left: 7.w),
                            child: Text(
                              "Welcome to Only pets get started with us and begin the journey",
                              style: TextStyle(
                                fontFamily: "Alegreya",
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          FadeInDown(
                            child: AnimatedSize(
                              duration: Duration(milliseconds: 300),
                              child: Obx(() {
                                return getReactiveFormField(
                                    node: controller.numberNode,
                                    controller: controller.numberCtr,
                                    hintLabel: LoginConst.number,
                                    onChanged: (val) {
                                      controller.validatePhone(val);
                                    },
                                    obscuretext: false,
                                    inputType: TextInputType.number,
                                    errorText:
                                        controller.numberModel.value.error);
                              }),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 8.w,
                              right: 8.w,
                            ),
                            child: FadeInUp(
                              from: 50,
                              child: Obx(() {
                                return getSecondaryFormButton(() {
                                  if (controller.isFormInvalidate.value ==
                                      true) {
                                    controller.getSignIn(context,
                                        controller.numberCtr.text.toString());
                                  }
                                }, LoginConst.buttonLabel,
                                    isvalidate:
                                        controller.isFormInvalidate.value);
                              }),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       "Don't have an account?",
                          //       style: TextStyle(
                          //           fontSize: 20.sp, fontFamily: "Alegreya"),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) => SignupScreen(),
                          //             ));
                          //       },
                          //       child: Text(
                          //         " Sign up",
                          //         style: TextStyle(
                          //             fontSize: 20.sp,
                          //             fontFamily: "Alegreya",
                          //             color: CustomColors.primaryColor),
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
