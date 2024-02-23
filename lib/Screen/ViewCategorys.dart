import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/ViewCategoryModel.dart';

class ViewCategorys extends StatefulWidget {
  const ViewCategorys({super.key});

  @override
  State<ViewCategorys> createState() => _ViewCategorysState();
}

class _ViewCategorysState extends State<ViewCategorys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4C2C2),
      body: Column(
        children: [
          FadeInDown(
            duration: Duration(milliseconds: 1800),
            child: AppBar(
              leadingWidth: 13.w,
              backgroundColor: Color(0xffF4C2C2),
              leading: Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Image.asset(
                  "asset/all pets/avatarman.png",
                  // "asset/all pets/company_logo.png",
                ),
              ),
              centerTitle: true,
              title: Text(
                "View Category",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.dp),
              ),
              actions: [
                Icon(
                  CupertinoIcons.search,
                  size: 6.w,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: Icon(
                    CupertinoIcons.cart,
                    size: 6.w,
                  ),
                ),
              ],
            ),
          ),
          FadeInRightBig(
            duration: Duration(
              milliseconds: 1800,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: viewCategorys.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 3.w,
                        left: 3.w,
                      ),
                      child: CircleAvatar(
                        radius: 11.w,
                        backgroundImage: AssetImage(
                          viewCategorys[index].image,
                        ),
                      ),
                    ),
                    Text(viewCategorys[index].name,
                        style: TextStyle(fontSize: 20.dp)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
