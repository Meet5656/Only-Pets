import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:only_pets/api_handle/apiOtherStates.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/SubCategoryController.dart';
import 'package:only_pets/model/innerSubCategoryModel.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/helper.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SubCategoryScreen extends StatefulWidget {
  SubCategoryScreen({super.key, required this.categoryId});
  String? categoryId;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen>
    with TickerProviderStateMixin {
  var controller = Get.put(SubCategoryController());

  @override
  void initState() {
    controller.tabController =
        TabController(vsync: this, length: 4, initialIndex: 0);
    getApiCall();
    super.initState();
  }

  getApiCall() async {
    futureDelay(() {
      controller.getSubCategoryList(context, widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbarIsNormalScreen();
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            controller.hideKeyboard(context);
          },
          child: Container(
              color: transparent,
              child: Column(children: [
                getForgetToolbar(CategoryScreenConstant.subCategorytitle,
                    callback: () {
                  Get.back();
                }),
                Expanded(
                  child: Obx(() {
                    switch (controller.state.value) {
                      case ScreenState.apiLoading:
                      case ScreenState.noNetwork:
                      case ScreenState.noDataFound:
                      case ScreenState.apiError:
                        return apiOtherStates(controller.state.value,
                            controller, controller.subCategoryList, () {
                          controller.getSubCategoryList(
                              context, widget.categoryId);
                        });
                      case ScreenState.apiSuccess:
                        return apiSuccess(controller.state.value);
                      default:
                        Container();
                    }
                    return Container();
                  }),
                )
              ])),
        ),
      ),
    );
  }

  Widget apiSuccess(ScreenState state) {
    if (state == ScreenState.apiSuccess &&
        controller.subCategoryList.isNotEmpty) {
      return getListViewItem();
    } else {
      return noDataFoundWidget();
    }
  }

  getListViewItem() {
    return DefaultTabController(
        length: controller.subCategoryList.length,
        child: Column(children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 4.w, right: 4.w),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.antiAlias,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < controller.subCategoryList.length; i++)
                  getTab(controller.subCategoryList[i].name,
                      controller.currentPage == i, () {
                    int index = controller.subCategoryList.indexWhere(
                        (category) =>
                            category.name ==
                            controller.subCategoryList[i].name);
                    if (index != -1) {
                      controller.currentPage = index;
                      setState(() {});
                    }
                    if (index >= 0 &&
                        index < controller.subCategoryList.length) {
                      int selectedCategoryId =
                          controller.subCategoryList[index].id;
                      controller.isSelectedSubCategoryId =
                          selectedCategoryId.toString();
                      controller.getInnerSubCategoryList(
                          context, widget.categoryId, selectedCategoryId);
                    }
                  }),
              ],
            ),
          ),
          getDynamicSizedBox(height: 1.h),
          Expanded(child: Container(child: apiResponseUi()))
        ]));
  }

  Widget apiResponseUi() {
    if (controller.isLoading == true) {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 30,
            width: 30,
            child: LoadingAnimationWidget.discreteCircle(
              color: primaryColor,
              size: 35,
            ),
          ),
        ),
      );
    } else if (controller.isLoading.value == false &&
        controller.innerSubCategoryList.isNotEmpty) {
      return MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 5.h, left: 4.w, right: 4.w),
        crossAxisCount: SizerUtil.deviceType == DeviceType.mobile ? 2 : 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          InnerSubCategoryData data = controller.innerSubCategoryList[index];
          return controller.getListItem(
              data, widget.categoryId, controller.isSelectedSubCategoryId);
        },
        itemCount: controller.innerSubCategoryList.length,
      );
    } else {
      return noDataFoundWidget();
    }
  }
}
