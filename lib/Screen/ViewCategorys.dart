import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/CategoryScreen/SubCategoryScreen.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ViewCategorys extends StatefulWidget {
  ViewCategorys({super.key, this.categoryList});

  RxList<dynamic>? categoryList;
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
      body: SafeArea(
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 1200),
              child: Center(
                child: Text(
                  "Category Screen",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    fontFamily: "Alegreya",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: FadeInRight(
                duration: Duration(
                  milliseconds: 1200,
                ),
                child: FadeInRight(child: apiSuccess()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget apiSuccess() {
    if (widget.categoryList!.isNotEmpty) {
      return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        itemCount: widget.categoryList!.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          CategoryList item = widget.categoryList![index];
          return getCategoryListItem(context, item);
        },
      );
    } else {
      return noDataFoundWidget();
    }
  }

  getCategoryListItem(BuildContext context, CategoryList item) {
    return Wrap(
      children: [
        FadeInUp(
          child: GestureDetector(
            onTap: () {
              Get.to(SubCategoryScreen(
                categoryId: item.id.toString(),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
              child: Container(
                  width: 40.w,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 1.2.w,
                            right: 1.2.w,
                            top: 0.8.h,
                            bottom: 0.8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.h,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: grey, // Border color
                                  width: 0.5, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    SizerUtil.deviceType == DeviceType.mobile
                                        ? 20.w
                                        : 15.w),
                              ),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: ApiUrl.imageUrl + item.thumbnailUrl,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                        color: primaryColor),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    Asset.placeholder,
                                    height: 9.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(
                              item.name,
                              style: TextStyle(
                                  fontFamily: fontSemiBold,
                                  fontWeight: FontWeight.w500,
                                  color: black,
                                  fontSize:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 12.sp
                                          : 7.sp,
                                  height: 1.2),
                            ),
                            SizedBox(
                              height: 0.2.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
