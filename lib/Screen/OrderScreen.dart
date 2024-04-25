import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/Screen/OrderDetailsScreen.dart';
import 'package:only_pets/util/Color.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.5.w, top: 0.5.h),
            child: FadeInDown(
              duration: Duration(milliseconds: 1200),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.5.w, top: 0.5.h),
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
                    padding: EdgeInsets.only(
                      left: 25.w,
                    ),
                    child: Text(
                      "Order Screen",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: "Alegreya"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 2.h,
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 91.h,
                    child: ListView.builder(
                      itemCount: 7,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 4.5.w, right: 4.5.w, top: 2.h),
                          child: Container(
                            width: double.infinity,
                            height: 17.5.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3.w),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 3.w),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 15.2.h,
                                        width: 33.w,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(4.w)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.w),
                                            child: Image.asset(
                                              'asset/Dog_Category_pic/Banner_pic/bannerpic5.png',
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 15.sp,
                                            color: CustomColors.primaryColor,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            "Delivered",
                                            style: TextStyle(
                                                fontFamily: "medium",
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    CustomColors.primaryColor),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Order Id : ",
                                            style: TextStyle(
                                              fontFamily: "medium",
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "1C54584C",
                                            style: TextStyle(
                                              fontFamily: "medium",
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontFamily: "medium",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.5.w,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "₹0",
                                                style: TextStyle(
                                                    fontFamily: "medium",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15.sp),
                                              ),
                                              Row(
                                                children: [
                                                  RatingBar.builder(
                                                    itemSize: 20,
                                                    initialRating: 0,
                                                    minRating: 0,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 1000,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderDetailsScreen(),
                                                  ));
                                            },
                                            child: Container(
                                              height: 4.h,
                                              width: 25.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.w),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [
                                                    Colors.black
                                                        .withOpacity(0.6),
                                                    CustomColors.primaryColor,
                                                  ],
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "View Details",
                                                    style: TextStyle(
                                                        fontFamily: "medium",
                                                        fontSize: 10.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
