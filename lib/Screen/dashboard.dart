import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/Screen/SearchScreen.dart';
import 'package:only_pets/Screen/ViewCategorys.dart';
import 'package:only_pets/model/HomeBanner.dart';
import 'package:only_pets/model/HomeModel..dart/BrandModel.dart';
import 'package:only_pets/model/HomeModel..dart/HomeModel1.dart';
import 'package:only_pets/model/HomeModel..dart/TrendingModel.dart';
import 'package:only_pets/util/Color.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int activeindex = 0;
  //size
  int SizeIndex = 0;
  //build dot page
  int currentpage = 0;
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 5.h,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Image.asset(
                      "asset/all pets/avatarman.png",
                      height: 4.5.h,
                      // "asset/all pets/company_logo.png",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w),
                    child: Text(
                      "HomeScreen",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 22.dp),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: searchscreen());
                    },
                    child: Icon(
                      CupertinoIcons.search,
                      size: 6.w,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 3.w),
                    child: Icon(
                      CupertinoIcons.cart,
                      size: 6.w,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    FadeInRight(
                      duration: Duration(milliseconds: 1800),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            "Hi Meet",
                            style: TextStyle(
                              fontSize: 25.dp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeInRight(
                      duration: Duration(milliseconds: 1800),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            "Good Morning!",
                            style: TextStyle(
                                fontSize: 28.dp, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 2.h,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider.builder(
                            itemCount: banner.length,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                //  color: Colors.green,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.w)),
                                  child: Image.asset(
                                    banner[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 18.h,
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeindex = index;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(banner.length,
                                  (index) => buildDot(index, context)),
                            ),
                          ),
                          // FadeInUp(
                          //   child: AnimatedSmoothIndicator(
                          //     activeIndex: activeindex,
                          //     count: banner.length,
                          //     effect: ExpandingDotsEffect(
                          //         dotHeight: 1.6.h,
                          //         dotWidth: 3.5.w,

                          //         // strokeWidth: 1.h,
                          //         activeDotColor: Colors.brown,
                          //         dotColor: Colors.black12),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInRight(
                          duration: Duration(milliseconds: 1800),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 3.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ))),
                                child: Text(
                                  "Categorys",
                                  style: TextStyle(
                                    fontSize: 25.dp,
                                    fontWeight: FontWeight.w400,
                                    //  decorationThickness: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        FadeInRight(
                          child: Padding(
                            padding: EdgeInsets.only(right: 1.w),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewCategorys(),
                                    ));
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FadeInDown(
                      duration: Duration(
                        milliseconds: 1800,
                      ),
                      child: Container(
                        height: 16.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: face.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 3.w, right: 2.w),
                                  child: CircleAvatar(
                                    radius: 11.w,
                                    backgroundImage: AssetImage(
                                      face[index].image,
                                    ),
                                  ),
                                ),
                                Text(face[index].name,
                                    style: TextStyle(fontSize: 20.dp)),
                              ],
                            );
                          },
                        ),
                      ),
                      // child: GridView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: face.length,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 3),
                      //   itemBuilder: (context, index) {
                      //     return Column(
                      //       children: [
                      //         CircleAvatar(
                      //           radius: 11.w,
                      //           backgroundImage: AssetImage(
                      //             face[index].image,
                      //           ),
                      //         ),
                      //         Text(face[index].name,
                      //             style: TextStyle(fontSize: 20.dp)),
                      //       ],
                      //     );
                      //   },
                      // ),
                    ),
                    FadeInRight(
                      duration: Duration(milliseconds: 1800),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ))),
                                child: Text(
                                  "Trending ",
                                  style: TextStyle(
                                    fontSize: 25.dp,
                                    fontWeight: FontWeight.w400,
                                    //  decorationThickness: 2.0,
                                  ),
                                ),
                              ),
                              FadeInRight(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 1.w),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewCategorys(),
                                          ));
                                    },
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                          fontSize: 18.dp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 35.h,
                      child: FadeInUpBig(
                        duration: Duration(milliseconds: 1800),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: Trending.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 3.w,
                                    right: 3.w,
                                    top: 2.h,
                                  ),
                                  child: Container(
                                    height: 32.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.w)),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.w))),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3.w),
                                                topRight: Radius.circular(3.w)),
                                            child: Image.asset(
                                              Trending[index].image,
                                              height: 18.3.h,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Text(
                                            Trending[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.dp),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 1.w),
                                                child: Text(
                                                  Trending[index].Prise,
                                                  style: TextStyle(
                                                      fontSize: 20.dp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 0.1.h),
                                              child: Icon(
                                                CupertinoIcons.star_fill,
                                                size: 4.w,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 0.5.w,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 1.5.w),
                                              child: Text(
                                                Trending[index].Rate,
                                                style:
                                                    TextStyle(fontSize: 16.dp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 0.7.h),
                                              child: Container(
                                                height: 3.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    color: CustomColors
                                                        .maincolor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                1.w))),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 0.7.w),
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    "Add Cart",
                                                    style: TextStyle(
                                                        fontSize: 15.dp,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    FadeInRight(
                      duration: Duration(milliseconds: 1800),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ))),
                            child: Text(
                              "Brand",
                              style: TextStyle(
                                fontSize: 25.dp,
                                fontWeight: FontWeight.w400,
                                //  decorationThickness: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // Container(
                    //   height: 35.h,
                    //   child: FadeInUpBig(
                    //     duration: Duration(milliseconds: 1800),
                    //     child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       // physics: NeverScrollableScrollPhysics(),
                    //       itemCount: 5,
                    //       itemBuilder: (context, index) {
                    //         return Column(
                    //           children: [
                    //            Padding(
                    //              padding: EdgeInsets.only(right: 3.w,left: 3.w),
                    //              child: Container(
                    //              height: 15.h,
                    //              width: 30.w,
                    //              color: Color(0xfff0edeb),
                    //              ),
                    //            ),
                    //           ],
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 50.h,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 21.h),
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
                                      color: CustomColors.maincolor,
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
                                        child:
                                            Image.asset(Brandname[index].image),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildDot(int index, BuildContext context) {
    return Container(
      height: 1.5.h,
      width: activeindex == index ? 6.w : 3.w,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: activeindex == index
              ? CustomColors.maincolor
              : Color(0xffF9DDDE)),
    );
  }
}
