import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/model/CartModel.dart';
import 'package:only_pets/model/CartPopUpModel.dart';
import 'package:only_pets/util/Color.dart';

class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  List<int> quantities = List.generate(cart.length, ((index) => 0));

  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  // Method to decrement the quantity of the item at the given index
  void decrementQuantity(int index) {
    setState(() {
      if (quantities[index] > 0) {
        quantities[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          FadeInDown(
            duration: Duration(milliseconds: 1200),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w, top: 1.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 6.w,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29.w, top: 1.h),
                  child: Text(
                    "Cart Screen",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Alegreya",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FadeInRight(
              duration: Duration(milliseconds: 1000),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cart.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  // final items = cart[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Container(
                          height: 11.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: Colors.white,
                              // color: Color(0xfff5f5f8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.w))),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(1.w),
                                child: Container(
                                  // color: Colors.blue,
                                  child: Image.asset(
                                    cart[index].Image,
                                    height: 12.h,
                                    width: 21.w,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.w, left: 3.w),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cart[index].name,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "medium"),
                                    ),
                                    Text(
                                      "Size",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "medium"),
                                    ),
                                    Text(
                                      cart[index].prise,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "medium"),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.h, left: 10.w),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          cart.removeAt(index);
                                        });
                                      },
                                      child: Icon(
                                        CupertinoIcons.delete,
                                        size: 5.w,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 3.w, top: 1.5.h),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            decrementQuantity(index);
                                          },
                                          child: Container(
                                            height: 2.8.h,
                                            width: 6.0.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.w)),
                                                border: Border.all(
                                                    width: 0.3.w,
                                                    color: Colors.black)),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.minus,
                                                size: 4.w,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1.5.w,
                                        ),
                                        Text(
                                          quantities[index].toString(),
                                          style: TextStyle(fontSize: 13.sp),
                                        ),
                                        SizedBox(
                                          width: 1.5.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            incrementQuantity(index);
                                          },
                                          child: Container(
                                            height: 2.8.h,
                                            width: 6.0.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.w)),
                                                border: Border.all(
                                                    width: 0.3.w,
                                                    color: Colors.grey)),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.add,
                                                size: 4.w,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
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
          FadeInUp(
            duration: Duration(milliseconds: 1000),
            child: Container(
              height: 32.5.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.w),
                  topRight: Radius.circular(7.w),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    CustomColors.primaryColor,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    width: 70.w,
                                    height: 18.h,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Samll acts, big impact",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "medium"),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Your donation matters.",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Alegreya"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Container(
                                          height: 6.h,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: popup.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  left: 2.w,
                                                ),
                                                child: Container(
                                                  // height: 2.h,
                                                  width: 15.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3.w)),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 0.2.w,
                                                          color: Colors.black)),
                                                  child: Center(
                                                      child: Text(
                                                          popup[index].donate)),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancle",
                                          style: TextStyle(fontSize: 13.sp),
                                        )),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(fontSize: 13.sp),
                                        ))
                                  ],
                                );
                              });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 0.5.h, top: 1.h, left: 3.h),
                          child: Text(
                            "#Support Only Pets Welfare Amount",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: "medium"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h, left: 9.h),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    width: 70.w,
                                    height: 18.h,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Samll acts, big impact",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "medium"),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Your donation matters.",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Alegreya"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Container(
                                          height: 6.h,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: popup.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  left: 2.w,
                                                ),
                                                child: Container(
                                                  // height: 2.h,
                                                  width: 15.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3.w)),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 0.2.w,
                                                          color: Colors.black)),
                                                  child: Center(
                                                      child: Text(
                                                          popup[index].donate)),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancle",
                                          style: TextStyle(fontSize: 13.sp),
                                        )),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(fontSize: 13.sp),
                                        ))
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(
                            CupertinoIcons.hand_raised_fill,
                            size: 6.w,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.w,
                  ),
                  Container(
                    height: 27.4.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.w),
                          topRight: Radius.circular(8.w)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 3,
                            color: Colors.grey.shade300),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w, left: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                    fontSize: 17.sp, fontFamily: "medium"),
                              ),
                              Text(
                                "₹500",
                                style: TextStyle(
                                    fontSize: 17.sp, fontFamily: "medium"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w, left: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping fee ",
                                style: TextStyle(
                                    fontSize: 17.sp, fontFamily: "medium"),
                              ),
                              Text(
                                "₹0",
                                style: TextStyle(
                                    fontSize: 17.sp, fontFamily: "medium"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w, left: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Welfare Amount",
                                style: TextStyle(
                                    fontSize: 17.sp, fontFamily: "medium"),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Remove",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15.sp,
                                    fontFamily: "medium"),
                              ),
                              Text(
                                "₹0",
                                style: TextStyle(
                                    fontSize: 22.sp, fontFamily: "medium"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w, left: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SubTotal",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "medium"),
                              ),
                              Text(
                                "₹500",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "medium"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 5.5.h,
                          width: 87.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.w),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.topLeft,
                              colors: [
                                CustomColors.primaryColor,
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
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
      )),
    );
  }
}
