import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/HomeModel..dart/RabbitCategoryList.dart';
import 'package:only_pets/util/Color.dart';

class RabbitCategoryScreen extends StatefulWidget {
  const RabbitCategoryScreen({super.key});

  @override
  State<RabbitCategoryScreen> createState() => _RabbitCategoryScreenState();
}

class _RabbitCategoryScreenState extends State<RabbitCategoryScreen> {
  var currentIndex = 0;
  var currentIndex2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                FadeInDown(
                  duration: Duration(milliseconds: 1800),
                  child: Container(
                    height: 3.h,
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Icon(
                              Icons.arrow_back,
                              size: 7.w,
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 25.5.w),
                          child: Text(
                            "ONLYPETS",
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
              height: 2.h,
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
                          items: datas12.map((data) {
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
                        children: List.generate(datas12.length,
                            (index) => buildDot(index, context)),
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
                          fontSize: 25.dp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                        child: Container(
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
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
                                                  datas13[index]
                                                      .gradientStartColor,
                                                  datas13[index]
                                                      .gradientEndColor,
                                                ],
                                              ),
                                              border: Border.all(
                                                  width: 0.1.w,
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(6.5.w)),
                                          child: Image.asset(
                                            datas13[index].image,
                                          ),
                                        ),
                                        Text(
                                          datas13[index].title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15.dp,
                                              fontWeight: FontWeight.w500),
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
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      child: Container(
                        height: 25.h,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: datas14.length,
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
                                        topLeft: Radius.circular(15.w),
                                        topRight: Radius.circular(15.w),
                                      ),
                                      // border: Border.all(
                                      //     width: 0.0.w, color: Colors.grey),
                                      color: Color(0xffaba4aa)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.w),
                                        topRight: Radius.circular(20.w)),
                                    child: Image.asset(
                                      datas14[index].image,
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
                                        color: Color(0xff353a3a)),
                                    child: Center(
                                      child: Text(
                                        datas14[index].title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.dp,
                                            fontWeight: FontWeight.w600),
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
                          items: datas15.map((data) {
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
                                                            fontSize: 15.dp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
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
                                                                fontSize: 2.w),
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
                                      left: 45.w,
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
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(datas15.length,
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
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 15.h,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: datas16.length,
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
                                        datas16[index].image,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(datas16[index].title,
                                  style: TextStyle(
                                      fontSize: 13.dp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "medium")),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
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
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        height: 20.h,
                        child: GridView.builder(
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: datas17.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                    height: 15.h,
                                    width: 42.w,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Colors.black.withOpacity(0.8),
                                            CustomColors.primaryColor,
                                          ],
                                        ),
                                        color: Color.fromARGB(255, 42, 41, 41),
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
                                              bottomLeft: Radius.circular(6.w),
                                              bottomRight: Radius.circular(6.w),
                                            )),
                                        child: Image.asset(
                                          datas17[index].image,
                                          //fit: BoxFit.cover,
                                          height: 1.h,
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rabbits are tiny and furry animals\npopularly known as bunnies! 🐰",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 5.5.w,
                                color: Color(0xffc3c3c3),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
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
                              color: Color(0xffa5ffd6),
                            ),
                          ),
                          Positioned(
                            left: 15.w,
                            bottom: 4.5.h,
                            child: Container(
                                height: 25.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.w)),
                                child: Image.asset(
                                  'asset/Rabbit_Category_pic/rabbit_with_food.png',
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
