import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:marquee/marquee.dart';
import 'package:only_pets/model/HomeModel..dart/Category/ViewCategoryModel.dart';

class ViewCategorys extends StatefulWidget {
  const ViewCategorys({super.key});

  @override
  State<ViewCategorys> createState() => _ViewCategorysState();
}

class _ViewCategorysState extends State<ViewCategorys> {
  @override
  // bool _isPasswordValid = false;
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 1200),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, top: 1.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 6.w,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, top: 1.h),
                    child: Text(
                      "Category Screen",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "Alegreya",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            FadeInRight(
              duration: Duration(
                milliseconds: 1200,
              ),
              child: FadeInRight(
                child: Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: viewCategorys.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final categoryName = viewCategorys[index].name;
                      final bool isLongText = categoryName.length > 15;
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 3.w, right: 2.w),
                            child: Container(
                              height: 11.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.w)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 0.3.w,
                                      // spreadRadius: 0.1.w
                                    ),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.all(0.5.w),
                                child: CircleAvatar(
                                  // radius: 8.w,s
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                    viewCategorys[index].image,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          isLongText
                              ? Container(
                                  height: 3.h,
                                  child: Marquee(
                                    text: categoryName,
                                    // scrollAxis: Axis.horizontal,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    blankSpace: 10.0,
                                    // velocity: 100.0,
                                    pauseAfterRound: Duration(milliseconds: 1),
                                    showFadingOnlyWhenScrolling: true,
                                    fadingEdgeStartFraction: 0.1,
                                    fadingEdgeEndFraction: 0.1,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: "Alegreya",
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              : Text(
                                  categoryName,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: "medium",
                                      fontWeight: FontWeight.w600),
                                ),
                        ],
                      );
                    },
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
