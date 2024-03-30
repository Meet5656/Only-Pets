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

class PasswordController extends GetxController {
  final GlobalKey<FormState> passwordkey = GlobalKey<FormState>();
  late TextEditingController numberCtr;
  late FocusNode numberNode;
  var numberModel = ValidationModel(null, null, isValidate: false).obs;
  RxBool isFormInvalidate = false.obs;
  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  final InternetController networkManager = Get.find<InternetController>();

  late FocusNode currentpassNode;
  late FocusNode newpassNode;
  late FocusNode confirmpassNode;

  late TextEditingController currentCtr;
  late TextEditingController newpassCtr;
  late TextEditingController confirmCtr;

  Rx<ScreenState> states = ScreenState.apiLoading.obs;
  RxString mobile = "".obs;

  RxBool isForgotPasswordValidate = false.obs;
  RxBool isObsecureText = true.obs;

  RxBool obsecureOldPasswordText = true.obs;
  RxBool obsecureNewPasswordText = true.obs;
  RxBool obsecureConfirmPasswordText = true.obs;

  @override
  void onInit() {
    numberNode = FocusNode();
    numberCtr = TextEditingController();
    super.onInit();
  }

  void validatePhone(String? val) {
    numberModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = 'Enter Phone Number';
        model.isValidate = false;
      } else if (val.toString().trim().replaceAll(' ', '').length != 10) {
        model!.error = 'Enter Valid Phone Number';
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

  void getForgotOtp(context) async {
    var loadingIndicator = LoadingProgressDialog();
    loadingIndicator.show(context, '');
    try {
      if (networkManager.connectionType == 0) {
        loadingIndicator.hide(context);
        showDialogForScreen(context, LoginConst.signIn, Connection.noConnection,
            callback: () {
          Get.back();
        });
        return;
      }
      var response = await Repository.post({
        "mobile_no": numberCtr.text.toString().trim(),
      }, ApiUrl.getForgotPasswordOtp);
      loadingIndicator.hide(context);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 1) {
          showDialogForScreen(
              context, ForgotPassScreenConstant.title, data['otp'].toString(),
              callback: () {
            Get.to(OtpScreen(
              mobile: numberCtr.text.toString().trim(),
              otp: data['otp'].toString(),
              isFromSignUp: false,
            ));
          });
        } else {
          showDialogForScreen(
              context, ForgotPassScreenConstant.title, data['message'],
              callback: () {});
        }
      } else {
        showDialogForScreen(
            context, ForgotPassScreenConstant.title, ServerError.servererror,
            callback: () {});
      }
    } catch (e) {
      logcat("Exception", e);
      showDialogForScreen(
          context, ForgotPassScreenConstant.title, ServerError.servererror,
          callback: () {});
    }
  }
}
