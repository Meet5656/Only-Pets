import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/dialogs.dart';
import 'package:only_pets/Screen/loadingIndicator.dart';
import 'package:only_pets/api_handle/Repository.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/model/UserModel.dart';
import 'package:only_pets/model/loginModel.dart';
import 'package:only_pets/preference/UserPreference.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> signinkey = GlobalKey<FormState>();
  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  RxString getImagePath = "".obs;
  RxBool obsecureText = true.obs;
  RxList imageObjectList = [].obs;
  RxString loginImgPath = "".obs;
  RxString userName = "".obs;
  RxString profilePic = "".obs;
  RxString email = "".obs;
  UserData? getUserData;
  RxBool isGuest = false.obs;

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void setData() async {
    getUserData = await UserPreferences().getSignInInfo();
    isGuest.value = await UserPreferences().getGuestUser();
    if (getUserData != null) {
      userName.value = "${getUserData!.firstName} ${getUserData!.lastName}";
      profilePic.value = ApiUrl.imageUrl + getUserData!.profilePic.toString();
      email.value = getUserData!.emailId;
    }
    update();
  }

  bool states = false;
  final RxInt isDarkModeEnable = 1.obs;
  UserDetailData? loginData;

  Widget getMenuListItem(
      {String icon = "",
      IconData? iconDate,
      String title = "",
      Color? color,
      bool? isDark = false,
      Function? callback}) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical:
                SizerUtil.deviceType == DeviceType.mobile ? 0.6.h : 0.8.h),
        padding: EdgeInsets.symmetric(
            horizontal: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w,
            vertical:
                SizerUtil.deviceType == DeviceType.mobile ? 0.8.h : 0.9.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.h),
          color: tileColour,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: SizerUtil.deviceType == DeviceType.mobile ? 4.5.h : 4.3.h,
              width: SizerUtil.deviceType == DeviceType.mobile ? 4.5.h : 4.3.h,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Padding(
                padding: EdgeInsets.all(1.w),
                child: Icon(
                  iconDate,
                  color: tileColour,
                  size: 2.5.h,
                ),
              ),
            ),
            SizedBox(
              width: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.6.w,
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: SizerUtil.deviceType == DeviceType.mobile
                        ? 13.sp
                        : 12.sp,
                    fontWeight: FontWeight.w600,
                    color: headingTextColor),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: primaryColor,
                  size: 5.w,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void getUserById(context) async {
    UserData? retrievedObject = await UserPreferences().getSignInInfo();
    var loadingIndicator = LoadingProgressDialog();
    loadingIndicator.show(context, '');
    try {
      var response = await Repository.get(
          {}, "${ApiUrl.getUser}/${retrievedObject!.id}",
          allowHeader: true);
      Statusbar().trasparentStatusbarProfile(false);
      loadingIndicator.hide(context);
      logcat("RESPONSE::", response.body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          loginData = UserDetailData.fromJson(responseData['data']);
          userName.value = loginData!.userName.toString();
          profilePic.value = ApiUrl.imageUrl + loginData!.profilePic.toString();
          update();
        } else {
          message.value = responseData['message'];
          showDialogForScreen(
              context, BottomConstant.profile, responseData['message'],
              callback: () {});
        }
      } else {
        state.value = ScreenState.apiError;
        message.value = APIResponseHandleText.serverError;
        showDialogForScreen(
            context, BottomConstant.profile, ServerError.servererror,
            callback: () {});
      }
    } catch (e) {
      logcat("Ecxeption", e);
      state.value = ScreenState.apiError;
      message.value = ServerError.servererror;
      loadingIndicator.hide(context);
    }
  }
}
