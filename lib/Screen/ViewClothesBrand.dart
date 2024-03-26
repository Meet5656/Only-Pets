import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/HomeModel..dart/Clothes_Brand/ViewClothesModel.dart';
import 'package:only_pets/util/Color.dart';

class viewclothesbrand extends StatefulWidget {
  const viewclothesbrand({super.key});

  @override
  State<viewclothesbrand> createState() => _viewclothesbrandState();
}

class _viewclothesbrandState extends State<viewclothesbrand> {
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
                  padding: EdgeInsets.only(left: 27.5.w, top: 1.h),
                  child: Text(
                    "Clothes Brand",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.dp,
                        fontFamily: "Alegreya"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: FadeInUp(
              duration: Duration(milliseconds: 1800),
              child: Container(
                height: 42.h,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: viewbrandname.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.w),
                                topRight: Radius.circular(20.w),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  // offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1.w),
                              child: Container(
                                height: 18.h,
                                width: 42.w,
                                decoration: BoxDecoration(
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
                                          viewbrandname[index].image),
                                    ),
                                  ),
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
          ),
        ],
      ),
    ));
  }
}
