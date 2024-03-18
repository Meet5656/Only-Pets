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

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardScreen(),
    Text("Category"),
    Text("Home"),
    Text("Profile"),
  ];
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
      body: _pages[_selectedIndex],
    );
  }

  List<Widget> widgets = [DashboardScreen()];
}
