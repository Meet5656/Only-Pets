import 'dart:ffi';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_pets/Screen/LoginScreen.dart';
import 'package:sizer/sizer.dart';

import '../util/Color.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final double profileHeight = 144;
  Uint8? _image;
  File? selectedImage;
  final _formkey = GlobalKey<FormState>();

  // male and female

  String _selectedGender = 'Male';
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
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: FadeInDown(
                  duration: Duration(milliseconds: 700),
                  child: Container(
                    height: 20.h,
                    width: double.infinity,
                    child: Image.asset(
                      "asset/hand-drawn-paw-prints-background_23-2151132904.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
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
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(children: [
                                selectedImage != null
                                    ? CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        radius: profileHeight / 2,
                                        child: CircleAvatar(
                                          radius: profileHeight / 2 - 5,
                                          backgroundImage: Image.file(
                                            selectedImage!,
                                            fit: BoxFit.cover,
                                          ).image,
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        radius: profileHeight / 2,
                                        child: CircleAvatar(
                                          radius: profileHeight / 2 - 5,
                                          backgroundImage: Image.asset(
                                                  'asset/all pets/avatarman.png')
                                              .image,
                                        ),
                                      ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 23.w, top: 8.5.h),
                                  child: Container(
                                      height: 3.h,
                                      width: 6.5.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xffc64d4c),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: IconButton(
                                          onPressed: () {
                                            // shwoImagePickerOption(context);
                                          },
                                          icon: Center(
                                            child: Icon(
                                              Icons.edit,
                                              size: 3.5.w,
                                              color: Colors.white,
                                            ),
                                          ))),
                                ),
                              ]),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 2.h, left: 7.w),
                                child: Text(
                                  "SIGN UP!",
                                  style: TextStyle(
                                      fontSize: 20.sp, fontFamily: "Alegreya"),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h, left: 7.w),
                            child: Text(
                              "Welcome to Only pets get started with us and begin the journey",
                              style: TextStyle(
                                fontFamily: "Alegreya",
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.w, right: 6.w),
                            child: Container(
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "medium", fontSize: 12.sp),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 4.w, horizontal: 5.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.w)),
                                  ),
                                  hintText: 'Email',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Email id";
                                  }
                                  bool isValid = RegExp(
                                          r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                      .hasMatch(value);

                                  if (!isValid) {
                                    return 'Enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.w, right: 6.w),
                            child: Container(
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "medium", fontSize: 12.sp),
                                // obscureText: _isHidden,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 4.w, horizontal: 5.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.w)),
                                  ),
                                  // suffixIcon: IconButton(
                                  //   icon: _isHidden
                                  //       ? Icon(Icons.visibility)
                                  //       : Icon(Icons.visibility_off),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _isHidden = !_isHidden;
                                  //     }
                                  //   );
                                  //   },
                                  // ),
                                  hintText: 'Number',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Password";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 'Male',
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    _selectedGender == value;
                                    setState(() {});
                                  },
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 14.sp, fontFamily: "medium"),
                                ),
                                Radio(
                                  value: 'Female',
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    _selectedGender == value;
                                    setState(() {});
                                  },
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 14.sp, fontFamily: "medium"),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 4.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 7.w,
                            ),
                            child: InkWell(
                              onTap: () {
                                final isValid =
                                    _formkey.currentState!.validate();
                                if (!isValid) {
                                  return;
                                } else {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => DashboardScreen(),
                                  //     )
                                  //   );
                                }
                              },
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
                                      CustomColors.primaryColor,
                                      Colors.black.withOpacity(0.6),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.white,
                                        fontFamily: "Alegreya"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "have an account?",
                                style: TextStyle(
                                    fontSize: 15.sp, fontFamily: "Alegreya"),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => loginscreen(),));
                                },
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: "Alegreya",
                                      color: CustomColors.primaryColor),
                                ),
                              )
                            ],
                          ),
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
