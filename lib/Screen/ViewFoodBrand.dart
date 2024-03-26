import 'package:animate_do/animate_do.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/HomeModel..dart/Food_Brand/FoodBrandModel.dart';
import 'package:only_pets/util/Color.dart';

class viewfoodbrand extends StatefulWidget {
  const viewfoodbrand({super.key});

  @override
  State<viewfoodbrand> createState() => _viewfoodbrandState();
}

class _viewfoodbrandState extends State<viewfoodbrand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 1200),
              child: AppBar(
                elevation: 0,
                leadingWidth: 13.w,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  "Food Brand",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.dp,
                      fontFamily: "Alegreya"),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: FadeInRight(
                duration: Duration(milliseconds: 1200),
                child: GridView.builder(
                  itemCount: food_brand.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ClipPath(
                          clipper: DiagonalRoundedEdgesMessageClipper(
                            MessageType.receive,
                            // bubbleRadius:,
                            // position: 90,
                            // holeRadius: 40,
                          ),
                          child: Container(
                            height: 13.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: CustomColors.primaryColor,
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
                              food_brand[index].image,
                              height: 15.h,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
            // Container(
            //   height: 17.h,
            //   child: ListView.builder(
            //     physics: BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: food_brand.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: EdgeInsets.only(left: 3.w, right: 2.w),
            //         child: Column(
            //           children: [
            //             ClipPath(
            //               clipper: DiagonalRoundedEdgesMessageClipper(
            //                 MessageType.receive,
            //                 // bubbleRadius:,
            //                 // position: 90,
            //                 // holeRadius: 40,
            //               ),
            //               child: Container(
            //                 height: 16.h,
            //                 width: 35.w,
            //                 decoration: BoxDecoration(
            //                   color: CustomColors.maincolor,
            //                   gradient: LinearGradient(
            //                     begin: Alignment.topRight,
            //                     end: Alignment.bottomRight,
            //                     colors: [
            //                       // Color(0xff14919B).withOpacity(0.6),
            //                       // Color(0xff0B6477).withOpacity(0.2)
            //                       // ----------------------------------
            //                       // Color(0xff213A57).withOpacity(0.5),
            //                       Color(0xff0AD1C8),
            //                       Color(0xff213A57),
            //                       // CustomColors.maincolor,
            //                     ],
            //                   ),
            //                 ),
            //                 child: Image.asset(
            //                   food_brand[index].image,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
