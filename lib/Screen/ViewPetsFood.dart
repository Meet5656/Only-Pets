import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/HomeModel..dart/Pets_Food/ViewPetsFoodModel.dart';
import 'package:only_pets/util/Color.dart';

class viewpetfood extends StatefulWidget {
  const viewpetfood({super.key});

  @override
  State<viewpetfood> createState() => _viewpetfoodState();
}

class _viewpetfoodState extends State<viewpetfood> {
  List<bool> LikedList = List.generate(view_food.length, (index) => false);
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
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 6.w,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27.5.w, top: 1.h),
                    child: Text(
                      "Pets Food",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 22.dp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: FadeInRight(
                duration: Duration(milliseconds: 1200),
                child: GridView.builder(
                  itemCount: view_food.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 5 / 7.0),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 3.w,
                            right: 3.w,
                          ),
                          child: Container(
                            height: 30.5.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.w)),
                                border:
                                    Border.all(width: 0.7, color: Colors.grey)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.w))),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3.w),
                                          topRight: Radius.circular(3.w)),
                                      child: Image.asset(
                                        view_food[index].image,
                                        height: 15.h,
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
                                  padding: EdgeInsets.only(left: 1.w),
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    view_food[index].name,
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
                                        padding: EdgeInsets.only(left: 1.w),
                                        child: Text(
                                          view_food[index].Prise,
                                          style: TextStyle(
                                              fontSize: 20.dp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 0.1.h),
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
                                      padding: EdgeInsets.only(right: 1.5.w),
                                      child: Text(
                                        view_food[index].Rate,
                                        style: TextStyle(fontSize: 16.dp),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
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
                                                CustomColors.maincolor,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1.w))),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 1.2.w),
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
                                    Padding(
                                      padding: EdgeInsets.only(right: 1.w),
                                      child: IconButton(
                                        onPressed: () {
                                          LikedList[index] = !LikedList[index];
                                          setState(() {});
                                          print(LikedList[index].toString());
                                        },
                                        // style: ButtonStyle(backgroundColor: Color),
                                        color: LikedList[index]
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
            )
          ],
        ),
      ),
    );
  }
}
