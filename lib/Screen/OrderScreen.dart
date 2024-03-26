import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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
                              size: 30.dp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 29.5.w,top: 1.h),
                            child: Text(
                              "Orders",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22.dp,fontFamily: "Alegreya"),
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
            height: 2.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 91.5.h,
                    child: ListView.builder(
                      itemCount: 7,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.5.w, right: 4.5.w),
                            child: Container(
                              width: double.infinity,
                              height: 18.h,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              size: 25.dp,
                                              color: CustomColors.maincolor,
                                            ),
                                            SizedBox(
                                              width: 0.5.w,
                                            ),
                                            Text(
                                              "Delivered",
                                              style: TextStyle( fontFamily: "medium",
                                                  fontSize: 17.dp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      CustomColors.maincolor),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.5.w,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Order Id : ",
                                              style: TextStyle( fontFamily: "medium",
                                                fontSize: 15.dp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "1C54584C",
                                              style: TextStyle( fontFamily: "medium",
                                                fontSize: 15.dp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Product Name",
                                          style: TextStyle( fontFamily: "medium",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.dp),
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
                                                  "₹ 0",
                                                  style: TextStyle( fontFamily: "medium",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20.dp),
                                                ),
                                                Row(
                                                  children: [
                                                    RatingBar.builder(
                                                      itemSize: 20,
                                                      initialRating: 0,
                                                      minRating: 0,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1.0),
                                                      itemBuilder:
                                                          (context, _) => Icon(
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
                                              width: 5.2.w,
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
                                                height: 3.8.h,
                                                width: 22.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.w),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.black
                                                          .withOpacity(0.6),
                                                      CustomColors.maincolor,
                                                    ],
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View Details",
                                                      style: TextStyle( fontFamily: "medium",
                                                          fontSize: 12.dp,
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
