import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/Screen/HomeScreen.dart';
import 'package:only_pets/Screen/ResertPassword.dart';
import 'package:only_pets/Screen/SigninScreen.dart';
import 'package:only_pets/util/Color.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController email = TextEditingController();
  TextEditingController passwrod = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  var _isHidden;
  @override
  void initState() {
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
              Padding(
                padding: EdgeInsets.only(top: 20.h),
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
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 4.h, left: 7.w),
                              child: Text(
                                "Welcome Back!",
                                style: TextStyle(fontSize: 30.dp),
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
                              fontSize: 15.dp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.w, right: 6.w),
                          child: Container(
                            child: TextFormField(
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
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.w)),
                                ),
                                hintText: 'Email',
                              ),
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
                              controller: passwrod,
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
                                hintText: 'Passsword',
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
                          padding: EdgeInsets.only(right: 6.w),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => resertpassword(),
                                    ));
                              },
                              child: Text(
                                "Forget password?",
                                style: TextStyle(fontSize: 17.dp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 7.w,
                          ),
                          child: Container(
                            height: 5.5.h,
                            width: 87.w,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.w))),
                                    backgroundColor: Color(0xffc64d4c)),
                                onPressed: () {
                                  final isValid =
                                      _formkey.currentState!.validate();
                                  if (!isValid) {
                                    return;
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => homescreen(),
                                        ));
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog());
                                },
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 15.dp, color: Colors.white),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 18.dp,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => signinscreen(),
                                    ));
                              },
                              child: Text(
                                " Sign up",
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    color: CustomColors.maincolor),
                              ),
                            )
                          ],
                        ),
                      ],
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
