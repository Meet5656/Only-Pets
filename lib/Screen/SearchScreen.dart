import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:only_pets/api_handle/apiOtherStates.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/SearchScreenController.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/helper.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var controller = Get.put(SearchScreenController());

  @override
  void initState() {
    controller.isSearch = false;
    getApiCall();
    super.initState();
  }

  getApiCall() async {
    futureDelay(() {
      controller.getSearchList(context, controller.searchCtr.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            controller.hideKeyboard(context);
          },
          child: Container(
            color: transparent,
            child: Column(
              children: [
                getForgetToolbar(SearchScreenConstant.title,
                    showBackButton: true, callback: () {
                  Get.back(result: true);
                }),
                getDynamicSizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, left: 5.w),
                  child: TextFormField(
                    controller: controller.searchCtr,
                    onChanged: (text) {},
                    onEditingComplete: () {
                      controller.getSearchList(
                          context, controller.searchCtr.text.toString());
                    },
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.8.h, horizontal: 4.w),
                        hintText: 'Search Data',
                        hintStyle:
                            TextStyle(fontSize: 12.sp, fontFamily: alegreya),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.w))),
                        // disabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.w)))),
                  ),
                ),
                // FadeInDown(
                //   child: AnimatedSize(
                //     duration: const Duration(milliseconds: 300),
                //     child: Obx(() {
                //       return getReactiveFormField(
                //           node: controller.isSearch,
                //           controller: controller.isSearch,
                //           hintLabel: RegistrationConstant.hintUserName,
                //           onChanged: (val) {
                //             //controller.validateFullName(val);
                //           },
                //           obscuretext: false,
                //           inputType: TextInputType.name,
                //           // errorText: controller..value.error,
                //         );
                //     }),
                //   ),
                // ),
                getDynamicSizedBox(height: 2.h),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Stack(children: [
                          Obx(() {
                            switch (controller.state.value) {
                              case ScreenState.apiLoading:
                              case ScreenState.noNetwork:
                              case ScreenState.noDataFound:
                              case ScreenState.apiError:
                                return SizedBox(
                                  height: SizerUtil.height / 1.5,
                                  child: apiOtherStates(controller.state.value,
                                      controller, controller.searchList, () {
                                    controller.getSearchList(context,
                                        controller.searchCtr.text.toString());
                                  }),
                                );
                              case ScreenState.apiSuccess:
                                return apiSuccess(controller.state.value);
                              default:
                                Container();
                            }
                            return Container();
                          }),
                        ]))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget apiSuccess(ScreenState state) {
    if (state == ScreenState.apiSuccess && controller.searchList.isNotEmpty) {
      return MasonryGridView.count(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 3.h, top: 1.h, left: 2.w, right: 2.w),
        crossAxisCount: SizerUtil.deviceType == DeviceType.mobile ? 2 : 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          CommonProductList data = controller.searchList[index];
          return controller.getItemListItem(
              context, data, controller.isGuest!.value);
        },
        itemCount: controller.searchList.length,
      );
    } else {
      return noDataFoundWidget();
    }
  }
}
