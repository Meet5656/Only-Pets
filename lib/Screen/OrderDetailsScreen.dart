import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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
                            padding: EdgeInsets.only(left: 24.w,top: 1.h),
                            child: Text(
                              "Order Details ",
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
                style: TextStyle(fontFamily: "medium",fontWeight: FontWeight.w600, fontSize: 20.dp),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quantity : ",
                    style:
                        TextStyle(fontFamily: "medium",fontWeight: FontWeight.w400, fontSize: 15.dp),
                  ),
                  Text(
                    "01",
                    style:
                        TextStyle(fontFamily: "medium",fontWeight: FontWeight.w300, fontSize: 15.dp),
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
                    style:
                        TextStyle(fontFamily: "medium",fontWeight: FontWeight.w400, fontSize: 15.dp),
                  ),
                  Text(
                    "1DV54D8C",
                    style:
                        TextStyle(fontFamily: "medium",fontWeight: FontWeight.w300, fontSize: 15.dp),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 6.h,
                width: 65.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      CustomColors.maincolor,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 25.dp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Delivered",
                      style: TextStyle(fontFamily: "medium",
                          fontWeight: FontWeight.w600,
                          fontSize: 15.dp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "01 Aug 2024",
                      style: TextStyle(fontFamily: "medium",
                          fontWeight: FontWeight.w400,
                          fontSize: 15.dp,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 24.h,
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
                        style: TextStyle(fontFamily: "medium",
                            fontSize: 18.dp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        'User name',
                        maxLines: 3,
                        style: TextStyle(fontFamily: "medium",
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Mobile',
                        style: TextStyle(fontFamily: "medium",
                            fontSize: 18.dp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        '+91 94xx xxxx xx',
                        maxLines: 3,
                        style: TextStyle(fontFamily: "medium",
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Delivery Address',
                        style: TextStyle(fontFamily: "medium",
                            fontSize: 18.dp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        'A-11, Satava Icon, Vastral, SP Ring Road, Ahmedabad - 382415',
                        maxLines: 3,
                        style: TextStyle(fontFamily: "medium",
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.17.h,
              ),
              InkWell(
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
                            CustomColors.maincolor,
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
                                style: TextStyle(fontFamily: "medium",
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "(1 Item)",
                                style: TextStyle(fontFamily: "medium",
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                "₹100.00",
                                style: TextStyle(fontFamily: "medium",
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
              )
            ],
          )
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
                    CustomColors.maincolor,
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
                            style: TextStyle(fontFamily: "medium",
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "(1 Item)",
                            style: TextStyle(fontFamily: "medium",
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
                            style: TextStyle(fontFamily: "medium",
                                fontSize: 17.dp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text("₹100.00",
                              style: TextStyle(fontFamily: "medium",
                                  fontSize: 17.dp,
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
                            style: TextStyle(fontFamily: "medium",
                                fontSize: 17.dp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text("₹20.00",
                              style: TextStyle(fontFamily: "medium",
                                  fontSize: 17.dp,
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
                            style: TextStyle(fontFamily: "medium",
                                fontSize: 17.dp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text("Free",
                              style: TextStyle(fontFamily: "medium",
                                  fontSize: 17.dp,
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
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(fontFamily: "medium",
                                fontSize: 19.dp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          Text("₹120",
                              style: TextStyle(fontFamily: "medium",
                                  fontSize: 19.dp,
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
