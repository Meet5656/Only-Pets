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
import 'package:only_pets/componant/button/form_button.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/controller/Internet_controller.dart';
import 'package:only_pets/model/ProductModel.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/model/brandModel.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

class ProductScreenController extends GetxController {
  RxInt currentTreeView = 2.obs;
  RxBool isExpanded = false.obs;
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
  late TabController tabController;
  RxBool isShowMoreLoading = false.obs;
  RxBool isProductListLoaded = false.obs;

  @override
  void onInit() {
    searchCtr = TextEditingController();
    super.onInit();
  }

  RxList brandList = [].obs;
  String? selectedBrandId;

  void getBrandList(
    context,
    bool hideloading,
    categoryId,
    subcategoryId,
    innerSubcategoryId,
  ) async {
    state.value = ScreenState.apiLoading;
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
          state.value = ScreenState.apiSuccess;
          message.value = '';
          var blogTypeData = BrandModel.fromJson(responseData);
          brandList.clear();
          if (blogTypeData.data.isNotEmpty) {
            brandList.addAll(blogTypeData.data);
            update();
          }
          if (brandList.isNotEmpty) {
            selectedBrandId = brandList.first.id.toString();
            getProductList(context, 1, true, categoryId, subcategoryId,
                innerSubcategoryId, selectedBrandId.toString());
          }
        } else {
          message.value = responseData['message'];
          showDialogForScreen(
              context, ProductScreenConstant.title, responseData['message'],
              callback: () {});
        }
      } else {
        state.value = ScreenState.apiError;
        message.value = APIResponseHandleText.serverError;
        showDialogForScreen(
            context, ProductScreenConstant.title, ServerError.servererror,
            callback: () {});
      }
    } catch (e) {
      logcat("Ecxeption", e);
      state.value = ScreenState.apiError;
      message.value = ServerError.servererror;
      showDialogForScreen(
          context, ProductScreenConstant.title, ServerError.servererror,
          callback: () {});
    }
  }

  RxList productList = [].obs;
  RxString nextPageURL = "".obs;
  RxBool isLoading = false.obs;

  void getProductList(context, currentPage, bool hideloading, categoryId,
      subcategoryId, innerSubcategoryId, String brandId,
      {bool? isRefress}) async {
    var loadingIndicator = LoadingProgressDialog();
    if (hideloading == true) {
      state.value = ScreenState.apiLoading;
    } else {
      loadingIndicator.show(context, '');
      //isLoading.value = true;
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
      logcat("ProductPassingData:::", {
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "inner_subcategory_id": innerSubcategoryId,
        "brand_id": brandId
      });
      var response = await Repository.post({
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "inner_subcategory_id": innerSubcategoryId,
        "brand_id": brandId
      }, ApiUrl.getProductList, allowHeader: false);

      if (hideloading != true) {
        loadingIndicator.hide(
          context,
        );
      }
      var data = jsonDecode(response.body);
      logcat("RESPONSE", data.toString());
      if (response.statusCode == 200) {
        if (data['status'] == 1) {
          state.value = ScreenState.apiSuccess;
          isProductListLoaded.value = true;
          message.value = '';
          isLoading.value = false;
          update();
          var responseData = ProductModel.fromJson(data);

          if (isRefress == true) {
            productList.clear();
          }
          if (responseData.data.data.isNotEmpty) {
            productList.addAll(responseData.data.data);
            productList.refresh();
          }
          if (responseData.data.nextPageUrl != 'null' &&
              responseData.data.nextPageUrl != null) {
            nextPageURL.value = responseData.data.nextPageUrl.toString();
            update();
          } else {
            nextPageURL.value = "";
            update();
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
      if (hideloading != true) {
        loadingIndicator.hide(
          context,
        );
      }
      isLoading.value = false;
      state.value = ScreenState.apiError;
      message.value = ServerError.servererror;
    }
  }

  getListItem(
    BuildContext context,
    CommonProductList data,
    categoryId,
    subcategoryId,
    innerSubcategoryId,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          children: [
            FadeInUp(
              child: GestureDetector(
                onTap: () {
                  logcat('Treanding', 'DONE');

                  // Get.to(ProductDetailScreen(
                  //   DashboardText.trendingTitle,
                  //   data: data,
                  // ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      SizerUtil.deviceType == DeviceType.mobile ? 4.w : 2.2.w),
                  child: Container(
                      width: 45.w,
                      margin:
                          EdgeInsets.only(bottom: 1.h, left: 1.w, right: 2.w),
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
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 3.5.w
                                          : 2.5.w),
                                  border: Border.all(
                                    color: grey, // Border color
                                    width: 0.2, // Border width
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 3.5.w
                                          : 2.5.w),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: 12.h,
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
                                          : 8.sp,
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
                                      itemSize: 3.5.w,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      onRatingUpdate: (rating) {
                                        logcat("RATING", rating);
                                      },
                                    ),
                                    getText(
                                      "3.5",
                                      TextStyle(
                                          fontFamily: fontSemiBold,
                                          color: lableColor,
                                          fontSize: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 9.sp
                                              : 7.sp,
                                          height: 1.2),
                                    ),
                                    //const Spacer(),
                                    // Obx(
                                    //   () {
                                    //     return data.isInCart!.value == false
                                    //         ? getAddToCartBtn('Add to Cart',
                                    //             Icons.shopping_cart,
                                    //             addCartClick: () async {
                                    //             data.isInCart!.value = true;
                                    //             // data.quantity!.value = 1;
                                    //             incrementDecrementCartItem(
                                    //                 isFromIcr: true,
                                    //                 data: data,
                                    //                 quantity:
                                    //                     data.quantity!.value);
                                    //             update();
                                    //           },
                                    //             isAddToCartClicked:
                                    //                 data.isInCart!)
                                    //         : cartIncDecUi(
                                    //             qty: data.quantity.toString(),
                                    //             increment: () async {
                                    //               incrementDecrementCartItemInList(
                                    //                   isFromIcr: true,
                                    //                   data: data,
                                    //                   quantity:
                                    //                       data.quantity!.value);
                                    //               update();
                                    //             },
                                    //             decrement: () async {
                                    //               incrementDecrementCartItemInList(
                                    //                   isFromIcr: false,
                                    //                   data: data,
                                    //                   quantity:
                                    //                       data.quantity!.value);
                                    //               update();
                                    //             });
                                    //   },
                                    // ),
                                  ],
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
          ],
        ),
        nextPageURL.value != "null" && nextPageURL.value.isNotEmpty
            ? Container(
                margin: EdgeInsets.only(
                    top: 1.2.h, left: SizerUtil.width / 3, bottom: 0.8.h),
                child: getMiniButton(() {
                  isShowMoreLoading.value = true;
                  currentPage++;
                  getProductList(context, currentPage, true, categoryId,
                      subcategoryId, innerSubcategoryId, selectedBrandId!);
                  update();
                }, Common.viewMore),
              )
            : Container()
      ],
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

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
