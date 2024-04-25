import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/DetailScreen.dart';
import 'package:only_pets/Screen/dialogs.dart';
import 'package:only_pets/Screen/formButton.dart';
import 'package:only_pets/Screen/loadingIndicator.dart';
import 'package:only_pets/api_handle/Repository.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/Internet_controller.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/model/brandModel.dart';
import 'package:only_pets/model/homeDetailModel.dart';
import 'package:only_pets/model/loginModel.dart';
import 'package:only_pets/preference/UserPreference.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

class HomeDetailScreenController extends GetxController {
  RxInt currentTreeView = 2.obs;
  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  InternetController networkManager = Get.find<InternetController>();
  var currentPage = 0;
  RxBool isShowMoreLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void addFavouriteAPI(context, String productId, String type) async {
    var loadingIndicator = LoadingProgressDialog();
    loadingIndicator.show(context, '');
    try {
      if (networkManager.connectionType == 0) {
        loadingIndicator.hide(context);
        showDialogForScreen(
            context, BottomConstant.home, Connection.noConnection,
            callback: () {
          Get.back();
        });
        return;
      }
      UserData? getUserData = await UserPreferences().getSignInInfo();
      logcat('loginPassingData', {
        "user_id": getUserData!.id.toString().trim(),
        "product_id": productId.toString().trim(),
        "type": type.toString().trim(),
      });

      var response = await Repository.post({
        "user_id": getUserData.id.toString().trim(),
        "product_id": productId.toString().trim(),
        "type": type.toString().trim(),
      }, ApiUrl.addFavourite, allowHeader: true);
      loadingIndicator.hide(context);
      loadingIndicator.hide(context);
      update();
      var data = jsonDecode(response.body);
      logcat("tag", data);
      if (response.statusCode == 200) {
        if (data['status'] == 1) {
          showCustomToast(context, data['message'].toString());
        } else {
          showCustomToast(context, data['message'].toString());
        }
      } else {
        showDialogForScreen(context, BottomConstant.home, data['message'] ?? "",
            callback: () {});
        loadingIndicator.hide(context);
      }
    } catch (e) {
      logcat("Exception", e);
      showDialogForScreen(context, BottomConstant.home, ServerError.servererror,
          callback: () {});
    } finally {
      loadingIndicator.hide(context);
    }
  }

  RxList popularList = [].obs;
  RxList trendingList = [].obs;
  RxString nextPageURL = "".obs;
  RxBool isLoading = false.obs;
  void getProductDetailList(context, currentPage, bool hideloading,
      bool? isFromTrending, bool? isFromRefressApi) async {
    var loadingIndicator = LoadingProgressDialog();
    if (hideloading == true) {
      state.value = ScreenState.apiLoading;
      update();
    } else {
      // isLoading.value = true;
      loadingIndicator.show(context, '');
      isLoading.value = true;
      update();
    }

    try {
      if (networkManager.connectionType == 0) {
        showDialogForScreen(
            context, ProductScreenConstant.title, Connection.noConnection,
            callback: () {
          Get.back();
        });
        return;
      }

      var pageURL = '${ApiUrl.getHomeDetail}?page=$currentPage';
      var response = await Repository.get({}, pageURL, allowHeader: false);
      if (hideloading != true) {
        loadingIndicator.hide(
          context,
        );
      }
      // loadingIndicator.hide(context);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 1) {
          state.value = ScreenState.apiSuccess;
          message.value = '';
          isLoading.value = false;
          update();
          var responseData = HomeDetailModel.fromJson(data);
          if (isFromRefressApi == true) {
            popularList.clear();
            trendingList.clear();
          }

          if (isFromTrending == true) {
            logcat("isFromTrending", isFromTrending.toString());
            if (responseData.data.trendList.data.isNotEmpty) {
              trendingList.addAll(responseData.data.trendList.data);

              if (responseData.data.trendList.nextPageUrl != 'null' &&
                  responseData.data.trendList.nextPageUrl != null) {
                nextPageURL.value =
                    responseData.data.trendList.nextPageUrl.toString();
                update();
              } else {
                nextPageURL.value = "";
                update();
              }
            }
          } else {
            if (responseData.data.popularList.data.isNotEmpty) {
              popularList.addAll(responseData.data.popularList.data);

              if (responseData.data.popularList.nextPageUrl != 'null' &&
                  responseData.data.popularList.nextPageUrl != null) {
                nextPageURL.value =
                    responseData.data.popularList.nextPageUrl.toString();
                update();
              } else {
                nextPageURL.value = "";
                update();
              }
            }
          }
          update();
        } else {
          isLoading.value = false;
          message.value = data['message'];
          state.value = ScreenState.apiError;
          showDialogForScreen(
              context, ProductScreenConstant.title, data['message'].toString(),
              callback: () {});
        }
      } else {
        state.value = ScreenState.apiError;
        isLoading.value = false;
        message.value = APIResponseHandleText.serverError;
        showDialogForScreen(
            context, ProductScreenConstant.title, data['message'].toString(),
            callback: () {});
      }
    } catch (e) {
      isLoading.value = false;
      if (hideloading != true) {
        loadingIndicator.hide(
          context,
        );
      }
      state.value = ScreenState.apiError;
      message.value = ServerError.servererror;
    }
  }

  getListItemDetail(
      BuildContext context, CommonProductList data, bool? isFromTrending) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          children: [
            FadeInUp(
              child: GestureDetector(
                onTap: () {
                  // Get.to(ProductDetailScreen(
                  //   DashboardText.trendingTitle,
                  //   data: data,
                  // ));

                  Get.to(detailscreen(
                    userdata: data,
                    isFromnTrending: true,
                  ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
                  child: Container(
                      width: 45.w,
                      margin:
                          EdgeInsets.only(bottom: 0.5.h, left: 1.w, right: 2.w),
                      padding: EdgeInsets.only(bottom: 1.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grey, // Border color
                          width: 0.5, // Border width
                        ),
                        color: white,
                        borderRadius: BorderRadius.circular(
                            SizerUtil.deviceType == DeviceType.mobile
                                ? 4.w
                                : 2.2.w),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: SizerUtil.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizerUtil.deviceType ==
                                                DeviceType.mobile
                                            ? 3.5.w
                                            : 2.2.w),
                                    border: Border.all(
                                      color: grey, // Border color
                                      width: 0.2, // Border width
                                    )),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 3.5.w
                                          : 2.2.w),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: SizerUtil.deviceType ==
                                            DeviceType.mobile
                                        ? 12.h
                                        : 10.h,
                                    imageUrl: ApiUrl.imageUrl + data.images[0],
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                          color: primaryColor),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      Asset.productPlaceholder,
                                      height: 9.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.6.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 1.w, right: 1.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                  data.name,
                                  TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: fontSemiBold,
                                      fontWeight: FontWeight.w500,
                                      color: black,
                                      fontSize: SizerUtil.deviceType ==
                                              DeviceType.mobile
                                          ? 10.sp
                                          : 7.sp,
                                      height: 1.2),
                                ),
                                getDynamicSizedBox(
                                  height: 0.5.h,
                                ),
                                getText(
                                  '${IndiaRupeeConstant.inrCode}${data.price}',
                                  TextStyle(
                                      fontFamily: fontBold,
                                      color: primaryColor,
                                      fontSize: SizerUtil.deviceType ==
                                              DeviceType.mobile
                                          ? 12.sp
                                          : 7.sp,
                                      height: 1.2),
                                ),
                                getDynamicSizedBox(
                                  height: 0.5.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 3.5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 1,
                                      itemSize: SizerUtil.deviceType ==
                                              DeviceType.mobile
                                          ? 3.5.w
                                          : 3.w,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    getText(
                                      '0.0',
                                      TextStyle(
                                          fontFamily: fontSemiBold,
                                          color: lableColor,
                                          fontSize: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 9.sp
                                              : 7.sp,
                                          height: 1.2),
                                    ),
                                  ],
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
        ),
      ],
    );
  }

  Widget getText(title, TextStyle? style) {
    return Padding(
      padding: EdgeInsets.only(left: 0.5.w, right: 0.5.w),
      child: Text(
        title,
        style: style,
        maxLines: 2,
      ),
    );
  }

  AnimationController? animateController;
  // getFilterBottomSheet(BuildContext context, categoryList) {
  //   var controller = Get.put(FilterController());
  //   return showModalBottomSheet(
  //     context: context,
  //     useSafeArea: true,
  //     isDismissible: false,
  //     backgroundColor: isDarkMode() ? darkBackgroundColor : white,
  //     transitionAnimationController: animateController!,
  //     isScrollControlled: true,
  //     enableDrag: false,
  //     clipBehavior: Clip.antiAlias,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //       topLeft: Radius.circular(10.w),
  //       topRight: Radius.circular(10.w),
  //     )),
  //     constraints: BoxConstraints(
  //         maxWidth: SizerUtil.width // here increase or decrease in width
  //         ),
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //           builder: (BuildContext context, StateSetter setState) {
  //         return SingleChildScrollView(
  //           physics: const BouncingScrollPhysics(),
  //           padding: EdgeInsets.only(
  //               bottom: MediaQuery.of(context).viewInsets.bottom),
  //           child: Container(
  //             padding:
  //                 EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h, bottom: 2.h),
  //             child: Column(
  //               children: [
  //                 getFilterToolbar(FilterScreenConstant.title, isFilter: true,
  //                     filterCallback: () {
  //                   Navigator.pop(context);
  //                 }, isFromDialog: true),
  //                 getDynamicSizedBox(height: 1.h),
  //                 getDivider(),
  //                 getDynamicSizedBox(height: 1.h),
  //                 SingleChildScrollView(
  //                   padding: EdgeInsets.only(
  //                       bottom: MediaQuery.of(context).viewInsets.bottom),
  //                   child: Column(
  //                     children: [
  //                       getDynamicSizedBox(height: 1.h),
  //                       getLable(FilterScreenConstant.category,
  //                           isFromFilter: true),
  //                       Obx(
  //                         () {
  //                           return Container(
  //                             margin: EdgeInsets.only(left: 2.w, right: 2.w),
  //                             child: GridView.count(
  //                                 physics: const NeverScrollableScrollPhysics(),
  //                                 shrinkWrap: true,
  //                                 childAspectRatio: 5,
  //                                 mainAxisSpacing: 10,
  //                                 padding: const EdgeInsets.all(0),
  //                                 crossAxisCount: 2,
  //                                 children: List.generate(categoryList!.length,
  //                                     (index) {
  //                                   return controller.getReviewCheckBox(
  //                                       categoryItem: categoryList[index],
  //                                       isFromRating: false);
  //                                 })),
  //                           );
  //                         },
  //                       ),
  //                       getDynamicSizedBox(height: 1.5.h),
  //                       getLable(FilterScreenConstant.brand,
  //                           isFromFilter: true),
  //                       Obx(
  //                         () {
  //                           return Container(
  //                             margin: EdgeInsets.only(left: 2.w, right: 2.w),
  //                             child: GridView.count(
  //                                 physics: const NeverScrollableScrollPhysics(),
  //                                 shrinkWrap: true,
  //                                 childAspectRatio: 4,
  //                                 crossAxisCount: 2,
  //                                 children:
  //                                     List.generate(brandList.length, (index) {
  //                                   return controller.getReviewCheckBox(
  //                                       brandItem: brandList[index],
  //                                       isFromRating: false);
  //                                 })),
  //                           );
  //                         },
  //                       ),
  //                       getDynamicSizedBox(height: 0.8.h),
  //                       getLable(FilterScreenConstant.review,
  //                           isFromFilter: true),
  //                       Obx(
  //                         () {
  //                           return Container(
  //                             margin: EdgeInsets.only(left: 2.w, right: 2.w),
  //                             child: GridView.count(
  //                                 physics: const NeverScrollableScrollPhysics(),
  //                                 shrinkWrap: true,
  //                                 childAspectRatio: 4,
  //                                 crossAxisCount: 2,
  //                                 children: List.generate(
  //                                     controller.review.length, (index) {
  //                                   return controller.getReviewCheckBox(
  //                                       ratingItem: controller.review[index],
  //                                       isFromRating: true);
  //                                 })),
  //                           );
  //                         },
  //                       ),
  //                       getDynamicSizedBox(height: 1.5.h),
  //                       getPriceLable(
  //                           controller.startValue.value
  //                               .toStringAsFixed(2)
  //                               .toString(),
  //                           controller.endValue.value
  //                               .toStringAsFixed(2)
  //                               .toString()),
  //                       Theme(
  //                           data: Theme.of(context).copyWith(
  //                             sliderTheme: SliderTheme.of(context).copyWith(
  //                               activeTrackColor: primaryColor,
  //                               inactiveTrackColor: isDarkMode()
  //                                   ? priceRangeBackgroundColor
  //                                   : grey,
  //                               thumbColor: primaryColor,
  //                               overlayColor: primaryColor.withOpacity(0.3),
  //                               valueIndicatorColor: primaryColor,
  //                               activeTickMarkColor: primaryColor,
  //                               inactiveTickMarkColor: isDarkMode()
  //                                   ? priceRangeBackgroundColor.withOpacity(0.5)
  //                                   : grey,
  //                               valueIndicatorTextStyle: TextStyle(
  //                                 color: isDarkMode()
  //                                     ? priceRangeBackgroundColor
  //                                     : grey,
  //                                 fontSize: 12.sp,
  //                                 fontFamily: fontBold,
  //                               ),
  //                             ),
  //                           ),
  //                           child: Obx(
  //                             () {
  //                               return SfRangeSlider(
  //                                 min: controller.intStartValue.value,
  //                                 max: 2000,
  //                                 values: controller.values,
  //                                 interval: 500,
  //                                 showTicks: true,
  //                                 showLabels: true,
  //                                 enableTooltip: true,
  //                                 minorTicksPerInterval: 1,
  //                                 inactiveColor: isDarkMode()
  //                                     ? priceRangeBackgroundColor
  //                                     : grey,
  //                                 activeColor: primaryColor,
  //                                 onChanged: (SfRangeValues values) {
  //                                   setState(() {
  //                                     controller.startValue.value =
  //                                         values.start;
  //                                     controller.endValue.value = values.end;
  //                                     controller.values = values;
  //                                   });
  //                                 },
  //                               );
  //                             },
  //                           )),
  //                       getDynamicSizedBox(height: 4.h),
  //                       Row(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           FadeInUp(
  //                               from: 50,
  //                               child: SizedBox(
  //                                 width: SizerUtil.width / 2.5,
  //                                 child: getSecondaryFormButton(() {
  //                                   // Navigator.pop(context);
  //                                   setState(() {
  //                                     controller.resetSelections(
  //                                         categoryItem: categoryList,
  //                                         brandItem: brandList,
  //                                         ratingItem: controller.review);
  //                                   });
  //                                 }, Button.clear, isvalidate: true),
  //                               )),
  //                           FadeInUp(
  //                               from: 50,
  //                               child: SizedBox(
  //                                   width: SizerUtil.width / 2.5,
  //                                   child: getSecondaryFormButton(() {
  //                                     Navigator.pop(context);
  //                                   }, Button.apply, isvalidate: true))),
  //                         ],
  //                       ),
  //                       SizedBox(
  //                         height: 2.h,
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //     },
  //   );
  // }

  RxList brandList = [].obs;
  void getBrandList(
    context,
  ) async {
    try {
      if (networkManager.connectionType == 0) {
        state.value = ScreenState.apiSuccess;
        showDialogForScreen(
            context, ProductScreenConstant.title, Connection.noConnection,
            callback: () {
          Get.back();
        });
        return;
      }
      var response =
          await Repository.get({}, ApiUrl.getBrandList, allowHeader: false);
      logcat("BRANDLIST_RESPONSE::", response.body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          message.value = '';
          var blogTypeData = BrandModel.fromJson(responseData);
          brandList.clear();
          if (blogTypeData.data.isNotEmpty) {
            brandList.addAll(blogTypeData.data);
            update();
          }
        } else {
          message.value = responseData['message'];
          showDialogForScreen(
              context, ProductScreenConstant.title, responseData['message'],
              callback: () {});
        }
      } else {
        showDialogForScreen(
            context, ProductScreenConstant.title, ServerError.servererror,
            callback: () {});
      }
    } catch (e) {
      logcat("Ecxeption", e);
      showDialogForScreen(
          context, ProductScreenConstant.title, ServerError.servererror,
          callback: () {});
    }
  }
}
