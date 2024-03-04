import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/HomeModel..dart/BrandModel.dart';
import 'package:only_pets/model/HomeModel..dart/DogsCategoryList.dart';
import 'package:only_pets/util/Color.dart';

class DogsCategoryScreen extends StatefulWidget {
  const DogsCategoryScreen({super.key});

  @override
  State<DogsCategoryScreen> createState() => _DogsCategoryScreenState();
}

var currentIndex = 0;
var currentIndex2 = 0;

class _DogsCategoryScreenState extends State<DogsCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 3.5.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ),
                Center(
                  child: CarouselSlider(
                    items: datas.map((data) {
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
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
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
                      datas.length, (index) => buildDot(index, context)),
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
                style: TextStyle(fontSize: 25.dp, fontWeight: FontWeight.w400),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                  child: Container(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, mainAxisExtent: 21.h),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 1.w, left: 1.w),
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
                                            datas2[index].gradientStartColor,
                                            datas2[index].gradientEndColor,
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.w)),
                                    child: Image.asset(
                                      "asset/Foodpic.jpg",
                                    ),
                                  ),
                                  Text(
                                    datas2[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13.dp),
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
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                child: Container(
                  height: 20.h,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: datas3.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 21.h,
                        crossAxisSpacing: 3.w),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            height: 15.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.w),
                                  topRight: Radius.circular(20.w),
                                ),
                                color: Color(0xffe3efff)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.w),
                                  topRight: Radius.circular(20.w)),
                              child: Image.asset(
                                datas3[index].image,
                                height: 2.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: Container(
                              height: 3.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2.w),
                                    topRight: Radius.circular(2.w),
                                  ),
                                  color: Color(0xff32b5eb)),
                              child: Center(
                                child: Text(
                                  datas3[index].title,
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
                child: CarouselSlider(
                  items: datas4.map((data) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              height: 5.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.w),
                                color: data.color,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.w),
                                          bottomLeft: Radius.circular(4.w)),
                                      child: Image.asset(data.image)),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.title,
                                        style: TextStyle(
                                          fontSize: 17.dp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        height: 2.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.w),
                                            color: Colors.white),
                                        child: Text(
                                          data.title2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ));
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex2 = index;
                      });
                    },
                    height: 9.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      datas4.length, (index) => buildDot2(index, context)),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "Shop by Breed",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 16.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: datas5.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 15.h,
                      crossAxisSpacing: 2.w),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 13.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.w),
                            color: Color(0xff3abfac),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(13.w),
                              child: Image.asset(
                                datas5[index].image,
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          datas5[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13.dp, fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  },
                ),
              ),
              Stack(children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                  child: Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfff27597),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w, top: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gentel care for all the",
                              style: TextStyle(
                                  fontSize: 21.dp, color: Colors.white)),
                          Text("VIPs(VERY IMPORTANT POOCHES)",
                              style: TextStyle(
                                  fontSize: 22.dp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                          // Image.asset(""),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            height: 2.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Text("Book Now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13.dp, color: Color(0xfff27597))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "Shop by brands",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 20.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  //  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, mainAxisExtent: 21.h),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 3.w, left: 3.w),
                          child: Container(
                            height: 18.h,
                            width: 42.w,
                            decoration: BoxDecoration(
                                // color: Color(0xfff0edeb),
                                // color: Colors.deepOrange.shade400,
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    // Colors.brown.shade300,
                                    Colors.black.withOpacity(0.6),
                                    CustomColors.maincolor,
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.w),
                                  topRight: Radius.circular(20.w),
                                )),
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14.w),
                                      topRight: Radius.circular(14.w),
                                      bottomLeft: Radius.circular(3.w),
                                      bottomRight: Radius.circular(3.w),
                                    )),
                                child: Container(
                                  child: Image.asset(Brandname[index].image),
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
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find everything your\npet could dream of! 🐶",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 7.w,
                          color: Color(0xffc3c3c3),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 15.h,
                width: double.infinity,
                color: Color(0xff22409a),
              )
            ],
          ),
        ),
      ),
    );
  }

// frist
  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 1.h,
      width: currentIndex == index ? 6.w : 3.w,
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
