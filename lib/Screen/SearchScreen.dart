import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/Screen/DetailScreen.dart';
import 'package:only_pets/model/HomeModel..dart/Treading/ViewTrendingModel.dart';
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
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: "Alegreya"),
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
              child: FadeInDown(
                duration: Duration(milliseconds: 1200),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.w))),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14.sp, fontFamily: "medium"),
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: Icon(
                          Icons.search,
                          size: 6.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 3.5.w, horizontal: 6.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.w)),
                      ),
                      hintText: 'Search',

                      // contentPadding:
                      //     EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                      hintStyle:
                          TextStyle(fontSize: 14.sp, fontFamily: "medium"),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                    ),
                    onChanged: searchbook,
                  ),
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
                  itemCount: books.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 5 / 7.1),
                  itemBuilder: (context, index) {
                    final book = books[index];
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detailscreen(
                                        userdata: viewTrending[index]),
                                  ));
                            },
                            child: Container(
                              height: 30.5.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey, // Shadow color
                                    spreadRadius: 0.1.w, // Spread radius
                                    blurRadius: 0.4.w, // Blur radius
                                    offset: Offset(0, 1.3),
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.w)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: Container(
                                      width: double.infinity,
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
                                          height: 15.h,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 0.5.h,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      book.name,
                                      style: TextStyle(
                                          fontFamily: "medium",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp),
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
                                            // Search_Data[index].Prise,
                                            book.Prise,
                                            style: TextStyle(
                                                fontFamily: "medium",
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0.3.h),
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
                                          // Search_Data[index].Rate,
                                          book.Rate,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: "medium",
                                          ),
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
                                                  CustomColors.primaryColor,
                                                ],
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(1.w))),
                                          child: Center(
                                            child: Center(
                                              child: Text(
                                                "Add Cart",
                                                style: TextStyle(
                                                    fontFamily: "medium",
                                                    fontSize: 12.sp,
                                                    color: Colors.white),
                                              ),
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

  void searchbook(String query) {
    final Suggestions = Search_Data.where((book) {
      final booktitle = book.name.toLowerCase();
      final input = query.toLowerCase();
      return booktitle.contains(input);
    }).toList();

    setState(
      () => books = Suggestions,
    );
  }
}
