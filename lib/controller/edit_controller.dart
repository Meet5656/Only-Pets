import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:only_pets/Screen/dialogs.dart';
import 'package:only_pets/Screen/loadingIndicator.dart';
import 'package:only_pets/api_handle/Repository.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/model/UserModel.dart';
import 'package:only_pets/model/loginModel.dart';
import 'package:only_pets/model/validation_model.dart';
import 'package:only_pets/preference/UserPreference.dart';
import 'package:only_pets/util/enum.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class EditProfileController extends GetxController {
  final GlobalKey<FormState> profilekey = GlobalKey<FormState>();
  late TextEditingController userNamectr,
      phonenumberctr,
      emailCtr,
      dobCtr,
      gederCtr,
      passwordctr;
  late FocusNode phonenumbernode,
      passNode,
      userNameNode,
      dobNode,
      genderNode,
      emailnode;
  var emailModel = ValidationModel(null, null, isValidate: false).obs;
  var passModel = ValidationModel(null, null, isValidate: false).obs;
  var phonemodel = ValidationModel(null, null, isValidate: false).obs;
  var fullnamemodel = ValidationModel(null, null, isValidate: false).obs;
  var dobModel = ValidationModel(null, null, isValidate: false).obs;
  var genderModel = ValidationModel(null, null, isValidate: false).obs;
  RxBool isFormInvalidate = true.obs;
  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  String getPass = "";
  RxString getImagePath = "".obs;
  RxBool obsecureText = true.obs;
  bool? isVerify;
  Rx<File?> avatarFile = null.obs;
  RxString profilePic = "".obs;
  RxString userName = "".obs;
  RxString email = "".obs;
  UserData? getUserData;

  @override
  void onInit() {
    emailnode = FocusNode();
    userNameNode = FocusNode();
    phonenumbernode = FocusNode();
    passNode = FocusNode();
    dobNode = FocusNode();
    genderNode = FocusNode();
    emailCtr = TextEditingController();
    passwordctr = TextEditingController();
    phonenumberctr = TextEditingController();
    userNamectr = TextEditingController();
    dobCtr = TextEditingController();
    gederCtr = TextEditingController();

    super.onInit();
  }

  RxList imageObjectList = [].obs;
  RxString loginImgPath = "".obs;

  RxString selectGender = "".obs;
  DateTime selectedDate = DateTime.now();

  void updateDate(date) {
    dobCtr.text = date;
    update();
  }

  final RxList<String> gender = [
    'Male',
    'Female',
    'Others',
  ].obs;

  initDataSet(UserDetailData? loginData) async {
    getUserData = await UserPreferences().getSignInInfo();
    if (loginData != null) {
      userNamectr.text = loginData.userName!;
      emailCtr.text = loginData.emailId.toString();
      selectGender.value = loginData.gender!.capitalize.toString();
      profilePic.value = ApiUrl.imageUrl + loginData.profilePic.toString();
      logcat("profilePicValue", profilePic.value.toString());
      if (loginData.dateOfBirth.toString() != "null" &&
          loginData.dateOfBirth.toString().trim().isNotEmpty) {
        dobCtr.text = DateFormat(Date.dateFormat)
            .format(DateTime.parse(loginData.dateOfBirth.toString().trim()));
        DateTime inputDate =
            DateFormat("dd-MM-yyyy").parse(dobCtr.text.toString().trim());
        String formattedDateTime =
            DateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(inputDate);
        selectedDate = DateTime.parse(formattedDateTime);
      } else {
        selectedDate = DateTime.now();
      }
      update();
    }
    Statusbar().trasparentStatusbarIsNormalScreen();
    update();
  }

  void validateFullName(String? val) {
    fullnamemodel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Full name";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validatePhone(String? val) {
    phonemodel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Phone Number";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  void validateEmail(String? val) {
    emailModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = "Enter Email Id";
        model.isValidate = false;
      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(emailCtr.text.trim())) {
        model!.error = "Enter Valid Email Id";
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

  void validatedob(String? val) {
    dobModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Date of Birth";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validategender(String? val) {
    genderModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Select a Gender";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void enableSignUpButton() {
    if (fullnamemodel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (emailModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (passModel.value.isValidate == false) {
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

  getImage() {
    return Stack(
      children: [
        Container(
          height: SizerUtil.deviceType == DeviceType.mobile ? 15.h : 10.8.h,
          margin: EdgeInsets.only(right: 2.w),
          width: SizerUtil.deviceType == DeviceType.mobile ? 15.h : 10.8.h,
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: white, width: 1.w),
            borderRadius: BorderRadius.circular(20.w),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.1),
                blurRadius: 5.0,
              )
            ],
          ),
          child: CircleAvatar(
            backgroundColor: black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.w),
              child: avatarFile.value == null && profilePic.value.isNotEmpty
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 30.w,
                      filterQuality: FilterQuality.low,
                      imageUrl: profilePic.value,
                      placeholder: (context, url) => Padding(
                            padding: EdgeInsets.all(10.w),
                            child: const Center(
                              child: CircularProgressIndicator(
                                  color: primaryColor),
                            ),
                          ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                            Asset.profile,
                            fit: BoxFit.cover,
                            // ignore: deprecated_member_use
                            color: white,
                            height: 13.h,
                            width: 13.h,
                          ))
                  : avatarFile.value == null
                      ? SvgPicture.asset(
                          fit: BoxFit.cover,
                          Asset.profile,
                          height: 13.h,
                          width: 13.h,
                          // ignore: deprecated_member_use
                          color: white,
                        )
                      : Image.file(
                          avatarFile.value!,
                          height: 13.h,
                          width: 13.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return SvgPicture.asset(
                              Asset.profile,
                              height: 13.h,
                              width: 13.h,
                            );
                          },
                        ),
            ),
          ),
        ),
        Positioned(
          right: 15,
          bottom: 1.h,
          child: Container(
            height: 3.3.h,
            width: 3.3.h,
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(color: white, width: 0.6.w),
              borderRadius: BorderRadius.circular(100.w),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.1),
                  blurRadius: 5.0,
                )
              ],
            ),
            child: SvgPicture.asset(
              Asset.add,
              height: 12.0.h,
              width: 15.0.h,
              fit: BoxFit.cover,
              // ignore: deprecated_member_use
              color: white,
            ),
          ),
        ),
      ],
    );
  }

  actionClickUploadImage(context) async {
    try {
      await ImagePicker()
          .pickImage(
              source: ImageSource.gallery,
              maxWidth: 1080,
              maxHeight: 1080,
              imageQuality: 100)
          .then((file) async {
        if (file != null) {
          avatarFile = File(file.path).obs;
          profilePic.value = file.path;
          update();
        }
      });
      update();
    } catch (e) {
      logcat("ERROR", e);
    }
  }

  void editProfileApi(context) async {
    var loadingIndicator = LoadingProgressDialog();
    loadingIndicator.show(context, '');
    try {
      // if (networkManager.connectionType == 0) {
      //   loadingIndicator.hide(context);
      //   showDialogForScreen(
      //       context, EditScreenConstant.title, Connection.noConnection,
      //       callback: () {
      //     Get.back();
      //   });
      //   return;
      // }

      String? formattedDate = '';
      if (dobCtr.text.toString().trim().isNotEmpty) {
        DateTime originalDate =
            DateFormat("dd-MM-yyyy").parse(dobCtr.text.toString().trim());
        formattedDate = DateFormat("yyyy-MM-dd").format(originalDate);
      }

      logcat('updatePasssingData', {
        "user_name": userNamectr.text.toString(),
        "email_id": emailCtr.text.toString().trim(),
        "date_of_birth": formattedDate.isNotEmpty ? formattedDate : '',
        "gender": selectGender.value.toString().isNotEmpty
            ? selectGender.value.toString().toLowerCase().trim()
            : '',
      });

      var response = await Repository.multiPartPost({
        "user_name": userNamectr.text.toString(),
        "email_id": emailCtr.text.toString().trim(),
        "date_of_birth": formattedDate.isNotEmpty ? formattedDate : '',
        "gender": selectGender.value.toString().isNotEmpty
            ? selectGender.value.toString().toLowerCase().trim()
            : '',
      }, "${ApiUrl.updateUser}/${getUserData!.id}",
          multiPart:
              avatarFile.value != null && avatarFile.value.toString().isNotEmpty
                  ? http.MultipartFile(
                      'profile_pic',
                      avatarFile.value!.readAsBytes().asStream(),
                      avatarFile.value!.lengthSync(),
                      filename: avatarFile.value!.path.split('/').last,
                    )
                  : null,
          allowHeader: true);
      var responseData = await response.stream.toBytes();
      loadingIndicator.hide(context);
      var result = String.fromCharCodes(responseData);
      var json = jsonDecode(result);
      logcat('UploadRespose', json);
      if (response.statusCode == 200) {
        if (json['status'] == 1) {
          showDialogForScreen(
              context, EditScreenConstant.title, json['message'], callback: () {
            Get.back(result: true);
          });
        } else {
          showDialogForScreen(
              context, EditScreenConstant.title, json['message'],
              callback: () {});
        }
      } else {
        showDialogForScreen(context, EditScreenConstant.title, json['message'],
            callback: () {});
      }
    } catch (e) {
      logcat("Exception", e);
      showDialogForScreen(
          context, EditScreenConstant.title, ServerError.servererror,
          callback: () {});
    }
  }
}
