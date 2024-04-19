import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:only_pets/Screen/DetailScreen.dart';
import 'package:only_pets/Screen/dialogs.dart';
import 'package:only_pets/api_handle/Repository.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/preference/UserPreference.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/helper.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

class HomeScreenController extends GetxController {
  RxInt currentTreeView = 2.obs;
  RxBool isExpanded = false.obs;
  RxBool isTreeModeVertical = true.obs;
  RxBool accessToDrawer = false.obs;
  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  RxList treeList = [].obs;
  var currentPage = 0;
  late TextEditingController searchCtr;
  bool isSearch = false;
  RxInt totalItemsCount = 0.obs;
  RxBool isShowMoreLoading = false.obs;
  // Use a Map to store the quantity for each product ID
  final Map<String, int> productQuantities = <String, int>{};
  RxBool isHovered = false.obs;
  bool? isGuest = true;

  RxList topItemList = [].obs;
  RxList bannerList = [].obs;
  RxList mainOfferrList = [].obs;
  RxList<String> offerrList = [''].obs;
  HomeModel? homeData;
  RxList<CommonProductList> popularItemList = <CommonProductList>[].obs;
  RxList<CommonProductList> trendingItemList = <CommonProductList>[].obs;

  RxList categoryList = [].obs;
  @override
  void onInit() {
    searchCtr = TextEditingController();
    super.onInit();
  }

  void getHome(context) async {
    state.value = ScreenState.apiLoading;
    //try {
    // if (networkManager.connectionType == 0)  {
    //   showDialogForScreen(
    //       context, BottomConstant.home, Connection.noConnection,
    //       callback: () {
    //     Get.back();
    //   });
    //   return;
    // }
    var response = await Repository.get({}, ApiUrl.getHome, allowHeader: true);
    logcat("HOME_RESPONSE::", response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == 1) {
        state.value = ScreenState.apiSuccess;
        message.value = '';
        homeData = HomeModel.fromJson(responseData);
        trendingItemList.clear();
        topItemList.clear();
        popularItemList.clear();
        bannerList.clear();
        categoryList.clear();

        if (homeData!.data.trendList.isNotEmpty) {
          trendingItemList.addAll(homeData!.data.trendList);
          update();
        }

        if (homeData!.data.categoryList.isNotEmpty) {
          categoryList.addAll(homeData!.data.categoryList);
          update();
        }
        if (homeData!.data.bannerList.isNotEmpty) {
          bannerList.addAll(homeData!.data.bannerList);
          update();
        }

        List<CommonProductList> cartItems =
            await UserPreferences().loadCartItems();

        for (CommonProductList item in homeData!.data.trendList) {
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

        if (homeData!.data.topList.isNotEmpty) {
          topItemList.addAll(homeData!.data.topList);
          update();
        }
        if (homeData!.data.popularList.isNotEmpty) {
          popularItemList.addAll(homeData!.data.popularList);
          update();
        }

        for (CommonProductList item in homeData!.data.popularList) {
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
        mainOfferrList.clear();
        offerrList.clear();
        if (homeData!.data.offerList.isNotEmpty) {
          mainOfferrList.addAll(homeData!.data.offerList);
          for (int i = 0; i < homeData!.data.offerList.length; i++) {
            offerrList.addAll(homeData!.data.offerList[i].url);
          }
          update();
        }
        logcat("OFFERDATA::", jsonEncode(offerrList));
      } else {
        message.value = responseData['message'];
        showDialogForScreen(
            context, BottomConstant.home, responseData['message'],
            callback: () {});
      }
    } else {
      state.value = ScreenState.apiError;
      message.value = 'There is error from the server';
    }
  }

  //    catch (e) {
  //     logcat("Ecxeption", e);
  //     state.value = ScreenState.apiError;
  //     message.value = "Server Error";
  //   }
  // }

  getCategoryListItem(BuildContext context, CategoryList item) {
    return FadeInUp(
        child: GestureDetector(
            onTap: () {},
            child: Container(
                width: 8.h,
                margin: EdgeInsets.only(
                    right:
                        SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          //color: Colors.grey[300],
                          border: Border.all(
                            color: grey, // Border color
                            width: 0.5, // Border width
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: 7.h,
                              width: 7.h,
                              imageUrl: ApiUrl.imageUrl + item.thumbnailUrl,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                    color: primaryColor),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                Asset.productPlaceholder,
                                height: 7.h,
                                fit: BoxFit.cover,
                              ),
                              imageBuilder: (context, imageProvider) {
                                return Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      item.name.length > 9
                          ? Expanded(
                              child: Marquee(
                                style: TextStyle(
                                  fontFamily: fontRegular,
                                  color: black,
                                  fontSize:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 12.sp
                                          : 9.sp,
                                ),
                                text: item.name,
                                scrollAxis: Axis
                                    .horizontal, // Use Axis.vertical for vertical scrolling
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Adjust as needed
                                blankSpace:
                                    20.0, // Adjust the space between text repetitions
                                velocity: 50.0, // Adjust the scrolling speed
                                pauseAfterRound: const Duration(
                                    seconds:
                                        1), // Time to pause after each scroll
                                startPadding:
                                    10.0, // Adjust the initial padding
                                accelerationDuration: const Duration(
                                    seconds: 1), // Duration for acceleration
                                accelerationCurve:
                                    Curves.linear, // Acceleration curve
                                decelerationDuration: const Duration(
                                    milliseconds:
                                        500), // Duration for deceleration
                                decelerationCurve:
                                    Curves.easeOut, // Deceleration curve
                              ),
                            )
                          : Text(
                              item.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: alegreya,
                                color: black,
                                fontSize:
                                    SizerUtil.deviceType == DeviceType.mobile
                                        ? 12.sp
                                        : 9.sp,
                              ),
                            )
                    ]))));
  }

  getTotalProductInCart() async {
    // Fetch the current cart items from preferences
    List<CommonProductList> cartItems = await UserPreferences().loadCartItems();
    logcat("cartItems", cartItems.length.toString());
    // Get the total length of the list
    totalItemsCount.value = cartItems.length;
    logcat("cartItems", totalItemsCount.value.toString());
    update();
  }

  getpopularDeal(BuildContext context, CommonProductList data,
      Function getCartCount, bool? isGuestUser) {
    return Wrap(
      children: [
        FadeInUp(
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
              child: Container(
                  width: 42.w,
                  margin: EdgeInsets.only(bottom: 1.h, left: 1.w, right: 2.w),
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
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizerUtil.deviceType == DeviceType.mobile
                                      ? 4.w
                                      : 2.2.w),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  SizerUtil.deviceType == DeviceType.mobile
                                      ? 4.w
                                      : 2.2.w),
                              child: CachedNetworkImage(
                                fit: BoxFit.contain,
                                height: 12.h,
                                imageUrl:
                                    ApiUrl.imageUrl + data.thumbnailUrl[0],
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                      color: primaryColor),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  Asset.productPlaceholder,
                                  height: 12.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   right: 3.w,
                          //   top: 1.0.h,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       // data.isSelected.value =
                          //       //     !data.isSelected.value;
                          //       update();
                          //     },
                          //     child: Icon(
                          //       Icons.favorite_border,
                          //       size: 3.h,
                          //       color: primaryColor,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 1.0.h,
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
                                  fontWeight: FontWeight.w500,
                                  color: black,
                                  fontSize:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 12.sp
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
                            getDynamicSizedBox(height: 0.5.h),
                            Obx(
                              () {
                                return data.isInCart!.value == false
                                    ? getAddToCartBtn(
                                        'Add to Cart', Icons.shopping_cart,
                                        addCartClick: () async {
                                        data.isInCart!.value = true;
                                        incrementDecrementCartItem(
                                            isFromIcr: true,
                                            data: data,
                                            itemList: trendingItemList,
                                            quantity: data.quantity!.value);
                                        update();
                                      }, isAddToCartClicked: data.isInCart!)
                                    : homeCartIncDecUi(
                                        qty: data.quantity.toString(),
                                        increment: () async {
                                          incrementDecrementCartItemInList(
                                              isFromIcr: true,
                                              data: data,
                                              itemList: trendingItemList,
                                              quantity: data.quantity!.value);
                                          update();
                                        },
                                        isFromPopular: true,
                                        decrement: () async {
                                          incrementDecrementCartItemInList(
                                              isFromIcr: false,
                                              data: data,
                                              itemList: trendingItemList,
                                              quantity: data.quantity!.value);
                                          update();
                                        });
                              },
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     RatingBar.builder(
                            //       initialRating: 3.5,
                            //       minRating: 1,
                            //       direction: Axis.horizontal,
                            //       allowHalfRating: true,
                            //       itemCount: 1,
                            //       itemSize: 3.5.w,
                            //       itemBuilder: (context, _) => const Icon(
                            //         Icons.star,
                            //         color: Colors.orange,
                            //       ),
                            //       onRatingUpdate: (rating) {
                            //         logcat("RATING", rating);
                            //       },
                            //     ),
                            //     getText(
                            //       "3.5",
                            //       TextStyle(
                            //           fontFamily: fontSemiBold,
                            //           color: lableColor,
                            //           fontWeight:
                            //               isDarkMode() ? FontWeight.w600 : null,
                            //           fontSize: SizerUtil.deviceType ==
                            //                   DeviceType.mobile
                            //               ? 9.sp
                            //               : 7.sp,
                            //           height: 1.2),
                            //     ),
                            //     const Spacer(),
                            //     // getAddToCartBtn(
                            //     //     'Add to Cart', Icons.shopping_cart,
                            //     //     addCartClick: () {
                            //     //   if (isGuestUser == true) {
                            //     //     getGuestUserAlertDialog(
                            //     //         context, DashboardText.dashboard);
                            //     //   } else {
                            //     //     Get.to(const CartScreen())!.then((value) {
                            //     //       Statusbar()
                            //     //           .trasparentStatusbarProfile(true);
                            //     //     });
                            //     //   }
                            //     // })
                            //     Obx(
                            //       () {
                            //         return data.isInCart!.value == false
                            //             ? getAddToCartBtn(
                            //                 'Add to Cart', Icons.shopping_cart,
                            //                 addCartClick: () async {
                            //                 data.isInCart!.value = true;
                            //                 // data.quantity!.value = 1;
                            //                 incrementDecrementCartItem(
                            //                     isFromIcr: true,
                            //                     data: data,
                            //                     itemList: trendingItemList,
                            //                     quantity: data.quantity!.value);
                            //                 update();
                            //               }, isAddToCartClicked: data.isInCart!)
                            //             : cartIncDecUi(
                            //                 qty: data.quantity.toString(),
                            //                 increment: () async {
                            //                   incrementDecrementCartItemInList(
                            //                       isFromIcr: true,
                            //                       data: data,
                            //                       itemList: trendingItemList,
                            //                       quantity:
                            //                           data.quantity!.value);
                            //                   update();
                            //                 },
                            //                 decrement: () async {
                            //                   incrementDecrementCartItemInList(
                            //                       isFromIcr: false,
                            //                       data: data,
                            //                       itemList: trendingItemList,
                            //                       quantity:
                            //                           data.quantity!.value);
                            //                   update();
                            //                 });
                            //       },
                            //     ),
                            //   ],
                            // ),
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

  Widget getText(title, TextStyle? style) {
    return Padding(
      padding: EdgeInsets.only(left: 0.5.w, right: 0.5.w),
      child: Text(
        title,
        style: style,
        maxLines: 1,
      ),
    );
  }

  getListItem(BuildContext context, CommonProductList data,
      Function getCartCount, bool? isGuestUser, Function onCLick) {
    return Wrap(children: [
      FadeInUp(
        child: GestureDetector(
          onTap: () {
            Get.to(detailscreen(
              userdata: data,
              isFromnTrending: true,
            ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
            child: Container(
                width: 35.w,
                margin: EdgeInsets.only(bottom: 1.h, left: 1.w, right: 2.w),
                padding: EdgeInsets.only(bottom: 1.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey, // Border color
                    width: 0.5, // Border width
                  ),
                  color: white,
                  borderRadius: BorderRadius.circular(
                      SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
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
                                  SizerUtil.deviceType == DeviceType.mobile
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
                              height: 12.h,
                              imageUrl: ApiUrl.imageUrl + data.images[0],
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                    color: primaryColor),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
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
                                fontSize:
                                    SizerUtil.deviceType == DeviceType.mobile
                                        ? 10.sp
                                        : 8.sp,
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
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     RatingBar.builder(
                          //       initialRating: 3.5,
                          //       minRating: 1,
                          //       direction: Axis.horizontal,
                          //       allowHalfRating: true,
                          //       itemCount: 1,
                          //       itemSize: 3.5.w,
                          //       itemBuilder: (context, _) => const Icon(
                          //         Icons.star,
                          //         color: Colors.orange,
                          //       ),
                          //       onRatingUpdate: (rating) {
                          //         logcat("RATING", rating);
                          //       },
                          //     ),
                          //     getText(
                          //       "3.5",
                          //       TextStyle(
                          //           fontFamily: fontSemiBold,
                          //           color: lableColor,
                          //           fontWeight:
                          //               isDarkMode() ? FontWeight.w600 : null,
                          //           fontSize: SizerUtil.deviceType ==
                          //                   DeviceType.mobile
                          //               ? 9.sp
                          //               : 7.sp,
                          //           height: 1.2),
                          //     ),
                          //     const Spacer(),
                          //     // Obx(
                          //     //   () {
                          //     //     return data.isInCart!.value == false
                          //     //         ? getAddToCartBtn(
                          //     //             'Add to Cart', Icons.shopping_cart,
                          //     //             addCartClick: () async {
                          //     //             data.isInCart!.value = true;
                          //     //             // data.quantity!.value = 1;
                          //     //             incrementDecrementCartItem(
                          //     //                 isFromIcr: true,
                          //     //                 data: data,
                          //     //                 itemList: popularItemList,
                          //     //                 quantity: data.quantity!.value);

                          //     //             update();
                          //     //           }, isAddToCartClicked: data.isInCart!)
                          //     //         : cartIncDecUi(
                          //     //             qty: data.quantity.toString(),
                          //     //             increment: () async {
                          //     //               incrementDecrementCartItemInList(
                          //     //                   isFromIcr: true,
                          //     //                   data: data,
                          //     //                   itemList: popularItemList,
                          //     //                   quantity:
                          //     //                       data.quantity!.value);

                          //     //               update();
                          //     //             },
                          //     //             decrement: () async {
                          //     //               incrementDecrementCartItemInList(
                          //     //                   isFromIcr: false,
                          //     //                   data: data,
                          //     //                   itemList: popularItemList,
                          //     //                   quantity:
                          //     //                       data.quantity!.value);
                          //     //               update();
                          //     //             });
                          //     //   },
                          //     // ),
                          //   ],
                          // ),
                          getDynamicSizedBox(height: 0.3.h),
                          Obx(
                            () {
                              return data.isInCart!.value == false
                                  ? getAddToCartBtn(DashboardText.addtoCart,
                                      Icons.shopping_cart,
                                      addCartClick: () async {
                                      data.isInCart!.value = true;
                                      incrementDecrementCartItem(
                                          isFromIcr: true,
                                          data: data,
                                          itemList: popularItemList,
                                          quantity: data.quantity!.value);

                                      update();
                                    }, isAddToCartClicked: data.isInCart!)
                                  : homeCartIncDecUi(
                                      qty: data.quantity.toString(),
                                      increment: () async {
                                        incrementDecrementCartItemInList(
                                            isFromIcr: true,
                                            data: data,
                                            itemList: popularItemList,
                                            quantity: data.quantity!.value);
                                        update();
                                      },
                                      isFromPopular: false,
                                      decrement: () async {
                                        incrementDecrementCartItemInList(
                                            isFromIcr: false,
                                            data: data,
                                            itemList: popularItemList,
                                            quantity: data.quantity!.value);
                                        update();
                                      });
                            },
                          ),
                        ],
                      ),
                    ),
                    //getDynamicSizedBox(height: 1.h),
                    // getAddToCartBtn('Add to Cart', Icons.shopping_cart,
                    //     addCartClick: () {
                    //   Get.to(const CartScreen())!.then((value) {
                    //     Statusbar().trasparentStatusbarProfile(true);
                    //   });
                    // })
                  ],
                )),
          ),
        ),
      ),
    ]);
  }
}
