import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:only_pets/Screen/dashboard.dart';

class Bottomnavigatorbar extends StatefulWidget {
  const Bottomnavigatorbar({super.key});

  @override
  State<Bottomnavigatorbar> createState() => _BottomnavigatorbarState();
}

class _BottomnavigatorbarState extends State<Bottomnavigatorbar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: widgets.elementAt(selectedIndex),
      bottomNavigationBar: FadeOutDownBig(
        duration: Duration(milliseconds: 1200),
        child: Padding(
          padding: EdgeInsets.only(right: 1.5.w, left: 1.5.w, bottom: 1.h),
          child: Container(
            height: 7.h,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: CustomColors.maincolor,
              // color: Color(0xffccdbfd),
              //1- color: Color(0xff3d405b),
              // color: Color(0xff287271),
              // color: Color(0xffe3aadd),
              // color: Color(0xffEEEAE6),
              color: Color(0xffe3d5ca),
              borderRadius: BorderRadius.circular(40),
            ),
            child: GNav(
              textStyle: TextStyle(fontSize: 17.dp),
              backgroundColor: Colors.transparent,
              // backgroundColor: Colors.green,
              // rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 10,
              color: Colors.brown,
              // activeColor: Color(0xff3E41A0),
              activeColor: Colors.indigo,
              iconSize: 30,
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.transparent,
              tabs: [
                GButton(
                  icon: CupertinoIcons.home,
                  text: "Home",
                ),
                GButton(
                  icon: CupertinoIcons.square_grid_2x2,
                  text: "Category",
                ),
                GButton(
                  icon: CupertinoIcons.heart,
                  text: "Favorite",
                ),
                GButton(
                  icon: CupertinoIcons.person,
                  text: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// onTap: (value) {
  //   // Respond to item press.
  //   setState(() => selectedIndex = value);
  // },

  List<Widget> widgets = [DashboardScreen()];
}
