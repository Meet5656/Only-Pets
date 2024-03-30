import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:only_pets/api_handle/apiOtherStates.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/savedController.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/preference/UserPreference.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SavedScreen extends StatefulWidget {
  SavedScreen( {super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen>
    with TickerProviderStateMixin {
  var controller = Get.put(SavedScreenController());
  bool? isGuest;
  @override
  void initState() {
    controller.isSearch = false;
    apiCall();
    super.initState();
  }

  apiCall() async {
    isGuest = await UserPreferences().getGuestUser();
    logcat("isGUESTUSER", isGuest.toString());
    if (isGuest != true) {
      // ignore: use_build_context_synchronously
      controller.getFavouriteList(context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbarIsNormalScreen();
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: transparent,
        child: Stack(children: [
          Column(
            children: [
              getDynamicSizedBox(height: 0.5.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 2.5.w,
                ),
                child: FadeInDown(
                  duration: Duration(milliseconds: 1800),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.5.w, top: 1.h),
                        child: Text(
                          "Saved Screen",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22.sp,
                              fontFamily: alegreya),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // if (controller.isSearch == true)
              //   setSearchBar(
              //       context, controller.searchCtr, SavedScreenText.title,
              //       onCancleClick: () {
              //     controller.isSearch = false;
              //     controller.searchCtr.text = '';
              //     controller.applyFilter('', false);
              //     controller.setSearchQuery(controller.searchCtr.text);
              //     setState(() {});
              //   }, onClearClick: () {
              //     controller.searchCtr.text = '';
              //     controller.applyFilter('', false);
              //     controller.setSearchQuery(controller.searchCtr.text);
              //     setState(() {});
              //   }, isCancle: true)
              // else
              //   getFilterToolbar(SavedScreenText.title, callback: () {
              //     Statusbar().trasparentBottomsheetStatusbar();
              //     controller.getFilterBottomSheet(context);
              //     //Get.to(const FilterScreen());
              //   }, searchClick: () {
              //     controller.isSearch = true;
              //     setState(() {});
              //   }),
              Expanded(
                child: isGuest != true
                    ? Stack(children: [
                        Obx(() {
                          switch (controller.state.value) {
                            case ScreenState.apiLoading:
                            case ScreenState.noNetwork:
                            case ScreenState.noDataFound:
                            case ScreenState.apiError:
                              return SizedBox(
                                height: SizerUtil.height / 1.3,
                                child: apiOtherStates(
                                    controller.state.value,
                                    controller,
                                    controller.favouriteFilterList, () {
                                  controller.getFavouriteList(context);
                                }),
                              );
                            case ScreenState.apiSuccess:
                              return apiSuccess(controller.state.value);
                            default:
                              Container();
                          }
                          return Container();
                        }),
                      ])
                    : Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        child: Center(
                            child: Text(
                          "List is Empty",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: alegreya,
                              fontSize: 12.sp,
                              color: black),
                        )),
                      ),
              ),

              //   Expanded(
              //     child: Container(
              //       margin: EdgeInsets.only(left: 2.w, right: 2.w),
              //       child: Obx(
              //         () {
              //           if (controller.filteredList.isNotEmpty) {
              //             final filteredList = controller.filteredList;
              //             return MasonryGridView.count(
              //               physics: const BouncingScrollPhysics(),
              //               padding: EdgeInsets.only(bottom: 13.h),
              //               crossAxisCount:
              //                   SizerUtil.deviceType == DeviceType.mobile ? 2 : 3,
              //               mainAxisSpacing: 10,
              //               crossAxisSpacing: 4,
              //               itemBuilder: (context, index) {
              //                 SavedItem data = filteredList[index];
              //                 return controller.getItemListItem(data);
              //               },
              //               itemCount: filteredList.length,
              //             );
              //           } else {
              //             return Container(
              //               margin: EdgeInsets.only(bottom: 15.h),
              //               child: Center(
              //                 child: Text(
              //                   APIResponseHandleText.emptylist,
              //                   style: TextStyle(
              //                     fontFamily: fontMedium,
              //                     color: isDarkMode() ? white : black,
              //                     fontSize:
              //                         SizerUtil.deviceType == DeviceType.mobile
              //                             ? 10.sp
              //                             : 7.sp,
              //                   ),
              //                 ),
              //               ),
              //             );
              //           }
              //         },
              //       ),
              //     ),
              //   ),
              // ]),
              Visibility(
                visible: false,
                child: Positioned(
                    left: 0,
                    bottom: 13.h,
                    child: SizedBox(
                      width: SizerUtil.width,
                      child: Center(
                        child: controller.getFilterUi(),
                      ),
                    )),
              ),
            ],
          ),
        ]),
      )),
    );
  }

  Widget apiSuccess(ScreenState state) {
    // ignore: unrelated_type_equality_checks
    if (controller.state == ScreenState.apiSuccess &&
        controller.favouriteFilterList.isNotEmpty) {
      return MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            bottom: 13.h,
            left: 3.w,
            top: controller.favouriteFilterList.isNotEmpty ? 2.h : 0.0),
        crossAxisCount: SizerUtil.deviceType == DeviceType.mobile ? 2 : 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          CommonProductList data = controller.favouriteFilterList[index];
          return controller.getItemListItem(context, data);
        },
        itemCount: controller.favouriteFilterList.length,
      );
    } else {
      return noDataFoundWidget(isFromBlog: true);
    }
  }

  // Widget apiOtherStates(state) {
  //   if (state == ScreenState.apiLoading) {
  //     return Center(
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(100),
  //         child: SizedBox(
  //           height: 30,
  //           width: 30,
  //           child: LoadingAnimationWidget.discreteCircle(
  //             color: primaryColor,
  //             size: 35,
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   Widget? button;
  //   if (controller.favouriteFilterList.isEmpty) {
  //     Container();
  //   }
  //   if (state == ScreenState.noDataFound) {
  //     button = getMiniButton(() {
  //       Get.back();
  //     }, BottomConstant.back);
  //   }
  //   if (state == ScreenState.noNetwork) {
  //     button = getMiniButton(() {
  //       controller.getFavouriteList(context);
  //     }, BottomConstant.tryAgain);
  //   }

  //   if (state == ScreenState.apiError) {
  //     button = getMiniButton(() {
  //       Get.back();
  //     }, BottomConstant.back);
  //   }
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //           margin: EdgeInsets.symmetric(horizontal: 20.w),
  //           child: controller.message.value.isNotEmpty
  //               ? Text(
  //                   controller.message.value,
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                       fontFamily: fontMedium,
  //                       fontSize: 12.sp,
  //                       color: isDarkMode() ? white : black),
  //                 )
  //               : button),
  //     ],
  //   );
  // }
}
