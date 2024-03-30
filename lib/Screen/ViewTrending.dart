import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/Screen/DetailScreen.dart';
import 'package:only_pets/model/HomeModel..dart/Treading/ViewTrendingModel.dart';
import 'package:only_pets/util/Color.dart';

class ViewTrending extends StatefulWidget {
  const ViewTrending({super.key});

  @override
  State<ViewTrending> createState() => _ViewTrendingState();
}

class _ViewTrendingState extends State<ViewTrending> {
  List<bool> isLikedList = List.generate(viewTrending.length, (index) => false);
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
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 6.w,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, top: 1.h),
                    child: Text(
                      "Trending Screen",
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
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: Container(
                child: FadeInRight(
                  duration: Duration(milliseconds: 1200),
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: viewTrending.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 5 / 6.9),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 2.w,
                              right: 2.w,
                            ),
                            child: Container(
                              height: 30.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.w)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey, // Shadow color
                                    spreadRadius: 0.1.w, // Spread radius
                                    blurRadius: 0.4.w, // Blur radius
                                    offset: Offset(0, 1.3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  detailscreen(
                                                      userdata:
                                                          viewTrending[index]),
                                            ));
                                      },
                                      child: Container(
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
                                            viewTrending[index].image.first,
                                            height: 15.h,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      viewTrending[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11.sp,
                                          fontFamily: "medium"),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 2.w),
                                          child: Text(
                                            viewTrending[index].Prise,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: "medium",
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0.6.w),
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
                                        padding: EdgeInsets.only(right: 2.w),
                                        child: Text(
                                          viewTrending[index].Rate,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: "medium",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 0.5.w,
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 2.w),
                                        child: Container(
                                          height: 3.5.h,
                                          width: 30.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  // Colors.brown.shade300,
                                                  Colors.black.withOpacity(0.6),
                                                  CustomColors.primaryColor,
                                                ],
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(1.w))),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(top: 1.2.w),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "Add Cart",
                                              style: TextStyle(
                                                fontFamily: "medium",
                                                  fontSize: 11.sp,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 1.w),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isLikedList[index] =
                                                  !isLikedList[index];
                                            });
                                          },
                                          // style: ButtonStyle(backgroundColor: Color),
                                          color: isLikedList[index]
                                              ? Colors.red
                                              : Colors.black38,
                                          iconSize: 6.5.w,
                                          icon: Icon(
                                            CupertinoIcons.heart_fill,
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
            )
          ],
        ),
      ),
    );
  }
}
