import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/Screen/EditProfileScreen.dart';
import 'package:only_pets/util/Color.dart';

class checkoutscreen extends StatefulWidget {
  checkoutscreen(
      {this.shipinCharge,
      this.totaAmount,
      this.discount,
      this.isFromBuyNow,
      this.id,
      super.key});
  String? shipinCharge, totaAmount, discount;
  bool? isFromBuyNow;
  int? id;

  @override
  State<checkoutscreen> createState() => _checkoutscreenState();
}

final _formKey = GlobalKey<FormState>();

class _checkoutscreenState extends State<checkoutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.5.h),
                    child: FadeInDown(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        height: 4.h,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30.sp,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 29.w, top: 1.h),
                              child: Text(
                                "Checkout",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.sp,
                                    fontFamily: "Alegreya"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'First Name',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: "medium",
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      width: 44.5.w,
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontFamily: "medium",
                                          fontSize: 16.sp,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Frist Name';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 4.w),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7.w)),
                                          ),
                                          hintText: 'Frist Name',
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffc64d4c),
                                                width: 0.2.h),
                                            borderRadius:
                                                BorderRadius.circular(7.w),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Last Name',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: "medium",
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      width: 44.5.w,
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontFamily: "medium",
                                          fontSize: 16.sp,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Last Name';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 4.w),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7.w)),
                                          ),
                                          hintText: 'Last Name',
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffc64d4c),
                                                width: 0.2.h),
                                            borderRadius:
                                                BorderRadius.circular(7.w),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'Street Address',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 16.sp,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Street';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 4.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.w)),
                                  ),
                                  hintText: 'Street',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffc64d4c), width: 0.2.h),
                                    borderRadius: BorderRadius.circular(7.w),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'Town / City',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 16.sp,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Town / City';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 4.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.w)),
                                  ),
                                  hintText: 'Town / City',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffc64d4c), width: 0.2.h),
                                    borderRadius: BorderRadius.circular(7.w),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'Postcode',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 16.sp,
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Postcode';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 4.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.w)),
                                  ),
                                  hintText: 'Postcode',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffc64d4c), width: 0.2.h),
                                    borderRadius: BorderRadius.circular(7.w),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'Phone no',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 16.sp,
                                ),
                                maxLengthEnforcement: MaxLengthEnforcement.none,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  String pattern = r'^(?:[+0]9)?[0-9]{10}$';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value!.isEmpty) {
                                    return 'Please enter Phone no.';
                                  } else if (!regExp.hasMatch(value)) {
                                    return 'Please enter a valid Phone no.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 4.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.w)),
                                  ),
                                  hintText: 'Phone no.',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffc64d4c), width: 0.2.h),
                                    borderRadius: BorderRadius.circular(7.w),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'E-Mail',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 16.sp,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  String pattern =
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value!.isEmpty) {
                                    return 'Please enter Email';
                                  } else if (!regExp.hasMatch(value)) {
                                    return 'Please enter a valid Email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 4.w),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.w)),
                                  ),
                                  hintText: 'E-Mail',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffc64d4c), width: 0.2.h),
                                    borderRadius: BorderRadius.circular(7.w),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           EditProfileScreen(),
                                  //     ));
                                }
                              },
                              child: Container(
                                height: 5.7.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular((3.w)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      CustomColors.primaryColor,
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Save Details",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 6.h,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
