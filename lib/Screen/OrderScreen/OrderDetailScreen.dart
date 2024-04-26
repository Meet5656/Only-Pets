import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/OrderDetailController.dart';
import 'package:only_pets/model/OrderModel.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/util/helper.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class OrderDetailScreen extends StatefulWidget {
  OrderDetailScreen({super.key, required this.data});
  OrderData? data;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  var controller = Get.put(OrderDetailScreenController());

  int activeStep = 3;
  double progress = 0.3;

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.3);
    } else {
      setState(() => progress = 0);
    }
  }

  @override
  void initState() {
    controller.orderDetailList.addAll(widget.data!.orderDetails);
    controller.setOrderTotalAmount(widget.data);
    setState(() {});
    super.initState();
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
              Column(children: [
                getForgetToolbar(OrderDetailScreenConstant.title,
                    showBackButton: true, callback: () {
                  Get.back(result: true);
                }),
                getDynamicSizedBox(
                    height: SizerUtil.deviceType == DeviceType.mobile
                        ? 1.0.h
                        : 1.8.h),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 23.h),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        controller.getTitleText(
                            'Order ID:  ${widget.data!.orderId}',
                            isMainTitle: true),
                        //controller.getColorText('Delivered'),
                        controller.getCommonText(
                            'Order Date: ${getFormateDate(widget.data!.dateOfOrder.toString())}'),
                        getDynamicSizedBox(height: 2.h),
                        controller.getTitleText('Your Orders List',
                            isMainTitle: false),
                        getDynamicSizedBox(height: 1.h),
                        SizedBox(
                          child: Obx(
                            () {
                              return controller.orderDetailList.isNotEmpty
                                  ? ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(
                                          left: 4.w, right: 3.0.w),
                                      scrollDirection: Axis.vertical,
                                      clipBehavior: Clip.antiAlias,
                                      itemBuilder: (context, index) {
                                        CommonProductList data =
                                            controller.orderDetailList[index];
                                        return controller.getListItem(data);
                                      },
                                      itemCount:
                                          controller.orderDetailList.length)
                                  : Container();
                            },
                          ),
                        ),
                        getDynamicSizedBox(height: 0.5.h),
                        controller.getTitleText('Delivery Status:',
                            isMainTitle: false),
                        // getDynamicSizedBox(height: 0.5.h),
                        // Container(
                        //   margin: EdgeInsets.only(right: 1.w, bottom: 0.0),
                        //   child: EasyStepper(
                        //     padding: EdgeInsets.only(top: 0.5.h),
                        //     activeStep: activeStep,
                        //     showScrollbar: true,
                        //     lineStyle: LineStyle(
                        //         lineLength: 93,
                        //         lineThickness: 1,
                        //         lineSpace: 5,
                        //         activeLineColor: primaryColor,
                        //         defaultLineColor: grey),
                        //     stepRadius: 20,
                        //     activeStepTextColor: primaryColor,
                        //     finishedStepTextColor: black,
                        //     alignment: Alignment.center,
                        //     unreachedStepIconColor: primaryColor,
                        //     activeStepIconColor: lightGrey,
                        //     finishedStepIconColor: tileColour,
                        //     unreachedStepBorderColor: Colors.black54,
                        //     unreachedStepTextColor: black,
                        //     finishedStepBackgroundColor: primaryColor,
                        //     showLoadingAnimation: false,
                        //     activeStepBorderColor: primaryColor,
                        //     steps: [
                        //       EasyStep(
                        //         icon: const Icon(
                        //           Icons.my_location,
                        //           color: secondaryColor,
                        //         ),
                        //         enabled: true,
                        //         customTitle: Text(
                        //           textAlign: TextAlign.center,
                        //           'Placed',
                        //           style: TextStyle(
                        //               fontFamily: fontBold, fontSize: 10.sp),
                        //         ),
                        //         lineText: '1.7 KM',
                        //       ),
                        //       EasyStep(
                        //         icon: const Icon(CupertinoIcons.cube_box),
                        //         //title: 'On The Way',
                        //         lineText: '3 KM',
                        //         customTitle: Text(
                        //           textAlign: TextAlign.center,
                        //           'On The Way',
                        //           style: TextStyle(
                        //               fontFamily: fontBold, fontSize: 10.sp),
                        //         ),
                        //         enabled: true,
                        //       ),
                        //       EasyStep(
                        //         icon: const Icon(CupertinoIcons.flag),
                        //         customTitle: Text(
                        //           textAlign: TextAlign.center,
                        //           'Completed',
                        //           style: TextStyle(
                        //               fontFamily: fontBold, fontSize: 10.sp),
                        //         ),
                        //         enabled: true,
                        //       ),
                        //     ],
                        //     onStepReached: (index) =>
                        //         setState(() => activeStep = index),
                        //   ),
                        // ),

                        FadeInUp(
                          child: Container(
                            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                            margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(color: grey, width: 0.2.w),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.1),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: controller.getTitleText(
                                    'Delivery Address',
                                    isMainTitle: false,
                                  ),
                                ),
                                getDivider(),
                                getDynamicSizedBox(height: 0.5.h),
                                controller.getCommonText(
                                    controller.userName!.toUpperCase(),
                                    isName: true,
                                    isAddress: true),
                                getDynamicSizedBox(height: 0.5.h),
                                controller.getCommonText(
                                    '${widget.data!.address}. ${widget.data!.shippingAddressPincode}',
                                    isAddress: true),
                                getDynamicSizedBox(height: 0.5.h),
                                controller.getCommonText(
                                    'Delivery Date: ${getFormateDate(widget.data!.dateOfDelivery.toString())}',
                                    isAddress: true),
                                getDynamicSizedBox(height: 0.5.h),
                                controller.getCommonText(
                                    'Delivery Time: ${convert24HourTo12Hour(widget.data!.timeOfDelivery.toString())}',
                                    isAddress: true),
                              ],
                            ),
                          ),
                        ),
                        getDynamicSizedBox(height: 1.h),
                      ],
                    ),
                  ),
                ),
              ]),
              Positioned(
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
                                ? 1.2.h
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  controller.getTitleText('Order Summary'),
                                  getDynamicSizedBox(height: 1.h),
                                  getDivider(),
                                  getDynamicSizedBox(height: 1.h),
                                  controller.getLableText(
                                    'Product Cost',
                                    '${IndiaRupeeConstant.inrCode}${formatPrice(double.parse(controller.finalProductCost.value.toString()))}',
                                    isTotal: false,
                                  ),
                                  getDynamicSizedBox(height: 1.h),
                                  controller.getLableText(
                                    'Shiping Charge',
                                    '+ ${IndiaRupeeConstant.inrCode}${widget.data!.shipingCharge}',
                                    isTotal: false,
                                  ),
                                  getDynamicSizedBox(height: 1.h),
                                  controller.getLableText(
                                    'Discount',
                                    '- ${IndiaRupeeConstant.inrCode}${widget.data!.discount}',
                                    isTotal: false,
                                  ),
                                  getDynamicSizedBox(height: 1.h),
                                  controller.getLableText(
                                    'Total',
                                    '${IndiaRupeeConstant.inrCode}${formatPrice(double.parse(widget.data!.totalAmount))}',
                                    isTotal: true,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
