import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/Screen/CartScreen/CartScreen.dart';
import 'package:only_pets/Screen/SearchScreen.dart';
import 'package:only_pets/Screen/ViewClothesBrand.dart';
import 'package:only_pets/Screen/ViewCategorys.dart';
import 'package:only_pets/Screen/ViewFoodBrand.dart';
import 'package:only_pets/Screen/ViewPetsFood.dart';
import 'package:only_pets/Screen/ViewTrending.dart';
import 'package:only_pets/model/HomeModel..dart/Banner/HomeBanner.dart';
import 'package:only_pets/model/HomeModel..dart/Category/CategorysModel.dart';
import 'package:only_pets/model/HomeModel..dart/Clothes_Brand/ClothesBrandModel.dart';
import 'package:only_pets/model/HomeModel..dart/Food_Brand/FoodBrand.dart';
import 'package:only_pets/model/HomeModel..dart/Pets_Food/PertsFoodModel.dart';
import 'package:only_pets/model/HomeModel..dart/Treading/TrendingModel.dart';
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
      // backgroundColor: ,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 1800),
              child: Container(
                height: 5.h,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Image.asset(
                        "asset/all pets/avatarman.png",
                        height: 4.5.h,
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
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h),
                            child: Container(
                              child: FadeInRight(
                                duration: Duration(milliseconds: 1800),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(banner.length,
                                      (index) => buildDot(index, context)),
                                ),
                              ),
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
                                    decorationThickness: 1,
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
                                  color: Colors.black,
                                  fontSize: 18.dp,
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
                        milliseconds: 1800,
                      ),
                      child: Container(
                        height: 14.h,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
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
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 0.w, color: Colors.grey)),
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
                                                  ViewTrending()));
                                    },
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                        fontSize: 18.dp,
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
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 31.h,
                      child: FadeInUpBig(
                        duration: Duration(milliseconds: 1800),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: Trending.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 3.w,
                                    right: 3.w,
                                    top: 1.5.h,
                                  ),
                                  child: Container(
                                    height: 28.h,
                                    width: 38.w,
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
                                              height: 15.h,
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
                                          height: 0.5.w,
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
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topRight,
                                                      end: Alignment.bottomLeft,
                                                      colors: [
                                                        // Colors.brown.shade300,
                                                        Colors.black
                                                            .withOpacity(0.6),
                                                        CustomColors.maincolor,
                                                      ],
                                                    ),
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
                    SizedBox(
                      height: 1.h,
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
                                  "Clothes Brand ",
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
                                                  viewclothesbrand()));
                                    },
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                        fontSize: 18.dp,
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
                    ),
                    SizedBox(height: 2.h),
                    Divider(
                      color: Colors.grey,
                      height: 1.h,
                      indent: 0.3.h,
                      endIndent: 0.3.h,
                      thickness: 0.2,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        // color: Color(0xfffde2cf),
                        // color: Color(0xfffde2cf),
                        // color: Color(0xffe0cdfb),
                        height: 40.h,
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
                                        // color: Color(0xfff0edeb),
                                        // color: Colors.deepOrange.shade400,
                                        // color: Color(0xffc7ebe1),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Colors.black.withOpacity(0.8),
                                            CustomColors.maincolor,
                                            // CustomColors.maincolor,
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
                                        child: Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: Image.asset(
                                              Brandname[index].image),
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
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 1.h,
                      indent: 0.3.h,
                      endIndent: 0.3.h,
                      thickness: 0.2,
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
                                  "Food Brand",
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
                                      builder: (context) => viewfoodbrand(),
                                    ));
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: 18.dp,
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
                                ClipPath(
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
                                      color: CustomColors.maincolor,
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          // Color(0xff14919B).withOpacity(0.6),
                                          // Color(0xff0B6477).withOpacity(0.2)
                                          // ----------------------------------
                                          // Color(0xff213A57).withOpacity(0.5),
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
                                  "Pets Foods",
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
                                      builder: (context) => viewpetfood(),
                                    ));
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: 18.dp,
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

                    // ----------------------------------------
                    Container(
                      height: 28.h,
                      child: Stack(
                        children: [
                          FadeInUpBig(
                            duration: Duration(milliseconds: 1800),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: foodpets.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 3.w,
                                        right: 3.w,
                                      ),
                                      child: Container(
                                        height: 27.h,
                                        width: 38.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.w)),
                                            border: Border.all(
                                                width: 0.7,
                                                color: Colors.grey)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 1.h),
                                              child: Container(
                                                width: double.infinity,
                                                alignment: Alignment.topCenter,
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
                                                          topRight:
                                                              Radius.circular(
                                                                  3.w)),
                                                  child: Image.asset(
                                                    foodpets[index].image,
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
                                                overflow: TextOverflow.ellipsis,
                                                foodpets[index].name,
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
                                                    padding: EdgeInsets.only(
                                                        left: 1.w),
                                                    child: Text(
                                                      foodpets[index].Prise,
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
                                                  padding: EdgeInsets.only(
                                                      right: 1.5.w),
                                                  child: Text(
                                                    foodpets[index].Rate,
                                                    style: TextStyle(
                                                        fontSize: 16.dp),
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
                                                  padding: EdgeInsets.only(
                                                      top: 0.7.h),
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
                                                                .maincolor,
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    1.w))),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0.7.w),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "Add Cart",
                                                        style: TextStyle(
                                                            fontSize: 15.dp,
                                                            color:
                                                                Colors.white),
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
