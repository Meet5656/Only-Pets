import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:marquee/marquee.dart';
import 'package:only_pets/model/HomeModel..dart/Category/ViewCategoryModel.dart';

class ViewCategorys extends StatefulWidget {
  const ViewCategorys({super.key});

  @override
  State<ViewCategorys> createState() => _ViewCategorysState();
}

class _ViewCategorysState extends State<ViewCategorys> {
  @override
  // bool _isPasswordValid = false;
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FadeInDown(
            duration: Duration(
              milliseconds: 1000,
            ),
            child: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              leadingWidth: 13.w,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.dp),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          FadeInRightBig(
            duration: Duration(
              milliseconds: 1000,
            ),
            child: FadeInRight(
              child: Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: viewCategorys.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    final categoryName = viewCategorys[index].name;
                    final bool isLongText = categoryName.length > 15;
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 3.w,
                            left: 3.w,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 11.w,
                            backgroundImage: AssetImage(
                              viewCategorys[index].image,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors
                                      .grey, // Adjust border color as needed
                                  width: 0.2, // Adjust border width as needed
                                ),
                              ),
                            ),
                          ),
                        ),
                        isLongText
                            ? Container(
                                height: 3.h,
                                child: Marquee(
                                  text: categoryName,
                                  // scrollAxis: Axis.horizontal,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  blankSpace: 10.0,
                                  // velocity: 100.0,
                                  pauseAfterRound: Duration(milliseconds: 1),
                                  showFadingOnlyWhenScrolling: true,
                                  fadingEdgeStartFraction: 0.1,
                                  fadingEdgeEndFraction: 0.1,
                                  style: TextStyle(fontSize: 20.dp),
                                ),
                              )
                            : Text(
                                categoryName,
                                style: TextStyle(fontSize: 20.dp),
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
    );
  }
}
