import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/CartScreen/CartScreen.dart';
import 'package:only_pets/Screen/DetailScreen.dart';
import 'package:only_pets/Screen/SearchScreen.dart';
import 'package:only_pets/Screen/ToysScreen.dart';
import 'package:only_pets/Screen/ViewCategorys.dart';
import 'package:only_pets/Screen/ViewClothesBrand.dart';
import 'package:only_pets/Screen/ViewFoodBrand.dart';
import 'package:only_pets/Screen/ViewPetsFood.dart';
import 'package:only_pets/Screen/ViewTrending.dart';
import 'package:only_pets/controller/HomeScreenController.dart';
import 'package:only_pets/model/HomeModel..dart/Banner/HomeBanner.dart';
import 'package:only_pets/model/HomeModel..dart/Category/ViewCategoryModel.dart';
import 'package:only_pets/model/HomeModel..dart/Clothes_Brand/ClothesBrandModel.dart';
import 'package:only_pets/model/HomeModel..dart/Food_Brand/FoodBrand.dart';
import 'package:only_pets/model/HomeModel..dart/Pets_Food/ViewPetsFoodModel.dart';
import 'package:only_pets/model/HomeModel..dart/Treading/ViewTrendingModel.dart';
import 'package:only_pets/util/Color.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var controller = Get.put(HomeScreenController());
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
      // backgroundColor: ,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 1200),
              child: Container(
                height: 6.h,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 2.w,
                      ),
                      child: Image.asset(
                        "asset/all pets/mylogo.png",
                        height: 10.h,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 19.w),
                      child: Text(
                        "Home Screen",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            fontFamily: "Alegreya"),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // showSearch(context: context, delegate: Searchscreen());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Searchscreen(),
                            ));
                      },
                      child: Icon(
                        CupertinoIcons.search,
                        size: 6.w,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => cartscreen(),
                            ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: Icon(
                          CupertinoIcons.cart,
                          size: 6.w,
                        ),
                      ),
                    )
                  ],
                ),
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
                    FadeInDown(
                      duration: Duration(milliseconds: 1200),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            "Hi Meet",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Alegreya"),
                          ),
                        ),
                      ),
                    ),
                    FadeInDown(
                      duration: Duration(milliseconds: 1200),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            "Good Morning!",
                            style: TextStyle(
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w300,
                                fontFamily: "medium"),
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
                            height: 1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h),
                            child: Container(
                              child: FadeInRight(
                                duration: Duration(milliseconds: 1200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(banner.length,
                                      (index) => buildDot(index, context)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInRight(
                          duration: Duration(milliseconds: 1200),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 3.w),
                                  child: Text(
                                    "Categories",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w400,
                                      decorationThickness: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.w),
                                child: Container(
                                  width: 17.w,
                                  height: 0.3.h,
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.w))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FadeInRight(
                          duration: Duration(milliseconds: 1200),
                          child: Padding(
                            padding: EdgeInsets.only(right: 1.w),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewCategorys(),
                                    ));
                                //  Navigator.pop(context);
                              },
                              child: Text(
                                "View all",
                                style: TextStyle(
                                  fontFamily: "medium",
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                ),
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
                          milliseconds: 1200,
                        ),
                        child: Container(
                          height: 15.h,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.w, right: 2.w),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    toysscreen(
                                                      userdatas:
                                                          viewCategorys[index],
                                                    )));
                                      },
                                      child: Container(
                                        height: 11.h,
                                        width: 24.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.w)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey, // Shadow color
                                              spreadRadius:
                                                  0.1.w, // Spread radius
                                              blurRadius: 0.4.w, // Blur radius
                                              offset: Offset(0, 1.3),
                                            ),
                                          ],
                                        ),
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
                                  ),
                                  Text(viewCategorys[index].name,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: "medium")),
                                ],
                              );
                            },
                          ),
                        )),
                    FadeInRight(
                      duration: Duration(milliseconds: 1200),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: Text(
                                      "Trending",
                                      style: TextStyle(
                                        fontFamily: "medium",
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w400,
                                        decorationThickness: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: Container(
                                    width: 16.w,
                                    height: 0.3.h,
                                    decoration: BoxDecoration(
                                        color: Colors.brown,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.w))),
                                  ),
                                ),
                              ],
                            ),
                            FadeInRight(
                              duration: Duration(milliseconds: 1200),
                              child: Padding(
                                padding: EdgeInsets.only(right: 1.w),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewTrending()));
                                  },
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1200),
                      child: Container(
                        height: 31.h,
                        child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 3.w,
                                    right: 3.w,
                                    top: 1.5.h,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => detailscreen(
                                              userdata: viewTrending[index],
                                              isFromnTrending: true,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: 28.5.h,
                                      width: 38.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3.w),
                                        ),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey, // Shadow color
                                            spreadRadius:
                                                0.1.w, // Spread radius
                                            blurRadius: 0.4.w, // Blur radius
                                            offset: Offset(0, 1.3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(1.w),
                                            child: Container(
                                              width: double.infinity,
                                              alignment: Alignment.topCenter,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.w))),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(3.w),
                                                    topRight:
                                                        Radius.circular(3.w)),
                                                child: Image.asset(
                                                  viewTrending[index]
                                                      .image
                                                      .first,
                                                  height: 15.h,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              viewTrending[index].name,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontFamily: "medium",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11.sp),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 0.5.h,
                                          // ),
                                          Row(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 1.w),
                                                  child: Text(
                                                    viewTrending[index].Prise,
                                                    style: TextStyle(
                                                        fontFamily: "medium",
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 1.w),
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
                                                padding: EdgeInsets.only(
                                                    right: 1.5.w),
                                                child: Text(
                                                  viewTrending[index].Rate,
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: "medium",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 0.3.h),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              detailscreen(
                                                            userdata:
                                                                viewTrending[
                                                                    index],
                                                          ),
                                                        ));
                                                  },
                                                  child: Container(
                                                    height: 3.h,
                                                    width: 30.w,
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .topRight,
                                                          end: Alignment
                                                              .bottomLeft,
                                                          colors: [
                                                            // Colors.brown.shade300,
                                                            Colors.black
                                                                .withOpacity(
                                                                    0.6),
                                                            CustomColors
                                                                .primaryColor,
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    1.w))),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0.2.w),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "Add Cart",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "medium",
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.white),
                                                      ),
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
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    FadeInRight(
                      duration: Duration(milliseconds: 1800),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: Text(
                                      "Clothes Brand",
                                      style: TextStyle(
                                        fontFamily: "medium",
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w400,
                                        decorationThickness: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 14.w),
                                  child: Container(
                                    width: 16.w,
                                    height: 0.3.h,
                                    decoration: BoxDecoration(
                                        color: Colors.brown,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.w))),
                                  ),
                                ),
                              ],
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
                                                viewclothesbrand()));
                                  },
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Divider(
                      color: Colors.grey,
                      height: 1.h,
                      indent: 0.3.h,
                      endIndent: 0.3.h,
                      thickness: 0.3,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        height: 42.h,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Brandname.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisExtent: 21.h),
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
                                          // offset: Offset(0, 3),
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
                                                  topLeft:
                                                      Radius.circular(18.w),
                                                  topRight:
                                                      Radius.circular(18.w),
                                                  bottomLeft:
                                                      Radius.circular(6.w),
                                                  bottomRight:
                                                      Radius.circular(6.w),
                                                )),
                                            child: Padding(
                                              padding: EdgeInsets.all(1.h),
                                              child: Image.asset(
                                                  Brandname[index].image),
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
                    ),

                    Divider(
                      color: Colors.grey,
                      height: 1.h,
                      indent: 0.3.h,
                      endIndent: 0.3.h,
                      thickness: 0.3,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInRight(
                          duration: Duration(milliseconds: 1800),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 3.w),
                                  child: Text(
                                    "Food Brand",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w400,
                                      decorationThickness: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Container(
                                  width: 16.w,
                                  height: 0.3.h,
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.w))),
                                ),
                              ),
                            ],
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
                                      builder: (context) => viewfoodbrand(),
                                    ));
                              },
                              child: Text(
                                "View all",
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Container(
                      height: 17.h,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: food.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 3.w, right: 2.w),
                            child: Column(
                              children: [
                                Container(
                                  child: ClipPath(
                                    clipper: DiagonalRoundedEdgesMessageClipper(
                                      MessageType.receive,
                                      // bubbleRadius:,
                                      // position: 90,
                                      // holeRadius: 40,
                                    ),
                                    child: Container(
                                      height: 16.h,
                                      width: 35.w,
                                      decoration: BoxDecoration(
                                        color: CustomColors.primaryColor,
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xff0AD1C8),
                                            Color(0xff213A57),
                                            // CustomColors.maincolor,
                                          ],
                                        ),
                                      ),
                                      child: Image.asset(
                                        food[index].image,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
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
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: Text(
                                      "Pets Foods",
                                      style: TextStyle(
                                        fontFamily: "medium",
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w400,
                                        decorationThickness: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Container(
                                    width: 16.w,
                                    height: 0.3.h,
                                    decoration: BoxDecoration(
                                        color: Colors.brown,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.w))),
                                  ),
                                ),
                              ],
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
                                      builder: (context) => viewpetfood(),
                                    ));
                              },
                              child: Text(
                                "View all",
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 30.h,
                      child: Stack(
                        children: [
                          FadeInUpBig(
                            duration: Duration(milliseconds: 1800),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 3.w, right: 3.w, top: 1.5.h),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    detailscreen(
                                                        userdata:
                                                            view_food[index]),
                                              ));
                                        },
                                        child: Container(
                                          height: 26.5.h,
                                          width: 38.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(3.w),
                                            ),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.grey, // Shadow color
                                                spreadRadius:
                                                    0.1.w, // Spread radius
                                                blurRadius:
                                                    0.4.w, // Blur radius
                                                offset: Offset(0, 1.3),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 1.h),
                                                child: Container(
                                                  width: double.infinity,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.w))),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    3.w),
                                                            topRight: Radius
                                                                .circular(3.w)),
                                                    child: Image.asset(
                                                      view_food[index]
                                                          .image
                                                          .first,
                                                      height: 12.h,

                                                      // width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 1.w),
                                                child: Text(
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  view_food[index].name,
                                                  style: TextStyle(
                                                      fontFamily: "medium",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 11.sp),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Row(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.w),
                                                      child: Text(
                                                        view_food[index].Prise,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "medium",
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 0.6.w),
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
                                                    padding: EdgeInsets.only(
                                                        right: 1.5.w),
                                                    child: Text(
                                                      view_food[index].Rate,
                                                      style: TextStyle(
                                                        fontFamily: "medium",
                                                        fontSize: 15.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.w,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 3.h,
                                                    width: 30.w,
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .topRight,
                                                          end: Alignment
                                                              .bottomLeft,
                                                          colors: [
                                                            // Colors.brown.shade300,
                                                            Colors.black
                                                                .withOpacity(
                                                                    0.6),
                                                            CustomColors
                                                                .primaryColor,
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    1.w))),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0.2.w),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "Add Cart",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "medium",
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
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
