import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:only_pets/api_handle/apiOtherStates.dart';
import 'package:only_pets/componant/button/form_button.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/OrderController.dart';
import 'package:only_pets/model/OrderModel.dart';
import 'package:only_pets/util/enum.dart';
import 'package:sizer/sizer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  var controller = Get.put(OrderScreenController());

  @override
  void initState() {
    controller.tabController =
        TabController(vsync: this, length: 4, initialIndex: 0);
    controller.apiCall(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbarIsNormalScreen();
    return Obx(
      () {
        return Scaffold(
          body: SafeArea(
            child: Container(
              color: transparent,
              child: Column(children: [
                getOrderToolbar(OrderScreenConstant.title,
                    isLoginDone: controller.isLoginDone!.value, () {
                  Get.back();
                }),
                getDynamicSizedBox(
                    height: SizerUtil.deviceType == DeviceType.mobile
                        ? 0.0
                        : 1.0.h),
                Obx(
                  () {
                    return Expanded(
                        child: controller.isGuest!.value != true
                            ? Stack(
                                children: [
                                  RefreshIndicator(
                                      color: primaryColor,
                                      onRefresh: () {
                                        return Future.delayed(
                                          const Duration(seconds: 1),
                                          () {
                                            controller.getOrderList(
                                                context, 0, true,
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
                                                  switch (
                                                      controller.state.value) {
                                                    case ScreenState.apiLoading:
                                                    case ScreenState.noNetwork:
                                                    case ScreenState
                                                          .noDataFound:
                                                    case ScreenState.apiError:
                                                      return SizedBox(
                                                        height:
                                                            SizerUtil.height /
                                                                1.2,
                                                        child: apiOtherStates(
                                                            controller
                                                                .state.value,
                                                            controller,
                                                            controller
                                                                .orderList, () {
                                                          controller
                                                              .getOrderList(
                                                                  context,
                                                                  0,
                                                                  true);
                                                        }),
                                                      );
                                                    case ScreenState.apiSuccess:
                                                      return apiSuccess(
                                                          controller
                                                              .state.value);
                                                    default:
                                                      Container();
                                                  }
                                                  return Container();
                                                }),
                                                if (controller
                                                        .isLoading.value ==
                                                    true)
                                                  SizedBox(
                                                      height: SizerUtil.height,
                                                      width: SizerUtil.width,
                                                      child: Center(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: white,
                                                            ),
                                                            height: 50,
                                                            width: 50,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: LoadingAnimationWidget
                                                                .discreteCircle(
                                                              color:
                                                                  primaryColor,
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
                              )
                            : getEmptyListUi(false,
                                isGuestUser: true, onClick: () {}));
                  },
                )
              ]),
            ),
          ),
        );
      },
    );
  }

  Widget apiSuccess(ScreenState state) {
    if (controller.state.value == ScreenState.apiSuccess &&
        controller.orderList.isNotEmpty) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 2.h, top: 1.h),
        physics: const BouncingScrollPhysics(),
        itemCount: controller.orderList.length,
        clipBehavior: Clip.antiAlias,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          OrderData model = controller.orderList[index];
          return Column(
            children: [
              controller.getOrderListItem(context, model, index),
              index == controller.orderList.length - 1 &&
                      controller.nextPageURL.value.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(
                          top: 2.h, left: 25.w, right: 25.w, bottom: 0.8.h),
                      child: getMiniButton(
                        () {
                          controller.isLoading.value = true;
                          controller.currentPage++;
                          controller.getOrderList(
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
      return SizedBox(
        height: SizerUtil.height / 1.2,
        child: getEmptyListUi(false),
      );
    }
  }
}
