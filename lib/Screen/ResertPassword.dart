import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/Screen/OtpScreen.dart';
import 'package:only_pets/util/Color.dart';

class resertpassword extends StatefulWidget {
  const resertpassword({super.key});

  @override
  State<resertpassword> createState() => _resertpasswordState();
}

class _resertpasswordState extends State<resertpassword> {
  final _formkey = GlobalKey<FormState>();
  var _isHidden;
  var confirmpassword;
  void initState() {
    confirmpassword = true;
    _isHidden = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: CustomColors.maincolor,
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                      "asset/hand-drawn-paw-prints-background_23-2151132904.jpg",
                      fit: BoxFit.cover),
                )),
            Expanded(
              flex: 8,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
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
                          "asset/all pets/7070629_3293465.jpg",
                          width: 35.h,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Container(
                              child: Text(
                                "Reset Password",
                                style: TextStyle(
                                    fontSize: 23.dp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 6.w, top: 0.3.h),
                            child: Text(
                              "Entera new password",
                              style: TextStyle(
                                  fontSize: 16.dp, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: Container(
                            child: TextFormField(
                              obscureText: confirmpassword,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.w)),
                                ),
                                suffixIcon: IconButton(
                                  icon: confirmpassword
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      confirmpassword = !confirmpassword;
                                    });
                                  },
                                ),
                                hintText: 'New Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter New Password";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: Container(
                            child: TextFormField(
                              obscureText: _isHidden,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.w)),
                                ),
                                suffixIcon: IconButton(
                                  icon: _isHidden
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isHidden = !_isHidden;
                                    });
                                  },
                                ),
                                hintText: 'Confirm Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter New Password";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        // Container(
                        //   height: 5.5.h,
                        //   width: 87.w,
                        //   child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.all(
                        //                   Radius.circular(2.w))),
                        //           backgroundColor: Color(0xffc64d4c)),
                        //       onPressed: () {
                        //         final isValid =
                        //             _formkey.currentState!.validate();
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) => otpscreen(),
                        //             ));
                        //       },
                        //       child: Text(
                        //         "CHANGE PASSWORD",
                        //         style: TextStyle(
                        //             fontSize: 15.dp, color: Colors.white),
                        //       )),
                        // ),
                        InkWell(
                          onTap: () {
                            final isValid = _formkey.currentState!.validate();
                            if (!isValid) {
                              return;
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => otpscreen(),
                                  ));
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
                                  CustomColors.maincolor,
                                  Colors.black.withOpacity(0.6),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "CHANGE PASSWORD",
                                style: TextStyle(
                                    fontSize: 15.dp, color: Colors.white),
                              ),
                            ),
                          ),
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
    );
  }
}
