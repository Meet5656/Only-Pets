import 'dart:async';
import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/dialogs.dart';
import 'package:only_pets/Screen/loadingIndicator.dart';
import 'package:only_pets/api_handle/Repository.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/model/favouriteModel.dart';
import 'package:only_pets/model/homeModel.dart';
import 'package:only_pets/model/loginModel.dart';
import 'package:only_pets/preference/UserPreference.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

class SavedScreenController extends GetxController {
  RxInt currentTreeView = 2.obs;
  RxBool isLiked = true.obs;
  RxBool isTreeModeVertical = true.obs;
  RxBool accessToDrawer = false.obs;
  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  RxList treeList = [].obs;
  var pageController = PageController();
  var currentPage = 0;
  late Timer timer;
  late TextEditingController searchCtr;
  bool isSearch = false;
  RxList<SavedItem> filterList = <SavedItem>[].obs;

  @override
  void onInit() {
    searchCtr = TextEditingController();
    super.onInit();
  }

  final RxString searchQuery = ''.obs; // For storing the search query
  void setSearchQuery(String query) {
    searchQuery.value = query;
    update();
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  getFilterUi() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 30.w,
          height: 5.5.h,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0,
                    3), // Offset in the vertical direction (adjust as needed)
              ),
            ],
            borderRadius: BorderRadius.circular(
                SizerUtil.deviceType == DeviceType.mobile ? 10.w : 2.2.w),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Filter",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w400,
                  fontSize:
                      SizerUtil.deviceType == DeviceType.mobile ? 14.sp : 13.sp,
                ),
              ),
              getDynamicSizedBox(width: 0.5.w),
              Icon(
                Icons.tune_rounded,
                size: 3.h,
                color: primaryColor,
              )
            ],
          )),
    );
  }

  getItemListItem(BuildContext context, CommonProductList? item) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   ProductDetailScreen(
        //     SavedScreenText.title,
        //     data: item,
        //   ),
        //   transition: Transition.fadeIn,
        //   curve: Curves.easeInOut,
        // );
      },
      child: FadeInUp(
        child: Wrap(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 0.6.h, left: 1.w, right: 2.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey,
                    width: 0.2,
                  ),
                  color: white,
                  borderRadius: BorderRadius.circular(
                      SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizerUtil.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            SizerUtil.deviceType == DeviceType.mobile
                                ? 3.5.w
                                : 2.5.w),
                        border: Border.all(
                          color: grey,
                          width: 0.3,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            SizerUtil.deviceType == DeviceType.mobile
                                ? 3.5.w
                                : 2.5.w),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? 14.h
                              : 12.h,
                          imageUrl: ApiUrl.imageUrl + item!.images[0],
                          placeholder: (context, url) => const Center(
                            child:
                                CircularProgressIndicator(color: primaryColor),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            Asset.productPlaceholder,
                            height: 15.h,
                            width: 15.h,
                            fit: BoxFit.contain,
                          ),
                          imageBuilder: (context, imageProvider) => Image(
                            image: imageProvider,
                            height: 15.h,
                            width: 15.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getText(
                            item.name,
                            TextStyle(
                                fontFamily: alegreya,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                color: black,
                                fontSize:
                                    SizerUtil.deviceType == DeviceType.mobile
                                        ? 10.sp
                                        : 7.sp,
                                height: 1.2),
                          ),
                          getDynamicSizedBox(
                            height: 0.5.h,
                          ),
                          getText(
                            '${IndiaRupeeConstant.inrCode}${item.price}',
                            TextStyle(
                                fontFamily: fontBold,
                                color: primaryColor,
                                fontSize:
                                    SizerUtil.deviceType == DeviceType.mobile
                                        ? 12.sp
                                        : 7.sp,
                                height: 1.2),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Expanded(
                              //   child: RatingBar.builder(
                              //     initialRating: 3.5,
                              //     minRating: 1,
                              //     direction: Axis.horizontal,
                              //     allowHalfRating: true,
                              //     itemCount: 5,
                              //     itemSize: 3.5.w,
                              //     // itemPadding:
                              //     //     const EdgeInsets.symmetric(horizontal: 5.0),
                              //     itemBuilder: (context, _) => const Icon(
                              //       Icons.star,
                              //       color: Colors.orange,
                              //     ),
                              //     onRatingUpdate: (rating) {
                              //       logcat("RATING", rating);
                              //     },
                              //   ),
                              // ),
                              // Expanded(
                              //   child: getText(
                              //     "35 Reviews",
                              //     TextStyle(
                              //         fontFamily: fontSemiBold,
                              //         color: lableColor,
                              //         fontWeight: isDarkMode() ? FontWeight.w900 : null,
                              //         fontSize:
                              //             SizerUtil.deviceType == DeviceType.mobile
                              //                 ? 8.sp
                              //                 : 7.sp,
                              //         height: 1.2),
                              //   ),
                              // ),
                              RatingBar.builder(
                                initialRating: 0.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 1,
                                itemSize: 3.5.w,
                                unratedColor: Colors.orange,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  logcat("RATING", rating);
                                },
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
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  addFavouriteAPI(
                                    context,
                                    item.productId.toString(),
                                    item: item,
                                  );
                                  update();
                                },
                                child: Icon(
                                  Icons.favorite_rounded,
                                  size: 3.h,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    getDynamicSizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getText(title, TextStyle? style) {
    return Padding(
      padding: EdgeInsets.only(left: 0.5.w, right: 0.5.w),
      child: Text(
        title,
        maxLines: 2,
        style: style,
      ),
    );
  }

  void applyFilter(String keyword, isFilter) {
    favouriteFilterList.clear();
    if (isFilter == true) {
      for (CommonProductList model in favouriteList) {
        if (model.name.toLowerCase().contains(keyword.toLowerCase())) {
          favouriteFilterList.add(model);
          logcat('applyFilter::::', favouriteFilterList);
        }
      }
    } else {
      favouriteFilterList.addAll(favouriteList);
    }

    update();
  }

  RxList favouriteList = [].obs;
  RxList favouriteFilterList = [].obs;
  void getFavouriteList(context) async {
    state.value = ScreenState.apiLoading;
    try {
      var response =
          await Repository.get({}, ApiUrl.getFavourite, allowHeader: true);
      logcat("RESPONSE::", response.body);
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == 1) {
          state.value = ScreenState.apiSuccess;
          message.value = '';
          var categoryData = FavouriteModel.fromJson(responseData);
          favouriteList.clear();
          favouriteFilterList.clear();
          if (categoryData.data.isNotEmpty) {
            favouriteList.addAll(categoryData.data);
            favouriteFilterList.addAll(categoryData.data);
            update();
          }
        } else {
          message.value = responseData['message'];
          showDialogForScreen(
              context, SavedScreenText.title, responseData['message'],
              callback: () {});
        }
      } else {
        state.value = ScreenState.apiSuccess;
        if (responseData['message'].toString().isNotEmpty) {
          message.value = APIResponseHandleText.serverError;
          showDialogForScreen(
              context, SavedScreenText.title, responseData['message'],
              callback: () {});
        } else {
          message.value = APIResponseHandleText.serverError;
          showDialogForScreen(
              context, SavedScreenText.title, ServerError.servererror,
              callback: () {});
        }
      }
    } catch (e) {
      logcat("Ecxeption", e);
      state.value = ScreenState.apiError;
      message.value = ServerError.servererror;
      showDialogForScreen(
          context, SavedScreenText.title, ServerError.servererror,
          callback: () {});
    }
  }

  void addFavouriteAPI(
    context,
    String productId, {
    CommonProductList? item,
  }) async {
    var loadingIndicator = LoadingProgressDialog();
    loadingIndicator.show(context, '');
    try {
      UserData? getUserData = await UserPreferences().getSignInInfo();
      logcat('loginPassingData', {
        "user_id": getUserData!.id.toString().trim(),
        "product_id": productId.toString().trim(),
        "type": "1",
      });

      var response = await Repository.post({
        "user_id": getUserData.id.toString().trim(),
        "product_id": productId.toString().trim(),
        "type": "1",
      }, ApiUrl.addFavourite, allowHeader: true);
      loadingIndicator.hide(context);
      var data = jsonDecode(response.body);
      logcat("tag", data);
      if (response.statusCode == 200) {
        if (data['status'] == 1) {
          showCustomToast(context, data['message'].toString());
          for (CommonProductList mo in List.from(favouriteFilterList)) {
            if (productId == mo.productId.toString()) {
              favouriteFilterList.remove(mo);
            }
          }
          await UserPreferences.removeFromFavorites(productId);
          update();
        } else {
          showCustomToast(context, data['message'].toString());
        }
      } else {
        showDialogForScreen(
            context, SavedScreenText.title, data['message'] ?? "",
            callback: () {});
        loadingIndicator.hide(context);
      }
    } catch (e) {
      logcat("Exception", e);
      showDialogForScreen(
          context, SavedScreenText.title, ServerError.servererror,
          callback: () {});
    } finally {
      loadingIndicator.hide(context);
    }
  }
}
