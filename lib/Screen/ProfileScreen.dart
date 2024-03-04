import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Color(0xffc64d4c),
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'asset/hand-drawn-paw-prints-background_23-2151132904.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 25.h,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.h),
                    topRight: Radius.circular(2.h)),
                color: Colors.white),
            child: Padding(
              padding:  EdgeInsets.only(top: 7.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "User Name",
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.5.w, right: 7.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 3.h,
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery address",
                                  style: TextStyle(
                                      fontSize: 5.w, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "User Data",
                                  style: TextStyle(
                                      fontSize: 3.5.w,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 2.8.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.5.w, right: 7.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.payment_outlined,
                            size: 3.h,
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Method",
                                  style: TextStyle(
                                      fontSize: 5.w, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "User Data",
                                  style: TextStyle(
                                      fontSize: 3.5.w,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 2.8.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.5.w, right: 7.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.language_sharp,
                            size: 3.h,
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Language",
                                  style: TextStyle(
                                      fontSize: 5.w, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "User Data",
                                  style: TextStyle(
                                      fontSize: 3.5.w,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 2.8.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.5.w, right: 7.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            size: 3.h,
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Text(
                            "Notification",
                            style: TextStyle(
                                fontSize: 5.w, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 2.8.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.5.w, right: 7.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            size: 3.h,
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Promo",
                                  style: TextStyle(
                                      fontSize: 5.w, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "User Data",
                                  style: TextStyle(
                                      fontSize: 3.5.w,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffffca61)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.5.w, right: 7.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.list_alt_outlined,
                            size: 3.h,
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Text(
                            "Terms and coditions",
                            style: TextStyle(
                                fontSize: 5.w, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.5.w, right: 7.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.security_update_warning,
                            size: 3.h,
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Text(
                            "About app",
                            style: TextStyle(
                                fontSize: 5.w, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top: 19.h,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            child: Center(
              child: Container(
                height: 12.h,
                width: 25.5.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.h)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.h) ,
                      child: Image.asset('asset/Logopic.png',fit: BoxFit.cover,)),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
