import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/DetailScreenSizeModel.dart';
import 'package:only_pets/model/HomeModel..dart/Treading/ViewTrendingModel.dart';
import 'package:only_pets/util/Color.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class detailscreen extends StatefulWidget {
  detailscreen({super.key, required this.userdata});
  ViewTrendingModel? userdata;

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  int activeindex = 0;
  int _counter = 1; // Initialize counter variable
  int currentindex = 0;
  late PageController controller;
  Timer? timer;

  void initState() {
    controller = PageController(initialPage: 0);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }

  void startTimer() {
    // Change page every 3 seconds
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (activeindex < widget.userdata!.image.length - 1) {
        activeindex++;
      } else {
        activeindex = 0;
      }
      controller.animateToPage(
        activeindex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 1200),
              child: Column(
                children: [
                  Row(
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
                        padding: EdgeInsets.only(left: 27.5.w, top: 1.h),
                        child: Text(
                          "Detail Screen",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22.dp,
                              fontFamily: "Alegreya"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: widget.userdata!.image.length,
                      itemBuilder: (context, index, realIndex) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                          child: Image.asset(
                            widget.userdata!.image[index],
                            fit: BoxFit.cover,
                            // width: 80.w,
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        viewportFraction: 0.7,
                        height: 30.h,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeindex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h),
                          child: Container(
                            child: FadeInRight(
                              duration: Duration(milliseconds: 1200),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    widget.userdata!.image.length,
                                    (index) => buildDot(index, context)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    FadeInLeft(
                      duration: Duration(milliseconds: 1200),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              itemSize: 5.w,
                              initialRating: 1,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.3.w),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 2.w,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0.5.w),
                              child: Text(
                                widget.userdata!.Rate,
                                style: TextStyle(
                                    fontSize: 19.dp, fontFamily: "medium"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 47.w),
                              child: Container(
                                height: 5.h,
                                width: 10.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      // offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.red,
                                      size: 6.w,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeInLeft(
                      duration: Duration(milliseconds: 1200),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.userdata!.name,
                            style: TextStyle(
                                fontSize: 20.dp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "medium"),
                          ),
                        ),
                      ),
                    ),
                    FadeInLeft(
                      duration: Duration(milliseconds: 1200),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: Text(
                              "MRP :",
                              style: TextStyle(
                                  fontSize: 19.dp,
                                  fontFamily: "medium",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.w),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.userdata!.Prise,
                                  style: TextStyle(
                                      fontSize: 30.dp,
                                      color: Colors.red,
                                      fontFamily: "Alegreya"),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    FadeInLeft(
                      duration: Duration(milliseconds: 1200),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            "Select Size :",
                            style: TextStyle(
                                fontSize: 19.dp,
                                fontFamily: "medium",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    FadeInRight(
                      duration: Duration(milliseconds: 1200),
                      child: Container(
                        height: 10.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectsize.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 4.w),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentindex = index;
                                      });
                                    },
                                    child: Container(
                                      height: 8.5.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        color: currentindex == index
                                            ? Colors.blue.withOpacity(0.2)
                                            : Colors.white,
                                        border: Border.all(width: 0.4.w),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.w)),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            selectsize[index].size,
                                            style: TextStyle(
                                                fontSize: 20.dp,
                                                fontFamily: "medium"),
                                          ),
                                          SizedBox(
                                            height: 0.4.h,
                                          ),
                                          Text(
                                            selectsize[index].prise,
                                            style: TextStyle(
                                                fontSize: 20.dp,
                                                color: Colors.red,
                                                fontFamily: "medium"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    FadeInLeft(
                      duration: Duration(milliseconds: 1200),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            "Descripitions :",
                            style: TextStyle(
                                fontSize: 19.dp,
                                fontFamily: "medium",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    FadeInLeft(
                      duration: Duration(milliseconds: 1200),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: ReadMoreText(
                          widget.userdata!.des,
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          lessStyle: TextStyle(
                              fontSize: 19.dp,
                              fontFamily: "medium",
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                          moreStyle: TextStyle(
                              fontSize: 19.dp,
                              fontFamily: "medium",
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                          style: TextStyle(
                              fontSize: 19.dp,
                              fontFamily: "medium",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: FadeInUp(
        duration: Duration(milliseconds: 1200),
        child: Container(
          height: 9.5.h,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
            ),
          ]),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Container(
                  height: 5.5.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.w)),
                      border: Border.all(
                        width: 0.w,
                        color: Colors.black,
                      )),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: InkWell(
                          onTap: () {
                            _decrementCounter();
                          },
                          child: Container(
                            height: 4.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.dp))),
                            child: Icon(
                              CupertinoIcons.minus,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "$_counter",
                        style: TextStyle(fontSize: 20.dp, color: Colors.black),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 1.w),
                        child: InkWell(
                          onTap: () {
                            _incrementCounter();
                          },
                          child: Container(
                            height: 4.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.dp))),
                            child: Icon(
                              CupertinoIcons.add,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Container(
                  height: 6.h,
                  width: 24.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          // Colors.brown.shade300,
                          Colors.black.withOpacity(0.6),
                          CustomColors.primaryColor,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.dp))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ADD TO CART",
                        style: TextStyle(color: Colors.white, fontSize: 18.dp),
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      Icon(
                        CupertinoIcons.bag,
                        size: 5.w,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildDot(int index, BuildContext context) {
    return Container(
      height: 1.2.h,
      width: activeindex == index ? 4.3.w : 2.5.w,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: activeindex == index
            ? Border.all(
                color: Colors.black,
              )
            : Border.all(
                color: Colors.black,
              ),
        color: activeindex == index ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class Data {
  final String image;
  final String name;
  Data({required this.image, required this.name});
}
