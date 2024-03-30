import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/model/HomeModel..dart/CatsCategoryLIst.dart';
import 'package:only_pets/util/Color.dart';

class CatsCategoryScreen extends StatefulWidget {
  const CatsCategoryScreen({super.key});

  @override
  State<CatsCategoryScreen> createState() => _CatsCategoryScreenState();
}

var currentIndex = 0;
var currentIndex2 = 0;

class _CatsCategoryScreenState extends State<CatsCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.5.w, top: 0.5.h),
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
                            padding: EdgeInsets.only(left: 24.w,top: 1.h),
                            child: Text(
                              "Cat Category",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22.sp,fontFamily: "Alegreya"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(children: [
                      Center(
                        child: CarouselSlider(
                          items: datas6.map((data) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      data.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            height: 30.h,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            datas6.length, (index) => buildDot(index, context)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 6.w,
                      endIndent: 6.w,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Shop by Category",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w400,fontFamily: "medium"),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                        child: Container(
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: datas7.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisExtent: 21.h,
                                    crossAxisSpacing: 1.w),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 1.w, left: 1.w),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 15.h,
                                          width: 42.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.center,
                                                colors: [
                                                  datas7[index]
                                                      .gradientStartColor,
                                                  datas7[index]
                                                      .gradientEndColor,
                                                ],
                                              ),
                                              border: Border.all(
                                                  width: 0.1.w,
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(6.5.w)),
                                          child: Image.asset(
                                            datas7[index].image,
                                          ),
                                        ),
                                        Text(
                                          datas7[index].title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,fontFamily: "medium"),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 6.w,
                      endIndent: 6.w,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Shop by Life Stage",
                      style:
                          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w400,fontFamily: "medium"),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.5.w, right: 4.5.w),
                      child: Container(
                        height: 25.h,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: datas8.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 21.h,
                                  crossAxisSpacing: 4.w),
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  height: 40.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.w),
                                        topRight: Radius.circular(20.w),
                                      ),
                                      color: Color(0xffffe7c7)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.w),
                                        topRight: Radius.circular(20.w)),
                                    child: Image.asset(
                                      datas8[index].image,
                                      height: 1.h,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 18.h),
                                  child: Container(
                                    height: 3.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(2.w),
                                          topRight: Radius.circular(2.w),
                                        ),
                                        color: Color(0xffacddde)),
                                    child: Center(
                                      child: Text(
                                        datas8[index].title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,fontFamily: "medium"),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: Container(
                        height: 14.h,
                        color: Colors.white,
                        child: CarouselSlider(
                          items: datas9.map((data) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  height: 12.h,
                                  child: Stack(children: [
                                    Positioned(
                                      top: 3.5.h,
                                      child: Container(
                                          height: 8.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // margin:
                                          //  EdgeInsets.symmetric(horizontal: 1.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.w),
                                              color: data.color,
                                            ),
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        data.title,
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white,fontFamily: "medium"),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Container(
                                                        height: 1.5.h,
                                                        width: 25.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.w),
                                                            color:
                                                                Colors.white),
                                                        child: Center(
                                                          child: Text(
                                                            data.title2,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 10.sp,fontFamily: "medium"),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Positioned(
                                      left: 52.w,
                                      top: 0,
                                      child: Container(
                                          height: 15.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.w)),
                                          child: Image.asset(
                                            data.image,
                                            height: 50.h,
                                          )),
                                    )
                                  ]),
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex2 = index;
                              });
                            },
                            height: 14.h,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            // autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(datas9.length,
                            (index) => buildDot2(index, context)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 6.w,
                      endIndent: 6.w,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Shop by Breed",
                      style:
                          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w400,fontFamily: "medium"),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 15.h,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: datas10.length,
                        itemBuilder: (context, index) {
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
                                        spreadRadius: 0.1.w,
                                        blurRadius: 0.4.w,
                                        offset: Offset(0, 1.3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(0.5.w),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                        datas10[index].image,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(datas10[index].title,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "medium",)),
                            ],
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 6.w,
                      endIndent: 6.w,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Shop by brands",
                      style:
                          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w400,fontFamily: "medium"),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 22.h,
                      child: GridView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: datas11.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisExtent: 21.h),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 3.w,
                                  left: 3.w,
                                ),
                                child: Container(
                                  height: 18.h,
                                  width: 42.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.w),
                                      topRight: Radius.circular(20.w),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: Container(
                                      height: 18.h,
                                      width: 42.w,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Colors.black.withOpacity(0.8),
                                              CustomColors.primaryColor,
                                              // CustomColors.maincolor,
                                            ],
                                          ),
                                          color:
                                              Color.fromARGB(255, 42, 41, 41),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.w),
                                            topRight: Radius.circular(20.w),
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 1.5.h,
                                            right: 3.w,
                                            left: 3.w,
                                            bottom: 3.h),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(18.w),
                                                topRight: Radius.circular(18.w),
                                                bottomLeft:
                                                    Radius.circular(6.w),
                                                bottomRight:
                                                    Radius.circular(6.w),
                                              )),
                                          child: Padding(
                                            padding: EdgeInsets.all(1.h),
                                            child: Image.asset(
                                                datas11[index].image),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Build your new pet's\nForever home! 🐱",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 25.sp,
                                color: Color(0xffc3c3c3),
                                fontWeight: FontWeight.w600,fontFamily: "medium"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 25.h,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 15.h,
                              width: double.infinity,
                              color: Color(0xffb3b1ad),
                            ),
                          ),
                          Positioned(
                            left: 5.w,
                            child: Container(
                                height: 25.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.w)),
                                child: Image.asset(
                                  'asset/Cat_Category_pic/catwithfood_pic.png',
                                  height: 15.h,
                                )),
                          ),
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
    );
  }

  // frist
  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: currentIndex == index ? 0.8.h : 0.5.h,
      width: currentIndex == index ? 1.5.w : 1.w,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? Color(0xffc64d4c) : Color(0xffF9DDDE)),
    );
  }

  //second
  Widget buildDot2(int index, BuildContext context) {
    return Container(
      height: currentIndex2 == index ? 0.8.h : 0.5.h,
      width: currentIndex2 == index ? 1.5.w : 1.w,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              currentIndex2 == index ? Color(0xff9daec3) : Color(0xffF9DDDE)),
    );
  }
}
