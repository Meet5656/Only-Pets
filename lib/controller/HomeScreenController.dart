import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_pets/api_handle/Repository.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/model/UpdateDashboardModel.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';

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
  @override
  void onInit() {
    searchCtr = TextEditingController();
    super.onInit();
  }

  void getHome(context) async {
    state.value = ScreenState.apiLoading;
    try {
      // if (networkManager.connectionType == 0)  {
      //   showDialogForScreen(
      //       context, BottomConstant.home, Connection.noConnection,
      //       callback: () {
      //     Get.back();
      //   });
      //   return;
      // }
      var response =
          await Repository.get({}, ApiUrl.getHome, allowHeader: true);
      logcat("HOME_RESPONSE::", response.body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          state.value = ScreenState.apiSuccess;
          message.value = '';
          homeData = HomeModel.fromJson(responseData);
          topItemList.clear();
          bannerList.clear();

          if (homeData!.data.bannerList.isNotEmpty) {
            bannerList.addAll(homeData!.data.bannerList);
            update();
          }

          if (homeData!.data.topList.isNotEmpty) {
            topItemList.addAll(homeData!.data.topList);
            update();
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
        }
      } else {
        state.value = ScreenState.apiError;
        message.value = 'There is error from the server';
      }
    } catch (e) {
      logcat("Ecxeption", e);
      state.value = ScreenState.apiError;
      message.value = "Server Error";
    }
  }
}
