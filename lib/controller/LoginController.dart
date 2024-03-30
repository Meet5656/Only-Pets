import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/OtpScreen.dart';
import 'package:only_pets/Screen/dialogs.dart';
import 'package:only_pets/Screen/loadingIndicator.dart';
import 'package:only_pets/api_handle/Repository.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/controller/Internet_controller.dart';
import 'package:only_pets/model/validation_model.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> signinkey = GlobalKey<FormState>();
  late TextEditingController numberCtr, passwordctr;
  late FocusNode numberNode, passNode;
  final InternetController networkManager = Get.find<InternetController>();

  var numberModel = ValidationModel(null, null, isValidate: false).obs;
  var passModel = ValidationModel(null, null, isValidate: false).obs;
  RxBool isFormInvalidate = false.obs;
  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  String getPass = "";
  RxString getImagePath = "".obs;
  RxBool obsecureText = true.obs;
  bool? isVerify;

  @override
  void onInit() {
    numberNode = FocusNode();
    passNode = FocusNode();
    numberCtr = TextEditingController();
    passwordctr = TextEditingController();
    super.onInit();
  }

  RxList imageObjectList = [].obs;
  RxString loginImgPath = "".obs;

  void validatePhone(String? val) {
    numberModel.update((model) {
      if (val == null || val.isEmpty) {
        model!.error = 'Enter Phone Number';
        model.isValidate = false;
      } else if (val.replaceAll(' ', '').length != 10) {
        model!.error = 'Enter 10 digit Number';
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validatePassword(String? val) {
    passModel.update((model) {
      if (val == null || val.toString().trim().isEmpty) {
        model!.error = "Enter Password";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  void enableSignUpButton() {
    if (numberModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void getSignIn(context, String number) async {
    var loadingIndicator = LoadingProgressDialog();
    try {
      if (networkManager.connectionType == 0) {
        loadingIndicator.hide(context);
        showDialogForScreen(context, LoginConst.signIn, Connection.noConnection,
            callback: () {
          Get.back();
        });
        return;
      }
      loadingIndicator.show(context, '');
      logcat('loginPassingData', {
        "mobile_no": int.parse(numberCtr.text)
        // "password": passwordctr.text.toString().trim()
      });

      var response = await Repository.post({
        "mobile_no": int.parse(numberCtr.text)
        //"password": passwordctr.text.toString().trim()
      }, ApiUrl.login, allowHeader: true);
      loadingIndicator.hide(context);
      var data = jsonDecode(response.body);
      logcat("tag", data);
      if (response.statusCode == 200) {
        if (data['status'] == 1) {
          // var loginData = LoginModel.fromJson(data);
          showDialogForScreen(
              context, LoginConst.signIn, data['otp'].toString(), callback: () {
            Get.to(OtpScreen(
              mobile: number.toString().trim(),
              otp: data['otp'].toString(),
              isFromSignUp: true,
            ));
          });
          // UserPreferences().saveSignInInfo(loginData.user);
          // UserPreferences().setToken(loginData.user.token);
          // UserPreferences().setIsGuestUser(false);
          // Get.offAll(const BottomNavScreen());
        } else {
          showDialogForScreen(context, LoginConst.signIn, data['message'],
              callback: () {});
        }
      } else {
        showDialogForScreen(context, LoginConst.signIn, data['message'],
            callback: () {});
      }
    } catch (e) {
      logcat("Exception", e);
      showDialogForScreen(context, LoginConst.signIn, ServerError.servererror,
          callback: () {});
    }
  }

  showDialogForScreen(context, String title, String message,
      {Function? callback, bool? isFromLogin}) {
    showMessage(
        context: context,
        callback: () {
          if (callback != null) {
            callback();
          }
          return true;
        },
        isFromLogin: isFromLogin,
        message: message,
        title: title,
        negativeButton: '',
        positiveButton: Common.continues);
  }
}
