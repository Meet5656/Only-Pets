import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/dialogs.dart';
import 'package:only_pets/Screen/loadingIndicator.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/model/validation_model.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';
import '../api_handle/Repository.dart';

class ChangePassController extends GetxController {
  final changePasskey = GlobalKey<FormState>();

  late FocusNode currentpassNode;
  late FocusNode newpassNode;
  late FocusNode confirmpassNode;

  late TextEditingController currentCtr;
  late TextEditingController newpassCtr;
  late TextEditingController confirmCtr;

  var currentPassModel = ValidationModel(null, null, isValidate: false).obs;
  var newPassModel = ValidationModel(null, null, isValidate: false).obs;
  var confirmPassModel = ValidationModel(null, null, isValidate: false).obs;

  Rx<ScreenState> states = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  RxString mobile = "".obs;

  RxBool isFormInvalidate = false.obs;
  RxBool isForgotPasswordValidate = false.obs;
  RxBool isObsecureText = true.obs;

  RxBool obsecureOldPasswordText = true.obs;
  RxBool obsecureNewPasswordText = true.obs;
  RxBool obsecureConfirmPasswordText = true.obs;

  @override
  void onInit() {
    currentpassNode = FocusNode();
    newpassNode = FocusNode();
    confirmpassNode = FocusNode();

    currentCtr = TextEditingController();
    newpassCtr = TextEditingController();
    confirmCtr = TextEditingController();

    super.onInit();
  }

  void validateCurrentPass(String? val) {
    currentPassModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = ChangPasswordScreenConstant.currentPasswordHint;
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateNewPass(String? val) {
    newPassModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = ChangPasswordScreenConstant.newPasswordHint;
        model.isValidate = false;
      } else if (val.toString().trim().length <= 7) {
        model!.error = ChangPasswordScreenConstant.validPasswordHint;
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
      if (confirmCtr.text.toString().isNotEmpty) {
        if (val.toString().trim() != confirmCtr.text.toString().trim()) {
          confirmPassModel.update((model1) {
            model1!.error = ChangPasswordScreenConstant.notMatchPasswordHint;
            model1.isValidate = false;
          });
        } else {
          confirmPassModel.update((model1) {
            model1!.error = null;
            model1.isValidate = true;
          });
        }
      }
    });

    enableSignUpButton();
  }

  void validateConfirmPass(String? val) {
    confirmPassModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = ChangPasswordScreenConstant.validConfirmPasswordHint;
        model.isValidate = false;
      } else if (val.toString().trim() != newpassCtr.text.toString().trim()) {
        model!.error = ChangPasswordScreenConstant.notMatchPasswordHint;
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateNewPassword(String? val) {
    newPassModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = ResetPasstext.newpass;
        model.isValidate = false;
      } else if (val.toString().trim().length <= 7) {
        model!.error = ChangPasswordScreenConstant.validPasswordHint;
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    if (confirmCtr.text.toString().isNotEmpty) {
      if (val.toString().trim() != confirmCtr.text.toString().trim()) {
        confirmPassModel.update((model1) {
          model1!.error = ChangPasswordScreenConstant.notMatchPasswordHint;
          model1.isValidate = false;
        });
      } else {
        confirmPassModel.update((model1) {
          model1!.error = null;
          model1.isValidate = true;
        });
      }
    }
  }

  void enableSignUpButton() {
    if (currentPassModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (newPassModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (confirmPassModel.value.isValidate == false) {
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

  void getChangePassword(context) async {
    var loadingIndicator = LoadingProgressDialog();
    try {
      showDialogForScreen(
          context, ChangPasswordScreenConstant.title, Connection.noConnection,
          callback: () {
        Get.back();
      });
      loadingIndicator.show(context, '');

      var response = await Repository.post({
        "current_password": currentCtr.text.toString().trim(),
        "password": newpassCtr.text.toString().trim(),
        "confirm_password": confirmCtr.text.toString().trim()
      }, ApiUrl.changePassword, allowHeader: true);
      loadingIndicator.hide(context);
      logcat("PasswordResponse", response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 1) {
          showDialogForScreen(context, ChangPasswordScreenConstant.title,
              data['message'].toString(), callback: () {
            Get.back();
          });
        } else {
          showDialogForScreen(context, ChangPasswordScreenConstant.title,
              data['message'].toString(),
              callback: () {});
        }
      } else {
        states.value = ScreenState.apiError;
        showDialogForScreen(context, ChangPasswordScreenConstant.title,
            data['message'].toString(),
            callback: () {});
      }
    } catch (e) {
      logcat("Exception", e);
      loadingIndicator.hide(context);
    }
  }
}
