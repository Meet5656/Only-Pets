import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:only_pets/model/HomeModel..dart/HomeModel1.dart';
import 'package:only_pets/model/HomeModel..dart/HomeModel2.dart';
import 'package:only_pets/util/Color.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 3.w, top: 1.h, right: 3.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                leading: Image.asset(
                  "asset/all pets/avatarman.jpg",
                ),
                centerTitle: true,
                title: Text(
                  "Meet",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 22.dp),
                ),
                actions: [
                  Icon(
                    Icons.search,
                    size: 7.w,
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        "Hi Meet",
                        style: TextStyle(
                          fontSize: 25.dp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        "Good Morning!",
                        style: TextStyle(
                            fontSize: 28.dp, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                    child: Image.asset(
                      "asset/all pets/banner.jpg",
                      width: 89.w,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        "Categorys",
                        style: TextStyle(
                            fontSize: 25.dp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 13.h,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: face.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 11.w, left: 3.w),
                              child: CircleAvatar(
                                radius: 10.w,
                                child: ClipOval(
                                  child: Image.asset(
                                    face[index].image,
                                    width: 16.w,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: Text(face[index].name,
                                  style: TextStyle(fontSize: 20.dp)),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  // Stack(
                  //   children: [
                  //     GridView.builder(
                  //         shrinkWrap: true,
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemCount: 4,
                  //         // scrollDirection: Axis.vertical,
                  //         gridDelegate:
                  //             SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           // mainAxisExtent: 2,
                  //           childAspectRatio: 1.5 / 2,
                  //         ),
                  //         itemBuilder: (context, index) {
                  //           return Column(
                  //             children: [
                  //               Container(
                  //                 child: Padding(
                  //                   padding: EdgeInsets.only(
                  //                     right: 2.w,
                  //                     left: 2.w,
                  //                   ),
                  //                   child: Container(
                  //                     height: 27.h,
                  //                     width: 45.w,
                  //                     decoration: BoxDecoration(
                  //                         color: Color(0xff5b78ee),
                  //                         // color: CustomColors.maincolor,
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(5.w))),
                  //                     child: Padding(
                  //                       padding: EdgeInsets.only(
                  //                         top: 1.5.h,
                  //                         bottom: 8.h,
                  //                         right: 3.w,
                  //                         left: 3.w,
                  //                       ),
                  //                       child: Container(
                  //                         decoration: BoxDecoration(
                  //                             color: Color(0xffffe5e4),
                  //                             borderRadius: BorderRadius.all(
                  //                                 Radius.circular(5.w))),
                  //                         // height: 13.h,
                  //                         // width: 20.w,
                  //                         child: ClipRRect(
                  //                           borderRadius: BorderRadius.all(
                  //                               Radius.circular(3.w)),
                  //                           child: Image.asset(
                  //                             image[index].image,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           );
                  //         }),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: CustomColors.maincolor,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.green),
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: Icon(CupertinoIcons.rectangle_grid_2x2),
          ),
          BottomNavigationBarItem(
            label: "Favorites",
            icon: Icon(CupertinoIcons.heart),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
