import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:only_pets/Screen/dashboard.dart';

class homescreen extends StatefulWidget {
  const homescreen({
    super.key,
  });

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int activeindex = 0;
  int selectedIndex = 0;
  //size
  int SizeIndex = 0;
  //build dot page
  int currentpage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        // backgroundColor: Color(0xfffde2cf),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.green),
        onTap: (value) {
          // Respond to item press.
          setState(() => selectedIndex = value);
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



  List<Widget> widgets = [DashboardScreen()];
}

// class Datasearch extends SearchDelegate {
//   List<String> Searchitem = [
//     "apple",
//     "banana",
//     "mango",
//     "orange",
//   ];
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = "";
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchquery = [];
//     for (var fruit in Searchitem) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) ;
//       {
//         matchquery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         var result = matchquery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//       itemCount: matchquery.length,
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchquery = [];
//     for (var fruit in Searchitem) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) ;
//       {
//         matchquery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         var result = matchquery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//       itemCount: matchquery.length,
//     );
//   }
// }

//size code
//  Row(
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 1.w),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 setState(() {
//                                                   SizeIndex = 0;
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 3.5.h,
//                                                 width: 8.w,
//                                                 decoration: BoxDecoration(
//                                                     border: SizeIndex == 0
//                                                         ? Border.all(
//                                                             width: 0.4.w)
//                                                         : Border.all(
//                                                             width: 0.2.w),
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 4.w))),
//                                                 child: Padding(
//                                                   padding:
//                                                       EdgeInsets.only(top: 1.w),
//                                                   child: Text(
//                                                     textAlign: TextAlign.center,
//                                                     "S",
//                                                     style: TextStyle(
//                                                         fontSize: 14.dp),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 1.w),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 setState(() {
//                                                   SizeIndex = 1;
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 3.5.h,
//                                                 width: 8.w,
//                                                 decoration: BoxDecoration(
//                                                     border: SizeIndex == 1
//                                                         ? Border.all(
//                                                             width: 0.4.w)
//                                                         : Border.all(
//                                                             width: 0.2.w),
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 4.w))),
//                                                 child: Padding(
//                                                   padding:
//                                                       EdgeInsets.only(top: 1.w),
//                                                   child: Text(
//                                                     textAlign: TextAlign.center,
//                                                     "M",
//                                                     style: TextStyle(
//                                                         fontSize: 14.dp),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 1.w),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 setState(() {
//                                                   SizeIndex = 2;
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 3.5.h,
//                                                 width: 8.w,
//                                                 decoration: BoxDecoration(
//                                                     border: SizeIndex == 2
//                                                         ? Border.all(
//                                                             width: 0.4.w)
//                                                         : Border.all(
//                                                             width: 0.2.w),
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 4.w))),
//                                                 child: Padding(
//                                                   padding:
//                                                       EdgeInsets.only(top: 1.w),
//                                                   child: Text(
//                                                     textAlign: TextAlign.center,
//                                                     "L",
//                                                     style: TextStyle(
//                                                         fontSize: 14.dp),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 1.w),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 setState(() {
//                                                   SizeIndex = 3;
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 3.5.h,
//                                                 width: 8.w,
//                                                 decoration: BoxDecoration(
//                                                     border: SizeIndex == 3
//                                                         ? Border.all(
//                                                             width: 0.4.w)
//                                                         : Border.all(
//                                                             width: 0.2.w),
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 4.w))),
//                                                 child: Padding(
//                                                   padding:
//                                                       EdgeInsets.only(top: 1.w),
//                                                   child: Text(
//                                                     textAlign: TextAlign.center,
//                                                     "XL",
//                                                     style: TextStyle(
//                                                         fontSize: 14.dp),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 1.w),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 setState(() {
//                                                   SizeIndex = 4;
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 3.5.h,
//                                                 width: 8.w,
//                                                 decoration: BoxDecoration(
//                                                     border: SizeIndex == 4
//                                                         ? Border.all(
//                                                             width: 0.4.w)
//                                                         : Border.all(
//                                                             width: 0.2.w),
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 4.w))),
//                                                 child: Padding(
//                                                   padding:
//                                                       EdgeInsets.only(top: 1.w),
//                                                   child: Text(
//                                                     textAlign: TextAlign.center,
//                                                     "XXL",
//                                                     style: TextStyle(
//                                                         fontSize: 14.dp),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       )
