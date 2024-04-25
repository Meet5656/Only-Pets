import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:only_pets/api_handle/apiOtherStates.dart';
import 'package:only_pets/componant/button/form_button.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/productController.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/helper.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
  ProductScreen(
      {super.key,
      required this.categoryId,
      required this.subcategoryId,
      required this.innerSubcategoryId,
      required this.brandId});
  String? categoryId;
  String? subcategoryId;
  String? innerSubcategoryId;
  String? brandId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  var controller = Get.put(ProductScreenController());

  @override
  void initState() {
    controller.tabController =
        TabController(vsync: this, length: 4, initialIndex: 0);
    controller.getBrandList(
      context,
      true,
      widget.categoryId,
      widget.subcategoryId,
      widget.innerSubcategoryId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbarIsNormalScreen();
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            controller.hideKeyboard(context);
          },
          child: Container(
            color: transparent,
            child: Column(children: [
              getForgetToolbar(ProductScreenConstant.title,
                  showBackButton: true, callback: () {
                Get.back();
              }),
              Expanded(
                child: Stack(
                  children: [
                    Obx(() {
                      switch (controller.state.value) {
                        case ScreenState.apiLoading:
                        case ScreenState.noNetwork:
                        case ScreenState.noDataFound:
                        case ScreenState.apiError:
                          return SizedBox(
                            child: apiOtherStates(controller.state.value,
                                controller, controller.productList, () {
                              controller.getProductList(
                                  context,
                                  controller.currentPage,
                                  false,
                                  widget.categoryId,
                                  widget.subcategoryId,
                                  widget.innerSubcategoryId,
                                  controller.selectedBrandId!);
                            }),
                          );
                        case ScreenState.apiSuccess:
                          return apiSuccess(controller.state.value);
                        default:
                          Container();
                      }
                      return Container();
                    }),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget apiSuccess(ScreenState state) {
    // ignore: unrelated_type_equality_checks
    if (controller.state == ScreenState.apiSuccess &&
        controller.brandList.isNotEmpty) {
      return getListViewItem();
    } else {
      return noDataFoundWidget();
    }
  }

  getListViewItem() {
    return Column(children: [
      SingleChildScrollView(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.antiAlias,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < controller.brandList.length; i++)
              getTab(controller.brandList[i].name, controller.currentPage == i,
                  () {
                controller.isProductListLoaded.value = false;
                setState(() {});
                int index = controller.brandList.indexWhere((category) =>
                    category.name == controller.brandList[i].name);
                if (index != -1) {
                  controller.currentPage = index;
                  setState(() {});
                }
                if (index >= 0 && index < controller.brandList.length) {
                  controller.selectedBrandId =
                      controller.brandList[index].id.toString();
                  futureDelay(() {
                    controller.getProductList(
                        context,
                        controller.currentPage,
                        false,
                        widget.categoryId,
                        widget.subcategoryId,
                        widget.innerSubcategoryId,
                        controller.selectedBrandId!,
                        isRefress: true);
                  });
                }
              }),
          ],
        ),
      ),
      getDynamicSizedBox(height: 1.h),
      apiResponseUi()
    ]);
  }

  Widget apiResponseUi() {
    // ignore: unrelated_type_equality_checks
    if (controller.isLoading == true) {
      return SizedBox(
        height: SizerUtil.height / 1.2,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: white,
              ),
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              child: LoadingAnimationWidget.discreteCircle(
                color: primaryColor,
                size: 35,
              ),
            ),
          ),
        ),
      );
    } else if (controller.isLoading.value == false &&
        controller.productList.isNotEmpty) {
      return MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 2.h, left: 4.w, right: 4.w),
        crossAxisCount: SizerUtil.deviceType == DeviceType.mobile ? 2 : 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          CommonProductList model = controller.productList[index];
          return Column(
            children: [
              controller.getListItem(context, model, widget.categoryId,
                  widget.subcategoryId, widget.innerSubcategoryId),
              index == controller.productList.length - 1 &&
                      controller.nextPageURL.value.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(
                          top: 2.h, left: 25.w, right: 25.w, bottom: 0.8.h),
                      child: getMiniButton(
                        () {
                          controller.isLoading.value = true;
                          controller.currentPage++;
                          controller.getProductList(
                            context,
                            controller.currentPage,
                            false,
                            widget.categoryId,
                            widget.subcategoryId,
                            widget.innerSubcategoryId,
                            controller.selectedBrandId!,
                            //isRefress: true
                          );
                          setState(() {});
                        },
                        Common.viewMore,
                      ),
                    )
                  : Container()
            ],
          );
        },
        itemCount: controller.productList.length,
      );
    } else {
      if (controller.isProductListLoaded.value == true) {
        return noDataFoundWidget(isFromBlog: true);
      }
      return Container();
    }
  }

  // getTab(String str, bool isSelected) {
  //   return Wrap(
  //     children: [
  //       GestureDetector(
  //         onTap: () {
  //           int index = controller.brandList
  //               .indexWhere((category) => category.name == str);
  //           if (index != -1) {
  //             controller.currentPage = index;
  //             setState(() {});
  //           }
  //           if (index >= 0 && index < controller.brandList.length) {
  //             controller.selectedBrandId =
  //                 controller.brandList[index].id.toString();
  //             futureDelay(() {
  //               controller.getProductList(
  //                   context,
  //                   controller.currentPage,
  //                   false,
  //                   widget.categoryId,
  //                   widget.subcategoryId,
  //                   widget.innerSubcategoryId,
  //                   controller.selectedBrandId!,
  //                   isRefress: true);
  //             });
  //           }
  //         },
  //         child: AnimatedContainer(
  //           width: 25.w,
  //           duration: const Duration(milliseconds: 300),
  //           margin: EdgeInsets.only(
  //               top: 1.h, bottom: 1.5.h, left: 1.2.w, right: 1.2.w),
  //           padding: EdgeInsets.only(
  //               top: 1.5.h, bottom: 1.5.h, left: 1.2.w, right: 1.2.w),
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             color: isSelected ? primaryColor : white,
  //             boxShadow: [
  //               BoxShadow(
  //                 blurRadius: 10,
  //                 spreadRadius: 0.1,
  //                 color: black.withOpacity(.1),
  //               )
  //             ],
  //             border: isDarkMode()
  //                 ? null
  //                 : Border.all(
  //                     color: grey, // Border color
  //                     width: 0.2, // Border width
  //                   ),
  //             borderRadius: BorderRadius.circular(50),
  //           ),
  //           child: Center(
  //             child: str.length > 9
  //                 ? SizedBox(
  //                     height: 2.2.h,
  //                     child: Marquee(
  //                       style: TextStyle(
  //                         fontFamily: fontRegular,
  //                         color: isSelected ? white : black,
  //                         fontSize: 11.sp,
  //                       ),
  //                       text: str,
  //                       scrollAxis: Axis
  //                           .horizontal, // Use Axis.vertical for vertical scrolling
  //                       crossAxisAlignment:
  //                           CrossAxisAlignment.center, // Adjust as needed
  //                       blankSpace:
  //                           20.0, // Adjust the space between text repetitions
  //                       velocity: 50.0, // Adjust the scrolling speed
  //                       pauseAfterRound: const Duration(
  //                           seconds: 1), // Time to pause after each scroll
  //                       startPadding: 2.0, // Adjust the initial padding
  //                       accelerationDuration: const Duration(
  //                           seconds: 1), // Duration for acceleration
  //                       accelerationCurve: Curves.linear, // Acceleration curve
  //                       decelerationDuration: const Duration(
  //                           milliseconds: 500), // Duration for deceleration
  //                       decelerationCurve: Curves.easeOut, // Deceleration curve
  //                     ),
  //                   )
  //                 : Text(
  //                     str,
  //                     maxLines: 1,
  //                     style: TextStyle(
  //                       fontSize: 11.sp,
  //                       overflow: TextOverflow.ellipsis,
  //                       fontFamily: fontBold,
  //                       fontWeight: FontWeight.w700,
  //                       color: isSelected ? white : black,
  //                     ),
  //                   ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
