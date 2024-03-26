import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/Screen/EditProfileScreen.dart';
import 'package:only_pets/util/Color.dart';

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(
                    duration: Duration(milliseconds: 1800),
                    child: Container(
                      height: 3.h,
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Icon(
                                Icons.arrow_back,
                                size: 7.w,
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 22.dp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: double.infinity,
                height: 12.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 8.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(13.w)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(13.w),
                                child: Image.asset(
                                  'asset/hand-drawn-paw-prints-background_23-2151132904.jpg',
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 23.dp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ));
                        },
                            child: Row(
                              children: [
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      fontSize: 16.dp, color: Color(0xffc64d4c)),
                                ),
                                SizedBox(
                                  width: 0.5.w,
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Color(0xffc64d4c),
                                  size: 15.dp,
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Column(
                  children: [
                    Container(
                      height: 7.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.phone_circle_fill,
                                size: 30.dp, color: Color(0xffc64d4c)),
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mobile',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.dp,
                                        color: Color(0xffc64d4c)),
                                  ),
                                  Text(
                                    'User Mobile',
                                    style: TextStyle(
                                        fontSize: 15.dp, color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 2.w,
                      endIndent: 2.w,
                    ),
                    Container(
                      height: 7.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Row(
                          children: [
                            Icon(Icons.email,
                                size: 30.dp, color: Color(0xffc64d4c)),
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'E-Mail',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.dp,
                                        color: Color(0xffc64d4c)),
                                  ),
                                  Text(
                                    'User E-mail',
                                    style: TextStyle(
                                        fontSize: 15.dp, color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 2.w,
                      endIndent: 2.w,
                    ),
                    Container(
                      height: 7.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.gift_fill,
                                size: 30.dp, color: Color(0xffc64d4c)),
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Orders',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.dp,
                                        color: Color(0xffc64d4c)),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_right,
                                size: 35.dp, color: Color(0xffc64d4c))
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 2.w,
                      endIndent: 2.w,
                    ),
                    Container(
                      height: 7.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Row(
                          children: [
                            Icon(Icons.logout_outlined,
                                size: 30.dp, color: Color(0xffc64d4c)),
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign out',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.dp,
                                        color: Color(0xffc64d4c)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 2.w,
                      endIndent: 2.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
