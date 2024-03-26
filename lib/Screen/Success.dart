import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/util/Color.dart';

class sucess extends StatefulWidget {
  const sucess({super.key});

  @override
  State<sucess> createState() => _sucessState();
}

class _sucessState extends State<sucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h, left: 3.w),
            child: Image.asset(
              "asset/all pets/success.gif",
              height: 15.h,
              width: 60.w,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              "Your Payment was done Successfully",
              style: TextStyle(fontSize: 19.dp, fontFamily: "medium"),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.5.w),
            child: Container(
              height: 5.5.h,
              width: 87.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.w),
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
                  "OK",
                  style: TextStyle(
                      fontSize: 18.dp,
                      color: Colors.white,
                      fontFamily: "medium"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
