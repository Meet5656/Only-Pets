import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/Screen/DogsCategoryList.dart';

class DogsCategoryScreen extends StatefulWidget {
  const DogsCategoryScreen({super.key});

  @override
  State<DogsCategoryScreen> createState() => _DogsCategoryScreenState();
}

var currentIndex = 0;

class _DogsCategoryScreenState extends State<DogsCategoryScreen> {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 3.5.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 5.w),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios)),
                  ),
                  Center(
                  child: CarouselSlider(
                    items: datas.map((data) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                data.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      height: 30.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                ]
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      datas.length, (index) => buildDot(index, context)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Divider(
                color: Colors.black,
                thickness: 0.1.w,
                indent: 6.w,
                endIndent: 6.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Shop by Category",
                style: TextStyle(fontSize: 25.dp, fontWeight: FontWeight.w400),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                  child: Container(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, mainAxisExtent: 21.h),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 1.w, left: 1.w),
                              child: Column(
                                children: [
                                  Container(
                                    height: 18.h,
                                    width: 42.w,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(5.w)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )),
              Divider(
                color: Colors.black,
                thickness: 0.1.w,
                indent: 6.w,
                endIndent: 6.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 1.h,
      width: currentIndex == index ? 6.w : 3.w,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? Color(0xffc64d4c) : Color(0xffF9DDDE)),
    );
  }
}
