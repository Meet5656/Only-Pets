import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/BottomNavBar.dart';
import 'package:only_pets/Screen/CheckoutScreen.dart';
import 'package:only_pets/Screen/formButton.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/CartController.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/preference/UserPreference.dart';
import 'package:only_pets/util/helper.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var controller = Get.put(CartScreenController());
  late List<CommonProductList> cartItems = [];

  @override
  void initState() {
    getCartItem();
    controller.initLoginData();
    super.initState();
  }

  void getCartItem() async {
    cartItems = await UserPreferences().loadCartItems();
    controller.calculateFinalPrice(cartItems);
    controller.totalProductList.value = cartItems.length.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbarIsNormalScreen();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: transparent,
          child: Stack(
            children: [
              Column(
                children: [
                  FadeInDown(
                    duration: Duration(milliseconds: 1200),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, top: 1.h),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 6.w,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 29.w, top: 1.h),
                          child: Text(
                            "Cart Screen",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              fontFamily: "Alegreya",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Expanded(
                      child: FutureBuilder<List<CommonProductList>>(
                    future: UserPreferences().loadCartItems(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // List<CommonProductList> cartItems = snapshot.data ?? [];
                        cartItems = snapshot.data ?? [];
                        return cartItems.isNotEmpty
                            ? Container(
                                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: SizerUtil.width,
                                      margin: EdgeInsets.only(
                                          right: 2.w, bottom: 2.0.h),
                                      padding: EdgeInsets.only(
                                          left: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 3.w
                                              : 2.w,
                                          right: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 3.w
                                              : 2.w,
                                          top: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 2.w
                                              : 1.5.w,
                                          bottom: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 2.w
                                              : 1.5.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.5.h),
                                        color: grey.withOpacity(0.2),
                                        border: Border.all(
                                          color: grey.withOpacity(
                                              0.2), // Set the border color here
                                          width: 2.0, // Set the border width
                                        ),
                                      ),
                                      child: Row(children: [
                                        Obx(
                                          () {
                                            controller.totalProductList.value;
                                            return Text(
                                                "${controller.totalProductList.value} Items",
                                                style: TextStyle(
                                                  color: black,
                                                  fontFamily: fontBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      SizerUtil.deviceType ==
                                                              DeviceType.mobile
                                                          ? 14.sp
                                                          : 12.sp,
                                                ));
                                          },
                                        ),
                                        const Spacer(),
                                        Text(
                                            '${'Total: '}${IndiaRupeeConstant.inrCode}${formatPrice(controller.finalProductPrice.value)}',
                                            style: TextStyle(
                                              color: black,
                                              fontFamily: fontBold,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizerUtil.deviceType ==
                                                      DeviceType.mobile
                                                  ? 14.sp
                                                  : 12.sp,
                                            )),
                                      ]),
                                    ),
                                    // controller.getLableText(
                                    //     'You Have 2 items in cart',
                                    //     isMainTitle: true),
                                    Expanded(
                                        child: SingleChildScrollView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                    padding: EdgeInsets.only(
                                                        bottom: 32.h),
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    itemBuilder:
                                                        (context, index) {
                                                      // CartItem data =
                                                      //     controller.cartItems[index];
                                                      CommonProductList
                                                          cartItem =
                                                          cartItems[index];
                                                      return getListItem(
                                                          cartItem,
                                                          index,
                                                          cartItems);
                                                    },
                                                    itemCount:
                                                        cartItems.length),
                                                getDynamicSizedBox(
                                                    height: 0.5.h),
                                              ],
                                            ))),
                                  ],
                                ),
                              )
                            : FadeInDown(
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: SizerUtil.height,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 5.w),
                                            child: SvgPicture.asset(
                                              Asset.cartEmpty,
                                              fit: BoxFit.cover,
                                              height: 20.h,
                                            ),
                                          ),
                                          getDynamicSizedBox(height: 2.h),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.w, right: 5.w),
                                            child: Text(
                                                'Your basket is empty!!!\nAdd your item and buy what you want us',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: fontMedium,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 2.h,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: 5.5.w,
                                          right: 5.w,
                                        ),
                                        child: FadeInUp(
                                            from: 50,
                                            child: getSecondaryFormButton(() {
                                              //Get.back(result: true);
                                              Get.offAll(Bottomnavigatorbar());
                                              // onClick!();
                                            },
                                                AddressScreenTextConstant
                                                    .startShopping,
                                                isvalidate: true)),
                                      ),
                                    )
                                  ],
                                ),
                              );
                      }
                    },
                  )

                      // cartItems.isNotEmpty
                      //     ?
                      //      Container(
                      //         padding: EdgeInsets.only(left: 6.w, right: 6.w),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Container(
                      //               width: SizerUtil.width,
                      //               margin:
                      //                   EdgeInsets.only(right: 2.w, bottom: 2.0.h),
                      //               padding: EdgeInsets.only(
                      //                   left: 3.w,
                      //                   right: 3.w,
                      //                   top: 2.w,
                      //                   bottom: 2.w),
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(1.5.h),
                      //                 color: isDarkMode()
                      //                     ? primaryColor
                      //                     : grey.withOpacity(0.2),
                      //                 border: Border.all(
                      //                   color: isDarkMode()
                      //                       ? primaryColor
                      //                       : grey.withOpacity(
                      //                           0.2), // Set the border color here
                      //                   width: 2.0, // Set the border width
                      //                 ),
                      //               ),
                      //               child: Row(children: [
                      //                 Obx(
                      //                   () {
                      //                     controller.totalProductList.value;
                      //                     return Text(
                      //                         "${controller.totalProductList.value} Items",
                      //                         style: TextStyle(
                      //                           color: isDarkMode() ? white : black,
                      //                           fontFamily: fontBold,
                      //                           fontWeight: FontWeight.w500,
                      //                           fontSize: 14.sp,
                      //                         ));
                      //                   },
                      //                 ),
                      //                 const Spacer(),
                      //                 Text(
                      //                     '${'Total: '}${IndiaRupeeConstant.inrCode}${formatPrice(controller.finalProductPrice.value)}',
                      //                     style: TextStyle(
                      //                       color: isDarkMode() ? white : black,
                      //                       fontFamily: fontBold,
                      //                       fontWeight: FontWeight.w500,
                      //                       fontSize: 14.sp,
                      //                     )),
                      //               ]),
                      //             ),
                      //             // controller.getLableText(
                      //             //     'You Have 2 items in cart',
                      //             //     isMainTitle: true),
                      //             Expanded(
                      //                 child: SingleChildScrollView(
                      //                     physics: const BouncingScrollPhysics(),
                      //                     child: Column(
                      //                       children: [
                      //                         ListView.builder(
                      //                             padding:
                      //                                 EdgeInsets.only(bottom: 32.h),
                      //                             shrinkWrap: true,
                      //                             physics:
                      //                                 const NeverScrollableScrollPhysics(),
                      //                             scrollDirection: Axis.vertical,
                      //                             clipBehavior: Clip.antiAlias,
                      //                             itemBuilder: (context, index) {
                      //                               // CartItem data =
                      //                               //     controller.cartItems[index];
                      //                               CommonProductList cartItem =
                      //                                   cartItems[index];
                      //                               return getListItem(
                      //                                   cartItem, index, cartItems);
                      //                             },
                      //                             itemCount: cartItems.length),
                      //                         getDynamicSizedBox(height: 0.5.h),
                      //                       ],
                      //                     ))),
                      //           ],
                      //         ),
                      //       )

                      //     :
                      //     FadeInDown(
                      //         child: Stack(
                      //           children: [
                      //             SizedBox(
                      //               height: SizerUtil.height,
                      //               child: Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.center,
                      //                 mainAxisAlignment: MainAxisAlignment.center,
                      //                 children: [
                      //                   Container(
                      //                     margin: EdgeInsets.only(right: 5.w),
                      //                     child: SvgPicture.asset(
                      //                       Asset.cartEmpty,
                      //                       fit: BoxFit.cover,
                      //                       height: 20.h,
                      //                     ),
                      //                   ),
                      //                   getDynamicSizedBox(height: 2.h),
                      //                   Padding(
                      //                     padding: EdgeInsets.only(
                      //                         left: 5.w, right: 5.w),
                      //                     child: Text(
                      //                         'Your basket is empty!!!\nAdd your item and buy what you want us',
                      //                         textAlign: TextAlign.center,
                      //                         style: TextStyle(
                      //                           fontFamily: fontMedium,
                      //                           fontWeight: FontWeight.w500,
                      //                           fontSize: 12.sp,
                      //                         )),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             Positioned(
                      //               left: 0,
                      //               right: 0,
                      //               bottom: 2.h,
                      //               child: Container(
                      //                 margin: EdgeInsets.only(
                      //                   left: 5.5.w,
                      //                   right: 5.w,
                      //                 ),
                      //                 child: FadeInUp(
                      //                     from: 50,
                      //                     child: getSecondaryFormButton(() {
                      //                       //Get.back(result: true);
                      //                       Get.offAll(const DashboardScreen());
                      //                       // onClick!();
                      //                     },
                      //                         AddressScreenTextConstant
                      //                             .startShopping,
                      //                         isvalidate: true)),
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),

                      )
                ],
              ),
              cartItems.isNotEmpty
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          FadeInUp(
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 5.w,
                                  right: 5.w,
                                  top: SizerUtil.deviceType == DeviceType.mobile
                                      ? 2.0.h
                                      : 1.0.h,
                                  bottom: 2.h),
                              decoration: BoxDecoration(
                                  color: white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: grey,
                                        blurRadius: 10.0,
                                        offset: Offset(0, 6),
                                        spreadRadius: 1.0)
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.h),
                                      topRight: Radius.circular(5.h))),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Obx(
                                  () {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        controller
                                            .getLableText('Payment Summery'),
                                        getDynamicSizedBox(height: 1.h),
                                        getDivider(),
                                        getDynamicSizedBox(height: 1.h),
                                        controller.getOrderText('Product Cost',
                                            '${IndiaRupeeConstant.inrCode}${formatPrice(controller.productPrice.value)}',
                                            isNormal: true),
                                        getDynamicSizedBox(height: 1.h),
                                        controller.getOrderText(
                                            'Delivery Charge',
                                            '+ ${IndiaRupeeConstant.inrCode}${formatPrice(controller.deliveryPrice.value)}',
                                            isNormal: true),
                                        getDynamicSizedBox(height: 1.h),
                                        controller.getOrderText('Discount',
                                            '- ${IndiaRupeeConstant.inrCode}${formatPrice(controller.discountPrice.value)}',
                                            isNormal: true),
                                        getDynamicSizedBox(height: 1.h),
                                        controller.getOrderText('Total',
                                            '${IndiaRupeeConstant.inrCode}${formatPrice(controller.finalProductPrice.value)}',
                                            isNormal: false),
                                        getDynamicSizedBox(
                                            height: SizerUtil.deviceType ==
                                                    DeviceType.mobile
                                                ? 3.h
                                                : 0.0),
                                        Container(
                                            margin: EdgeInsets.only(
                                              left: SizerUtil.deviceType ==
                                                      DeviceType.mobile
                                                  ? 5.w
                                                  : 2.w,
                                              right: SizerUtil.deviceType ==
                                                      DeviceType.mobile
                                                  ? 5.w
                                                  : 2.w,
                                            ),
                                            child: FadeInUp(
                                                from: 50,
                                                child: Obx(() {
                                                  return getSecondaryFormButton(
                                                      isFromCart: true,
                                                      () async {
                                                    Get.to(checkoutscreen(
                                                      totaAmount: controller
                                                          .finalProductPrice
                                                          .value
                                                          .toString(),
                                                      discount: controller
                                                          .discountPrice.value
                                                          .toString(),
                                                      shipinCharge: controller
                                                          .deliveryPrice.value
                                                          .toString(),
                                                    ));
                                                  }, Button.checkOut,
                                                      isvalidate: true,
                                                      isEnable: controller
                                                          .isGuest.value);
                                                }))),
                                        getDynamicSizedBox(
                                            height: SizerUtil.deviceType ==
                                                    DeviceType.mobile
                                                ? 0.5.h
                                                : 0.0),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  getListItem(
      CommonProductList data, int index, List<CommonProductList> cartItems) {
    return GestureDetector(
      onTap: () {},
      child: FadeInUp(
        child: Wrap(
          children: [
            Container(
                width: SizerUtil.width,
                margin: EdgeInsets.only(right: 2.w, bottom: 2.0.h),
                padding: EdgeInsets.only(
                    left: 1.8.w, right: 1.8.w, top: 1.8.w, bottom: 1.8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.5.h),
                  border: Border.all(
                    color: grey.withOpacity(0.2), // Set the border color here
                    width: 2.0, // Set the border width
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        SizerUtil.deviceType == DeviceType.mobile
                            ? 1.5.w
                            : 2.1.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FadeInDown(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizerUtil.deviceType == DeviceType.mobile
                                      ? 3.5.w
                                      : 2.5.w),
                              border: Border.all(
                                color: grey.withOpacity(
                                    0.2), // Set the border color here
                                width: 2.0, // Set the border width
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  SizerUtil.deviceType == DeviceType.mobile
                                      ? 12
                                      : 15)),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height:
                                    SizerUtil.deviceType == DeviceType.mobile
                                        ? 13.h
                                        : 12.h,
                                width: SizerUtil.deviceType == DeviceType.mobile
                                    ? 30.w
                                    : 25.w,
                                imageUrl: ApiUrl.imageUrl + data.images[0],
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                      color: primaryColor),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  Asset.productPlaceholder,
                                  height: 13.h,
                                  width: 13.5.h,
                                  fit: BoxFit.contain,
                                ),
                                imageBuilder: (context, imageProvider) => Image(
                                  image: imageProvider,
                                  height:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 13.h
                                          : 12.h,
                                  width:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 13.h
                                          : 12.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        getDynamicSizedBox(width: 3.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data.name,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: alegreya,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizerUtil.deviceType ==
                                            DeviceType.mobile
                                        ? 12.sp
                                        : 10.sp,
                                  )),
                              getDynamicSizedBox(height: 1.h),
                              RichText(
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                text: TextSpan(
                                  text:
                                      '${IndiaRupeeConstant.inrCode}${formatPrice(double.parse(data.price))}',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizerUtil.deviceType ==
                                              DeviceType.mobile
                                          ? 11.sp
                                          : 10.sp),
                                  children: [
                                    TextSpan(
                                      text: '',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                // textScaler: const TextScaler.linear(1),
                              ),
                              getDynamicSizedBox(
                                  height:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 0.5.h
                                          : 0.0),
                              Row(
                                children: [
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                    text: TextSpan(
                                      text: 'Quantity: ',
                                      style: TextStyle(
                                          color: lableColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 8.sp),
                                      children: [
                                        TextSpan(
                                          text: data.quantity.toString(),
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: fontBold,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    ),
                                    // textScaler: const TextScaler.linear(1),
                                  ),
                                  const Spacer(),
                                  cartIncrDcrUi(
                                      qty: data.quantity.toString(),
                                      incrementOnTap: () async {
                                        data.quantity!.value += 1;
                                        await UserPreferences().addToCart(
                                          data,
                                          data.quantity!.value,
                                        );
                                        controller
                                            .calculateFinalPrice(cartItems);
                                        setState(() {});
                                      },
                                      decrementOnTap: () async {
                                        data.quantity!.value--;
                                        if (data.quantity!.value <= 0) {
                                          cartItems.removeAt(index);
                                        }
                                        await UserPreferences().addToCart(
                                          data,
                                          -1,
                                        );
                                        controller.totalProductList.value =
                                            cartItems.length.toString();
                                        controller
                                            .calculateFinalPrice(cartItems);
                                        getCartItem();
                                        setState(() {});
                                      }),
                                  // Container(
                                  //     padding: EdgeInsets.only(
                                  //         left: 2.7.w,
                                  //         right: 2.7.w,
                                  //         top: 0.4.h,
                                  //         bottom: 0.4.h),
                                  //     decoration: BoxDecoration(
                                  //         color: isDarkMode()
                                  //             ? darkBackgroundColor
                                  //             : white,
                                  //         boxShadow: [
                                  //           BoxShadow(
                                  //               color: grey.withOpacity(0.2),
                                  //               blurRadius: 1.0,
                                  //               offset: const Offset(0, 1),
                                  //               spreadRadius: 1.0)
                                  //         ],
                                  //         borderRadius: BorderRadius.all(
                                  //           Radius.circular(5.h),
                                  //         )),
                                  //     child: Row(
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: () async {
                                  //             data.quantity!.value--;
                                  //             if (data.quantity!.value <= 0) {
                                  //               cartItems.removeAt(index);
                                  //             }

                                  //             await UserPreferences().addToCart(
                                  //               data,
                                  //               -1,
                                  //             );
                                  //             controller
                                  //                     .totalProductList.value =
                                  //                 cartItems.length.toString();
                                  //             controller.calculateFinalPrice(
                                  //                 cartItems);
                                  //             getCartItem();
                                  //             setState(() {});
                                  //           },
                                  //           child: Icon(
                                  //             Icons.remove,
                                  //             size: 3.h,
                                  //           ),
                                  //         ),
                                  //         getDynamicSizedBox(width: 0.8.w),
                                  //         getVerticalDivider(),
                                  //         getDynamicSizedBox(width: 1.8.w),
                                  //         Text(
                                  //           data.quantity.toString(),
                                  //           style: TextStyle(
                                  //             //fontFamily: fontBold,
                                  //             color:
                                  //                 isDarkMode() ? white : black,
                                  //             fontWeight: FontWeight.w600,
                                  //             fontSize: SizerUtil.deviceType ==
                                  //                     DeviceType.mobile
                                  //                 ? 12.sp
                                  //                 : 13.sp,
                                  //           ),
                                  //         ),
                                  //         getDynamicSizedBox(width: 1.8.w),
                                  //         getVerticalDivider(),
                                  //         GestureDetector(
                                  //           onTap: () async {
                                  //             data.quantity!.value += 1;
                                  //             await UserPreferences().addToCart(
                                  //               data,
                                  //               data.quantity!.value,
                                  //             );
                                  //             controller.calculateFinalPrice(
                                  //                 cartItems);
                                  //             setState(() {});
                                  //           },
                                  //           child: Icon(
                                  //             Icons.add,
                                  //             size: 3.h,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
