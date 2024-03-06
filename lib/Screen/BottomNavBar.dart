import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:only_pets/Screen/dashboard.dart';

class Bottomnavigatorbar extends StatefulWidget {
  const Bottomnavigatorbar({super.key});

  @override
  State<Bottomnavigatorbar> createState() => _BottomnavigatorbarState();
}

class _BottomnavigatorbarState extends State<Bottomnavigatorbar> {
  Color IconColor = Colors.white;
  int selectedIndex = 0;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.pink.shade50,
          animationDuration: Duration(milliseconds: 300),
          buttonBackgroundColor: Colors.pink.shade50,
          items: [
            Icon(
              CupertinoIcons.home,
            ),
            Icon(
              CupertinoIcons.square_grid_2x2,
            ),
            Icon(
              CupertinoIcons.heart,
            ),
            Icon(
              CupertinoIcons.person,
            ),
          ]),
      body: DashboardScreen(),
    );
  }

  List<Widget> widgets = [DashboardScreen()];
}
