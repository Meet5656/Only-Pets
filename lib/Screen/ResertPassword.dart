import 'package:animate_do/animate_do.dart';
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
                    height: 20.h,
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
                              padding: EdgeInsets.only(left: 6.w, top: 0.3.h),
                              child: Text(
                                "Entera new password",
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Alegreya"),
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
                                style: TextStyle(
                                    fontFamily: "medium", fontSize: 17.dp),
                                obscureText: confirmpassword,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 4.w, horizontal: 5.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.w)),
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
                                style: TextStyle(
                                    fontFamily: "medium", fontSize: 17.dp),
                                obscureText: _isHidden,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 4.w, horizontal: 5.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.w)),
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
                                    CustomColors.primaryColor,
                                    Colors.black.withOpacity(0.6),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "CHANGE PASSWORD",
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
