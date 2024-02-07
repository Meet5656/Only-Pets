import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(right: 3.w, left: 3.w, top: 1.h),
        child: Container(
          child: Column(
            children: [
              AppBar(
                leading: Image.asset(
                  "asset/all pets/avatarman.jpg",
                ),
                centerTitle: true,
                title: Text("Meet"),
                actions: [
                  Icon(
                    Icons.search,
                    size: 7.w,
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:EdgeInsets.only(left: 3 .w),
                  child: Text(
                    "Hi Meet",
                    style:
                        TextStyle(fontSize: 25.dp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
               Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:EdgeInsets.only(left: 3.w),
                  child: Text(
                    "Good Morning!",
                    style:
                        TextStyle(fontSize: 28.dp, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    ));
  }
}
