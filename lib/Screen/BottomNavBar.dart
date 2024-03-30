import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:only_pets/Screen/ProfileScreen.dart';
import 'package:only_pets/Screen/SavedScreen/SavedScreen.dart';
import 'package:only_pets/Screen/ViewCategorys.dart';
import 'package:only_pets/Screen/dashboard.dart';

class Bottomnavigatorbar extends StatefulWidget {
  const Bottomnavigatorbar({super.key});

  @override
  State<Bottomnavigatorbar> createState() => _BottomnavigatorbarState();
}

class _BottomnavigatorbarState extends State<Bottomnavigatorbar> {
  Color IconColor = Colors.white;

  int _selectedIndex = 0;
  var pageOptions = <Widget>[];

  // final List<Widget> _pages = [
  //   DashboardScreen(),
  //   ViewCategorys(),
  //   SavedScreen(callback),
  //   ProfileScreen(),
  // ];

  @override
  void initState() {
    setState(() {
      pageOptions = [
        DashboardScreen(callback),
        ViewCategorys(),
        SavedScreen(),
        ProfileScreen(),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
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
        ],
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
      body: pageOptions[_selectedIndex],
    );
  }

  void callback(int index) async {
    setState(() {
      _selectedIndex = 1;
    });
  }
}
