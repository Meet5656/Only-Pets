import 'dart:async';
import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/dialogs.dart';
import 'package:only_pets/api_handle/Repository.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/model/SearchScreenModel.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/model/homeModel.dart';
import 'package:only_pets/preference/UserPreference.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/controller/Internet_controller.dart';

class SearchScreenController extends GetxController {
  RxInt currentTreeView = 2.obs;
  RxBool isLiked = true.obs;
  RxBool isTreeModeVertical = true.obs;
  RxBool accessToDrawer = false.obs;
  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  final InternetController networkManager = Get.find<InternetController>();
  RxList treeList = [].obs;
  var pageController = PageController();
  var currentPage = 0;
  late Timer timer;
  late TextEditingController searchCtr;
  bool isSearch = false;
  RxList<SavedItem> filterList = <SavedItem>[].obs;
  RxBool? isGuest = true.obs;

  @override
  void onInit() {
    searchCtr = TextEditingController();
    getGuestLogin();
    super.onInit();
  }

  void getGuestLogin() async {
    isGuest!.value = await UserPreferences().getGuestUser();
    update();
    logcat('USER:', isGuest!.value);
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

  RxList searchList = [].obs;
  void getSearchList(context, String searchText) async {
    state.value = ScreenState.apiLoading;
    try {
      if (networkManager.connectionType == 0) {
        showDialogForScreen(
            context, SearchScreenConstant.title, Connection.noConnection,
            callback: () {
          Get.back();
        });
        return;
      }
      var response = await Repository.get(
          {}, "${ApiUrl.getSearch}?search_product=$searchText",
          allowHeader: true);
      logcat("SEARCH_RESPONSE::", response.body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          state.value = ScreenState.apiSuccess;
          message.value = '';
          var searchData = SearchModel.fromJson(responseData);
          searchList.clear();
          if (searchData.data.isNotEmpty) {
            searchList.addAll(searchData.data);
            update();
          } else {
            //state.value = ScreenState.noDataFound;
          }

          List<CommonProductList> cartItems =
              await UserPreferences().loadCartItems();

          for (CommonProductList item in searchData.data) {
            int existingIndex =
                cartItems.indexWhere((cartItem) => cartItem.id == item.id);
            if (existingIndex != -1) {
              item.isInCart!.value = true;
              item.quantity!.value = cartItems[existingIndex].quantity!.value;
            } else {
              item.isInCart!.value = false;
              item.quantity!.value = 0;
            }
          }
        } else {
          message.value = responseData['message'];
          showDialogForScreen(
              context, SearchScreenConstant.title, responseData['message'],
              callback: () {});
        }
      } else {
        state.value = ScreenState.apiError;
        message.value = APIResponseHandleText.serverError;
        showDialogForScreen(
            context, SearchScreenConstant.title, ServerError.servererror,
            callback: () {});
      }
    } catch (e) {
      logcat("Ecxeption", e);
      state.value = ScreenState.apiError;
      message.value = ServerError.servererror;
      showDialogForScreen(
          context, SearchScreenConstant.title, ServerError.servererror,
          callback: () {});
    }
  }

  getFilterUi() {
    return GestureDetector(
      onTap: () {
        //Get.to(const FilterScreen());
      },
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

  getItemListItem(
      BuildContext context, CommonProductList data, bool? isGuestUser) {
    return GestureDetector(
      onTap: () {
        //Get.to(
        //   ProductDetailScreen(
        //     SearchScreenConstant.title,
        //     data: data,
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
                margin: EdgeInsets.only(bottom: 0.5.h, left: 1.w, right: 2.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey, // Border color
                    width: 0.2, // Border width
                  ),
                  color: white,
                  borderRadius: BorderRadius.circular(
                      SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizerUtil.deviceType == DeviceType.mobile
                                    ? 3.5.w
                                    : 2.5.w),
                            border: Border.all(
                              color: grey, // Set the border color here
                              width: 0.2, // Set the border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                SizerUtil.deviceType == DeviceType.mobile
                                    ? 3.5.w
                                    : 2.5.w),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              //height: 12.h,
                              imageUrl: ApiUrl.imageUrl + data.images[0],
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                    color: primaryColor),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                Asset.productPlaceholder,
                                height: 12.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.w, right: 1.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getText(
                            data.name,
                            TextStyle(
                                fontFamily: fontSemiBold,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
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
                          Row(
                            children: [
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
                              const Spacer(),
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
                            ],
                          ),
                          getDynamicSizedBox(
                            height: 0.5.h,
                          ),

                          // Obx(
                          //   () {
                          //     return data.isInCart!.value == false
                          //         ? getAddToCartBtn(
                          //             'Add to Cart', Icons.shopping_cart,
                          //             addCartClick: () async {
                          //             if (isGuest!.value == true) {
                          //               getGuestUserAlertDialog(context,
                          //                   SearchScreenConstant.title);
                          //             } else {
                          //               data.isInCart!.value = true;
                          //               incrementDecrementCartItem(
                          //                   isFromIcr: true,
                          //                   data: data,
                          //                   //itemList: popularItemList,
                          //                   quantity: data.quantity!.value);
                          //             }
                          //             update();
                          //           }, isAddToCartClicked: data.isInCart!)
                          //         : homeCartIncDecUi(
                          //             qty: data.quantity.toString(),
                          //             increment: () async {
                          //               incrementDecrementCartItemInList(
                          //                   isFromIcr: true,
                          //                   data: data,
                          //                   // itemList: popularItemList,
                          //                   quantity: data.quantity!.value);

                          //               update();
                          //             },
                          //             isFromPopular: false,
                          //             decrement: () async {
                          //               incrementDecrementCartItemInList(
                          //                   isFromIcr: false,
                          //                   data: data,
                          //                   // itemList: popularItemList,
                          //                   quantity: data.quantity!.value);
                          //               update();
                          //             });
                          //   },
                          // ),

                          getDynamicSizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
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
}
