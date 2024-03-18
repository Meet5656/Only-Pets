import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/CartModel.dart';
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
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, top: 1.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DashboardScreen(),
                        //     ));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 6.w,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 33.w, top: 1.h),
                    child: Text(
                      "My Cart",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 22.dp),
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
                    final items = cart[index];
                    return Dismissible(
                      key: Key(items.name),
                      // background: Container(
                      //   color: Colors.red,
                      // ),
                      // onDismissed: (direction) {
                      //   setState(() {
                      //     cart.removeAt(index);
                      //   });
                      // },
                      child: Column(
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
                                      // offset: const Offset(0.0, 0.0),
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                    ), //BoxShadow
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cart[index].name,
                                        style: TextStyle(
                                            fontSize: 15.dp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        cart[index].prise,
                                        style: TextStyle(
                                            fontSize: 15.dp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: Container(
                                      height: 5.5.h,
                                      width: 11.h,
                                      decoration: BoxDecoration(
                                          color: Color(0xfff5f5f8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.w))),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: InkWell(
                                              onTap: () {
                                                // decrement();
                                                decrementQuantity(index);
                                              },
                                              child: Icon(
                                                CupertinoIcons.minus,
                                                size: 5.w,
                                                color: CustomColors.maincolor,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            quantities[index].toString(),
                                            style: TextStyle(fontSize: 20.dp),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 1.w),
                                            child: InkWell(
                                              onTap: () {
                                                // increment();
                                                incrementQuantity(index);
                                              },
                                              child: Icon(
                                                CupertinoIcons.add,
                                                size: 5.w,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            FadeInUp(
              duration: Duration(milliseconds: 1000),
              child: Column(
                children: [
                  Container(
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
                          CustomColors.maincolor,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                child: Padding(
                              padding: EdgeInsets.only(top: 1.h, left: 3.h),
                              child: Text(
                                "#Support Only Pets Welfare Amount",
                                style: TextStyle(
                                    fontSize: 16.dp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            )),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h, left: 9.h),
                              child: Icon(
                                CupertinoIcons.hand_raised_fill,
                                size: 6.w,
                                color: Colors.white,
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
                                height: 3.h,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 4.w, left: 4.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(fontSize: 20.dp),
                                    ),
                                    Text(
                                      "₹500",
                                      style: TextStyle(fontSize: 20.dp),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 4.w, left: 4.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping fee ",
                                      style: TextStyle(fontSize: 20.dp),
                                    ),
                                    Text(
                                      "₹0",
                                      style: TextStyle(fontSize: 20.dp),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 4.w, left: 4.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Welfare Amount",
                                      style: TextStyle(fontSize: 20.dp),
                                    ),
                                    Text(
                                      "₹0",
                                      style: TextStyle(fontSize: 20.dp),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 4.w, left: 4.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "SubTotal",
                                      style: TextStyle(
                                          fontSize: 24.dp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "₹500",
                                      style: TextStyle(
                                          fontSize: 24.dp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
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
                                      CustomColors.maincolor,
                                      Colors.black.withOpacity(0.6),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        fontSize: 16.dp, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
