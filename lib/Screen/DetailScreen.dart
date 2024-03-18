import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/HomeModel..dart/Treading/TrendingModel.dart';

class detailscreen extends StatefulWidget {
  detailscreen({super.key, required this.userdata});
  TrendingModel? userdata;

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  int activeindex = 0;
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
                      "Detail Screen",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 22.dp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 35.h,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.lightBlue.shade50),
              child: Container(
                child: Image.asset(
                  widget.userdata!.image.first,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(
            //   height: 3.h,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 3.h),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CarouselSlider.builder(
            //         itemCount: Detail.length,
            //         itemBuilder: (context, index, realIndex) {
            //           return Container(
            //             margin: EdgeInsets.symmetric(horizontal: 12),
            //             //  color: Colors.green,
            //             child: ClipRRect(
            //               borderRadius: BorderRadius.all(Radius.circular(3.w)),
            //               child: Image.asset(
            //                 Detail[index].image,
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           );
            //         },
            //         options: CarouselOptions(
            //           height: 18.h,
            //           autoPlay: true,
            //           onPageChanged: (index, reason) {
            //             setState(() {
            //               activeindex = index;
            //             });
            //           },
            //         ),
            //       ),
            //       SizedBox(
            //         height: 1.5.h,
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(top: 0.5.h),
            //         child: Container(
            //           child: FadeInRight(
            //             duration: Duration(milliseconds: 1800),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: List.generate(Detail.length,
            //                   (index) => buildDot(index, context)),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  buildDot(int index, BuildContext context) {
    return Container(
      height: 1.5.h,
      width: activeindex == index ? 6.w : 3.w,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: activeindex == index
            // ? CustomColors.maincolor
            ? Colors.black
            // : Color(0xffF9DDDE)
            : Colors.black26,
      ),
    );
  }
}

class Data {
  final String image;
  final String name;
  Data({required this.image, required this.name});
}
