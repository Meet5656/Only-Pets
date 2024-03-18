import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:only_pets/model/SearchScreenModel.dart';
import 'package:only_pets/util/Color.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  List<bool> isLikedList = List.generate(Search_Data.length, (index) => false);
  List<SearchScreenModel> books = Search_Data;
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
                      "Search Screen",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 22.dp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 3.w, left: 3.w),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(11.w))),
                child: TextFormField(
                  style: TextStyle(fontSize: 15.dp),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 6.w,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.w)),
                    ),
                    hintText: 'Search',
                    // contentPadding:
                    //     EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                    hintStyle: TextStyle(fontSize: 18.dp),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                  ),
                  onChanged: (String query) {
                    final Suggestions = Search_Data.where((element) {
                      final bookstitle = element.name.toLowerCase();
                      final input = query.toLowerCase();
                      return bookstitle.contains(input);
                    }).toList();
                    setState(() => books = Suggestions);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: FadeInRight(
                duration: Duration(milliseconds: 1200),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: Search_Data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 5 / 7.5),
                  itemBuilder: (context, index) {
                    final book = Search_Data[index];
                    return Column(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 2.w,
                            right: 2.w,
                          ),
                          child: Container(
                            height: 32.5.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.w)),
                                border:
                                    Border.all(width: 0.7, color: Colors.grey)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: Container(
                                    height: 17.h,
                                    // width: double.infinity,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.w))),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3.w),
                                          topRight: Radius.circular(3.w)),
                                      child: Image.asset(
                                        book.image,
                                        // height: 17.h,
                                        width: double.infinity,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.w),
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    book.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.dp),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 2.w),
                                        child: Text(
                                          Search_Data[index].Prise,
                                          style: TextStyle(
                                              fontSize: 20.dp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 0.1.h),
                                      child: Icon(
                                        CupertinoIcons.star_fill,
                                        size: 4.w,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 2.w),
                                      child: Text(
                                        Search_Data[index].Rate,
                                        style: TextStyle(fontSize: 16.dp),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 0.5.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.w),
                                      child: Container(
                                        height: 3.5.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                // Colors.brown.shade300,
                                                Colors.black.withOpacity(0.6),
                                                CustomColors.maincolor,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1.w))),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 1.2.w),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Add Cart",
                                            style: TextStyle(
                                                fontSize: 15.dp,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 1.w),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isLikedList[index] =
                                                !isLikedList[index];
                                          });
                                        },
                                        // style: ButtonStyle(backgroundColor: Color),
                                        color: isLikedList[index]
                                            ? Colors.red
                                            : Colors.black38,
                                        iconSize: 6.5.w,
                                        icon: Icon(
                                          CupertinoIcons.heart_fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


























































// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:only_pets/model/HomeModel..dart/Treading/ViewTrendingModel.dart';
// import 'package:only_pets/model/SearchScreenModel.dart';
// import 'package:only_pets/util/Color.dart';

// class searchscreen extends SearchDelegate {
//    List<bool> isLikedList = List.generate(viewTrending.length, (index) => false);
//   // List<String> Searchitem = [
//   //   "apple",
//   //   "banana",
//   //   "mango",
//   //   "orange",
//   // ];
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             if (query.isEmpty) {
//               close(context, null);
//             } else {
//               query = "";
//             }
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
//   Widget buildSuggestions(BuildContext context,Function onTap) {
//     return Expanded(
//       child: FadeInRight(
//         duration: Duration(milliseconds: 1200),
//         child: GridView.builder(
//           physics: BouncingScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           itemCount: Search_Data.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, childAspectRatio: 5 / 7.5),
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 SizedBox(
//                   height: 1.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: 2.w,
//                     right: 2.w,
//                   ),
//                   child: Container(
//                     height: 32.5.h,
//                     width: 45.w,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(3.w)),
//                         border: Border.all(width: 0.7, color: Colors.grey)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(9.0),
//                           child: Container(
//                             height: 17.h,
//                             // width: double.infinity,
//                             alignment: Alignment.topCenter,
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10.w))),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(3.w),
//                                   topRight: Radius.circular(3.w)),
//                               child: Image.asset(
//                                 Search_Data[index].image,
//                                 // height: 17.h,
//                                 width: double.infinity,
//                                 // fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 0.5.h,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 2.w),
//                           child: Text(
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             softWrap: false,
//                             Search_Data[index].name,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500, fontSize: 14.dp),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 0.5.h,
//                         ),
//                         Row(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.only(left: 2.w),
//                                 child: Text(
//                                   Search_Data[index].Prise,
//                                   style: TextStyle(
//                                       fontSize: 20.dp,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.red),
//                                 ),
//                               ),
//                             ),
//                             Spacer(),
//                             Padding(
//                               padding: EdgeInsets.only(bottom: 0.1.h),
//                               child: Icon(
//                                 CupertinoIcons.star_fill,
//                                 size: 4.w,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 0.5.w,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(right: 2.w),
//                               child: Text(
//                                 Search_Data[index].Rate,
//                                 style: TextStyle(fontSize: 16.dp),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 0.5.w,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(left: 2.w),
//                               child: Container(
//                                 height: 3.5.h,
//                                 width: 30.w,
//                                 decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       begin: Alignment.topRight,
//                                       end: Alignment.bottomLeft,
//                                       colors: [
//                                         // Colors.brown.shade300,
//                                         Colors.black.withOpacity(0.6),
//                                         CustomColors.maincolor,
//                                       ],
//                                     ),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(1.w))),
//                                 child: Padding(
//                                   padding: EdgeInsets.only(top: 1.2.w),
//                                   child: Text(
//                                     textAlign: TextAlign.center,
//                                     "Add Cart",
//                                     style: TextStyle(
//                                         fontSize: 15.dp, color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(right: 1.w),
//                               child: IconButton(
//                                 onPressed: () {
// onTap();
//                                 },
//                                 // style: ButtonStyle(backgroundColor: Color),
//                                 // color: isLikedList[index]
//                                 //     ? Colors.red
//                                 //     : Colors.black38,
//                                 iconSize: 6.5.w,
//                                 icon: Icon(
//                                   CupertinoIcons.heart_fill,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
