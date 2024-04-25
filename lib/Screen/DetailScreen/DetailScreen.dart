import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:only_pets/Screen/formButton.dart';
import 'package:only_pets/api_handle/apiOtherStates.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/homeDetailController.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/helper.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, this.title, this.isFromTrending, this.categoryList});

  String? title;
  bool? isFromTrending;
  RxList<dynamic>? categoryList;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  var controller = Get.put(HomeDetailScreenController());

  @override
  void initState() {
    controller.animateController = BottomSheet.createAnimationController(this);
    controller.animateController?.duration = const Duration(seconds: 1);
    apiCall(true);
    super.initState();
  }

  apiCall(bool? isFromRefressApi) {
    logcat("isFromTrending", widget.isFromTrending.toString());
    controller.getBrandList(context);
    futureDelay(() {
      if (widget.isFromTrending == true) {
        controller.getProductDetailList(
            context, 0, true, true, isFromRefressApi);
      } else {
        controller.getProductDetailList(
            context, 0, true, false, isFromRefressApi);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbarIsNormalScreen();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: transparent,
          child: Column(children: [
            getForgetToolbar(widget.title, showBackButton: true, callback: () {
              Get.back(result: true);
            }),
            getDynamicSizedBox(height: 1.5.h),
            Expanded(
              child: Stack(
                children: [
                  RefreshIndicator(
                      color: primaryColor,
                      onRefresh: () {
                        return Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            apiCall(true);
                          },
                        );
                      },
                      child: CustomScrollView(
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
                                        height: SizerUtil.height / 1.3,
                                        child: apiOtherStates(
                                            controller.state.value,
                                            controller,
                                            widget.isFromTrending == true
                                                ? controller.trendingList
                                                : controller.popularList, () {
                                          apiCall(true);
                                        }),
                                      );
                                    case ScreenState.apiSuccess:
                                      return apiSuccess(controller.state.value);
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
                                            padding: const EdgeInsets.all(10),
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
          ]),
        ),
      ),
    );
  }

  Widget apiSuccess(ScreenState state) {
    if (widget.isFromTrending == true) {
      if (state == ScreenState.apiSuccess &&
          controller.trendingList.isNotEmpty) {
        return getListViewItem();
      } else {
        return noDataFoundWidget();
      }
    } else {
      if (state == ScreenState.apiSuccess &&
          controller.popularList.isNotEmpty) {
        return getListViewItem();
      } else {
        return noDataFoundWidget();
      }
    }
  }

  Widget getListViewItem() {
    if (controller.isLoading.value == false) {
      if (widget.isFromTrending == true && controller.trendingList.isNotEmpty) {
        return MasonryGridView.count(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          crossAxisCount: SizerUtil.deviceType == DeviceType.mobile ? 2 : 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            CommonProductList model = controller.trendingList[index];
            return Column(
              children: [
                controller.getListItemDetail(context, model, true),
                index == controller.trendingList.length - 1 &&
                        controller.nextPageURL.value.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.only(
                            top: 2.h, left: 25.w, right: 25.w, bottom: 0.8.h),
                        child: getMiniButton(
                          () {
                            controller.isLoading.value = true;
                            controller.currentPage++;
                            controller.getProductDetailList(context,
                                controller.currentPage, true, true, false);
                            setState(() {});
                          },
                          Common.viewMore,
                        ),
                      )
                    : Container()
              ],
            );
          },
          itemCount: controller.trendingList.length,
        );
      } else {
        return MasonryGridView.count(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 3.h, left: 5.w, right: 5.w),
          crossAxisCount: SizerUtil.deviceType == DeviceType.mobile ? 2 : 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            CommonProductList model = controller.popularList[index];
            return Column(
              children: [
                controller.getListItemDetail(context, model, false),
                index == controller.popularList.length - 1 &&
                        controller.nextPageURL.value.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.only(
                            top: 2.h, left: 25.w, right: 25.w, bottom: 0.8.h),
                        child: getMiniButton(
                          () {
                            controller.isLoading.value = true;
                            controller.currentPage++;
                            controller.getProductDetailList(context,
                                controller.currentPage, true, false, false);
                            setState(() {});
                          },
                          Common.viewMore,
                        ),
                      )
                    : Container()
              ],
            );
          },
          itemCount: controller.popularList.length,
        );
      }
    } else {
      return noDataFoundWidget();
    }
  }
}
