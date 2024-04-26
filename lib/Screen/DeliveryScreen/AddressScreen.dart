import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:only_pets/Screen/DeliveryScreen/AddAddressScreen.dart';
import 'package:only_pets/api_handle/apiOtherStates.dart';
import 'package:only_pets/componant/button/form_button.dart';
import 'package:only_pets/config/action_button.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/AddressController.dart';
import 'package:only_pets/model/addressModel.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/helper.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AddressScreen extends StatefulWidget {
  AddressScreen(
      {this.shipinCharge,
      this.totaAmount,
      this.discount,
      this.isFromBuyNow,
      this.id,
      super.key});
  String? shipinCharge, totaAmount, discount;
  bool? isFromBuyNow;
  int? id;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  var controller = Get.put(AddressScreenController());

  @override
  void initState() {
    apiCalls();
    controller.getGuestUser();
    super.initState();
  }

  void apiCalls() async {
    // ignore: use_build_context_synchronously
    futureDelay(() {
      controller.getAddressList(context, 0, true);
    });

    if (widget.isFromBuyNow == true) {
      controller.setWidgetData(widget.isFromBuyNow, widget.id);
    } else {
      controller.initData(
          widget.shipinCharge!, widget.totaAmount!, widget.discount!);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbarIsNormalScreen();
    controller.setBuildContext(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: transparent,
          child: Stack(children: [
            Column(
              children: [
                getForgetToolbar(AddressScreenTextConstant.addressTitle,
                    showBackButton: true, callback: () {
                  Get.back();
                }),
                Expanded(
                  child: Stack(
                    children: [
                      RefreshIndicator(
                          color: primaryColor,
                          onRefresh: () {
                            return Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                controller.getAddressList(context, 0, true,
                                    isRefress: true);
                              },
                            );
                          },
                          child: CustomScrollView(
                            physics: const BouncingScrollPhysics(),
                            slivers: [
                              SliverToBoxAdapter(
                                child: Obx(() {
                                  return Stack(children: [
                                    Obx(() {
                                      switch (controller.state.value) {
                                        case ScreenState.apiLoading:
                                        case ScreenState.noNetwork:
                                        case ScreenState.noDataFound:
                                        case ScreenState.apiError:
                                          return SizedBox(
                                            height: SizerUtil.height / 1.2,
                                            child: apiOtherStates(
                                                controller.state.value,
                                                controller,
                                                controller.addressList, () {
                                              controller.getAddressList(
                                                  context, 0, true);
                                            }),
                                          );
                                        case ScreenState.apiSuccess:
                                          return apiSuccess(
                                              controller.state.value);
                                        default:
                                          Container();
                                      }
                                      return Container();
                                    }),
                                    if (controller.isLoading.value == true)
                                      SizedBox(
                                          height: SizerUtil.height,
                                          width: SizerUtil.width,
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: white,
                                                ),
                                                height: 50,
                                                width: 50,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: LoadingAnimationWidget
                                                    .discreteCircle(
                                                  color: primaryColor,
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                          )),
                                  ]);
                                }),
                              )
                            ],
                          )),
                    ],
                  ),
                )
                // Expanded(child: Obx(
                //   () {
                //     return Container(
                //       margin: EdgeInsets.only(bottom: 10.h),
                //       child: ListView.builder(
                //           shrinkWrap: true,
                //           physics: const BouncingScrollPhysics(),
                //           padding: EdgeInsets.only(
                //               top: 1.h, left: 3.w, right: 3.w, bottom: 1.5.h),
                //           clipBehavior: Clip.antiAlias,
                //           itemBuilder: (context, index) {
                //             AddressItem data = controller.addressData[index];
                //             var isSelected = index == controller.currentIndex;
                //             return FadeInUp(
                //               child: Container(
                //                 margin: EdgeInsets.only(
                //                     top: 1.h, left: 4.w, right: 4.w, bottom: 1.h),
                //                 padding: EdgeInsets.only(
                //                     top: 1.5.h,
                //                     left: 4.w,
                //                     right: 4.w,
                //                     bottom: 1.5.h),
                //                 decoration: BoxDecoration(
                //                   color: isDarkMode()
                //                       ? itemDarkBackgroundColor
                //                       : white,
                //                   border: Border.all(
                //                     color: isSelected
                //                         ? primaryColor
                //                         : transparent, // Set the border color here
                //                     width: 2.0, // Set the border width
                //                   ),
                //                   borderRadius:
                //                       const BorderRadius.all(Radius.circular(10)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                         color: isDarkMode()
                //                             ? grey.withOpacity(0.2)
                //                             : grey.withOpacity(0.3),
                //                         spreadRadius: 2,
                //                         blurRadius: 6,
                //                         offset: const Offset(0.3, 0.3)),
                //                   ],
                //                 ),
                //                 child: InkWell(
                //                   onTap: () {
                //                     setState(() {
                //                       controller.currentIndex =
                //                           index; // Select the item
                //                     });
                //                   },
                //                   child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceAround,
                //                     children: [
                //                       Row(
                //                         children: [
                //                           SizedBox(
                //                             width: 60.w,
                //                             child: Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.start,
                //                               children: [
                //                                 Text(
                //                                   data.title.toString(),
                //                                   style: TextStyle(
                //                                       fontSize: SizerUtil
                //                                                   .deviceType ==
                //                                               DeviceType.mobile
                //                                           ? 12.sp
                //                                           : 13.sp,
                //                                       fontFamily: fontBold,
                //                                       fontWeight: FontWeight.bold,
                //                                       color: isDarkMode()
                //                                           ? white
                //                                           : black),
                //                                 ),
                //                                 getDynamicSizedBox(height: 0.5.h),
                //                                 Text(
                //                                   data.address.toString(),
                //                                   style: TextStyle(
                //                                       fontSize: SizerUtil
                //                                                   .deviceType ==
                //                                               DeviceType.mobile
                //                                           ? 11.sp
                //                                           : 13.sp,
                //                                       fontFamily: fontBold,
                //                                       color: lableColor),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                           const Spacer(),
                //                           SizedBox(
                //                             width: 8.w,
                //                             child: Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.center,
                //                               children: [
                //                                 Icon(
                //                                   Icons.mode_edit_rounded,
                //                                   size: 2.6.h,
                //                                 ),
                //                                 Radio(
                //                                   value: index,
                //                                   activeColor: primaryColor,
                //                                   groupValue:
                //                                       controller.currentIndex,
                //                                   onChanged: (value) {
                //                                     setState(() {
                //                                       controller.currentIndex =
                //                                           value as int;
                //                                     });
                //                                   },
                //                                 )
                //                               ],
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       getDynamicSizedBox(height: 0.5.h),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //           itemCount: controller.addressData.length),
                //     );
                //   },
                // ))
              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: SizerUtil.deviceType == DeviceType.mobile ? 3.h : 2.5.h,
                child: Obx(() {
                  return setActionButton(
                    context,
                    AddressScreenTextConstant.add,
                    controller.currentIndex.value == -1 ? false : true,
                    onActionClick: () {
                      Get.to(AddAddressScreen(
                        isFromEdit: false,
                        itemData: null,
                      ))!
                          .then((value) {
                        if (value == true) {
                          controller.getAddressList(context, 0, true,
                              isRefress: true);
                        }
                        Statusbar().trasparentStatusbarIsNormalScreen();
                      });
                    },
                    onClick: () async {
                      controller.openCheckout(widget.isFromBuyNow, widget.id);
                    },
                  );
                }))
          ]),
        ),
      ),
    );
  }

  Widget apiSuccess(ScreenState state) {
    if (state == ScreenState.apiSuccess && controller.addressList.isNotEmpty) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 20.h),
        physics: const BouncingScrollPhysics(),
        itemCount: controller.addressList.length,
        clipBehavior: Clip.antiAlias,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var model = controller.addressList[index] as AddressListItem;
          return Column(
            children: [
              controller.getListItem(context, model, index),
              index == controller.addressList.length - 1 &&
                      controller.nextPageURL.value.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(
                          top: 2.h, left: 25.w, right: 25.w, bottom: 0.8.h),
                      child: getMiniButton(
                        () {
                          controller.isLoading.value = true;
                          controller.currentPage++;
                          controller.getAddressList(
                              context, controller.currentPage, false);
                          setState(() {});
                        },
                        Common.viewMore,
                      ),
                    )
                  : Container()
            ],
          );
        },
      );
    } else {
      return noDataFoundWidget(isFromBlog: true);
    }
  }
}
