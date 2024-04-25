import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/util/Color.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
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
                          "Order Detail",
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
              SizedBox(
                height: 3.h,
              ),
              Column(
                children: [
                  Container(
                    height: 25.h,
                    child: Image.asset(
                      'asset/Pets_Food/petsfood10.jpg',
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Product Name",
                    maxLines: 3,
                    style: TextStyle(
                        fontFamily: "medium",
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Quantity : ",
                        style: TextStyle(
                            fontFamily: "medium",
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                      Text(
                        "01",
                        style: TextStyle(
                            fontFamily: "medium",
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Order Id : ",
                        style: TextStyle(
                            fontFamily: "medium",
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                      Text(
                        "1DV54D8C",
                        style: TextStyle(
                            fontFamily: "medium",
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 6.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          CustomColors.primaryColor,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Delivered",
                          style: TextStyle(
                              fontFamily: "medium",
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "01 Aug 2024",
                          style: TextStyle(
                              fontFamily: "medium",
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 25.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.w)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.w, top: 1.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            'User name',
                            maxLines: 3,
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Mobile',
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            '+91 94xx xxxx xx',
                            maxLines: 3,
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Delivery Address',
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            'A-11, Satava Icon, Vastral, SP Ring Road, Ahmedabad - 382415',
                            maxLines: 3,
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                  showpricelist(context);
                },
                child: Visibility(
                  visible: isVisible,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            CustomColors.primaryColor,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.w),
                            topRight: Radius.circular(6.w))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 1.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Price Details",
                                style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "(1 Item)",
                                style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                "₹100.00",
                                style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 0.1.w,
                            indent: 1.w,
                            endIndent: 1.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      )),
    );
  }

  void showpricelist(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    CustomColors.primaryColor,
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.w),
                    topRight: Radius.circular(5.w))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 2.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Price Details",
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "(1 Item)",
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1.w,
                        indent: 1.w,
                        endIndent: 1.w,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total MRP",
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text("₹100.00",
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total MRP",
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text("₹20.00",
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Shipping Charge",
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text("Free",
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1.w,
                        indent: 1.w,
                        endIndent: 1.w,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          Text("₹120",
                              style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).then((value) {
      setState(() {
        isVisible = true;
      });
    });
  }
}
