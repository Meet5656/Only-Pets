import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/form_input.dart';
import 'package:only_pets/config/style.dart';
import 'package:only_pets/controller/LoginController.dart';
import 'package:only_pets/controller/ResetController.dart';
import 'package:only_pets/controller/SignupController.dart';
import 'package:only_pets/controller/changePassword_controller.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomFormField extends StatefulWidget {
  CustomFormField({
    Key? key,
    required this.hintText,
    required this.errorText,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    required this.inputType,
    required this.node,
    this.controller,
    this.formType,
    this.isVerified,
    this.wantSuffix,
    this.isDropdown,
    this.isdown,
    this.isAdd,
    this.isStarting,
    this.isCalender,
    this.onVerifiyButtonClick,
    this.isDataValidated,
    this.onTap,
    this.isReport,
    this.isReadOnly,
    this.isPass,
    this.onAddBtn,
    this.isVisible = true,
    this.isWhite = false,
    this.isAddressField = false,
    this.isReferenceField = false,
    this.isFromAddStory = false,
    this.isEnable = true,
    this.obsecuretext = false,
    this.fromObsecureText,
    this.index,});

  final TextEditingController? controller;
  final String? index;
  final String hintText;
  final String? fromObsecureText;
  final FieldType? formType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final FocusNode node;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final bool? isVerified;
  final Function? onVerifiyButtonClick;
  final bool? wantSuffix;
  final bool? isDropdown;
  final bool? isdown;
  final bool? isAdd;
  final bool? isCalender;
  final bool? isStarting;
  final bool? isDataValidated;
  final bool? isPass;
  final bool? isReport;
  final Function? onTap;
  final Function? onAddBtn;
  bool isEnable = true;
  bool isFromAddStory = false;
  bool isAddressField = false;
  bool isReferenceField = false;
  bool obsecuretext = false;
  bool isVisible = true;
  final bool? isReadOnly;
  final bool? isWhite;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnable,
      readOnly:
          widget.isCalender == true || widget.isReadOnly == true ? true : false,
      cursorColor: primaryColor,
      obscureText: widget.fromObsecureText == "LOGIN"
          ? Get.find<LoginController>().obsecureText.value
          : widget.fromObsecureText == "SIGNUP"
              ? Get.find<SignUpController>().obsecureText.value
              : widget.fromObsecureText == "CHANGEPASS"
                  ? widget.index == "0"
                      ? Get.find<ChangePassController>()
                          .obsecureOldPasswordText
                          .value
                      : widget.index == "1"
                          ? Get.find<ChangePassController>()
                              .obsecureNewPasswordText
                              .value
                          : widget.index == "2"
                              ? Get.find<ChangePassController>()
                                  .obsecureConfirmPasswordText
                                  .value
                              : widget.obsecuretext
                  : widget.fromObsecureText == "RESETPASS"
                      ? widget.index == "0"
                          ? Get.find<ResetpassController>()
                              .obsecureNewPasswordText
                              .value
                          : widget.index == "1"
                              ? Get.find<ResetpassController>()
                                  .obsecureConfirmPasswordText
                                  .value
                              : widget.obsecuretext
                      : widget.obsecuretext,
      obscuringCharacter: '*',
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
      },
      textCapitalization: widget.isReferenceField
          ? TextCapitalization.characters
          : TextCapitalization.none,
      minLines: widget.isAddressField ? 4 : 1,
      maxLines: widget.isAddressField ? 7 : 1,
      textInputAction: widget.isAddressField
          ? TextInputAction.newline
          : TextInputAction.next,
      keyboardType: widget.inputType,
      validator: widget.validator,
      controller: widget.controller,
      textAlignVertical:
          widget.isAddressField ? TextAlignVertical.bottom : null,
      maxLength: widget.inputType == TextInputType.number
          ? 16
          : widget.isReferenceField
              ? 6
              : null,
      style: styleTextFormFieldText(isWhite: widget.isWhite),
      decoration: InputDecoration(
        labelStyle: styleTextForFieldLabel(widget.node),
        contentPadding: EdgeInsets.only(
            left: widget.formType != null &&
                    widget.formType == FieldType.countryCode
                ? 2.w
                : 4.w,
            right: widget.formType != null &&
                    widget.formType == FieldType.countryCode
                ? 2.w
                : 4.w,
            top: SizerUtil.deviceType == DeviceType.mobile ? 1.8.h : 2.5.w,
            bottom: SizerUtil.deviceType == DeviceType.mobile ? 1.8.h : 2.5.w),
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorStyle: styleTextForErrorFieldHint(),
        hintStyle: styleTextHintFieldLabel(isWhite: widget.isWhite),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: inputBorderColor,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: inputBorderColor, width: 1.2),
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
        ),
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: inputBorderColor,
          ),
        ),
        // prefixStyle: styleTextFormFieldText(),
        prefixIcon: widget.formType != null &&
                widget.formType == FieldType.countryCode
            ? Container(
                padding: EdgeInsets.only(
                    left:
                        SizerUtil.deviceType == DeviceType.mobile ? 12 : 3.3.w,
                    bottom: 3,
                    right: SizerUtil.deviceType == DeviceType.mobile ? 3 : 1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("+", style: styleTextFormFieldText()),
                  ],
                ),
              )
            : null,
        prefixIconConstraints:
            const BoxConstraints(minHeight: 25, maxHeight: 30),
        suffixIcon: widget.wantSuffix == true
            ? GestureDetector(
                onTap: () {
                  // onVerifiyButtonClick!();
                },
                child: widget.isDropdown == true
                    ? Row(
                        mainAxisSize: MainAxisSize.min, // added line
                        children: [
                          IconButton(
                            alignment: Alignment.centerRight,
                            onPressed: () {
                              if (widget.onTap != null) widget.onTap!();
                            },
                            padding: EdgeInsets.only(
                                left: widget.isAdd == true ? 14.w : 0),
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            iconSize: SizerUtil.deviceType == DeviceType.mobile
                                ? 30
                                : 40,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          widget.isAdd == true
                              ? IconButton(
                                  onPressed: () {
                                    if (widget.onAddBtn != null) {
                                      widget.onAddBtn!();
                                    }
                                  },
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(
                                      right: SizerUtil.deviceType ==
                                              DeviceType.mobile
                                          ? 2.w
                                          : 3.w),
                                  icon: const Icon(Icons.add),
                                  iconSize:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 25
                                          : 40,
                                  color: Colors.black.withOpacity(0.2),
                                )
                              : Container(),
                        ],
                      )
                    : widget.isCalender == true
                        ? GestureDetector(
                            onTap: () {
                              if (widget.onTap != null) widget.onTap!();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 0.w
                                          : 3.w),
                              child: Icon(Icons.calendar_month,
                                  size:
                                      SizerUtil.deviceType == DeviceType.mobile
                                          ? 25
                                          : 35),
                            ))
                        : GestureDetector(
                            onTap: () {
                              if (widget.fromObsecureText == "LOGIN") {
                                Get.find<LoginController>().obsecureText.value =
                                    !Get.find<LoginController>()
                                        .obsecureText
                                        .value;
                                setState(() {});
                              } else if (widget.fromObsecureText == "SIGNUP") {
                                Get.find<SignUpController>()
                                        .obsecureText
                                        .value =
                                    !Get.find<SignUpController>()
                                        .obsecureText
                                        .value;
                                setState(() {});
                                logcat("SignUpInfoController", widget.index);
                              } else if (widget.fromObsecureText ==
                                  "CHANGEPASS") {
                                if (widget.index == "0") {
                                  Get.find<ChangePassController>()
                                          .obsecureOldPasswordText
                                          .value =
                                      !Get.find<ChangePassController>()
                                          .obsecureOldPasswordText
                                          .value;
                                  setState(() {});
                                  logcat("ResetpassController", widget.index);
                                } else if (widget.index == "1") {
                                  Get.find<ChangePassController>()
                                          .obsecureNewPasswordText
                                          .value =
                                      !Get.find<ChangePassController>()
                                          .obsecureNewPasswordText
                                          .value;
                                  setState(() {});
                                } else {
                                  Get.find<ChangePassController>()
                                          .obsecureConfirmPasswordText
                                          .value =
                                      !Get.find<ChangePassController>()
                                          .obsecureConfirmPasswordText
                                          .value;
                                  setState(() {});
                                }
                              } else if (widget.fromObsecureText ==
                                  "RESETPASS") {
                                if (widget.index == "0") {
                                  Get.find<ResetpassController>()
                                          .obsecureNewPasswordText
                                          .value =
                                      !Get.find<ResetpassController>()
                                          .obsecureNewPasswordText
                                          .value;
                                  setState(() {});
                                } else {
                                  Get.find<ResetpassController>()
                                          .obsecureConfirmPasswordText
                                          .value =
                                      !Get.find<ResetpassController>()
                                          .obsecureConfirmPasswordText
                                          .value;
                                  setState(() {});
                                }
                              } else {
                                _togglePasswordView(context);
                              }
                            },
                            child: widget.isPass == true
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        right: SizerUtil.deviceType ==
                                                DeviceType.mobile
                                            ? 0.w
                                            : 3.w),
                                    child: Icon(
                                      widget.fromObsecureText == "LOGIN"
                                          ? Get.find<LoginController>()
                                                  .obsecureText
                                                  .value
                                              ? Icons.visibility_off
                                              : Icons.visibility
                                          : widget.fromObsecureText == "SIGNUP"
                                              ? Get.find<SignUpController>()
                                                      .obsecureText
                                                      .value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility
                                              : widget.fromObsecureText ==
                                                      "CHANGEPASS"
                                                  ? widget.index == "0"
                                                      ? Get.find<ChangePassController>()
                                                              .obsecureOldPasswordText
                                                              .value
                                                          ? Icons.visibility_off
                                                          : Icons.visibility
                                                      : widget.index == "1"
                                                          ? Get.find<ChangePassController>()
                                                                  .obsecureNewPasswordText
                                                                  .value
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons.visibility
                                                          : widget.index == "2"
                                                              ? Get.find<ChangePassController>()
                                                                      .obsecureConfirmPasswordText
                                                                      .value
                                                                  ? Icons
                                                                      .visibility_off
                                                                  : Icons
                                                                      .visibility
                                                              : widget
                                                                      .obsecuretext
                                                                  ? Icons
                                                                      .visibility_off
                                                                  : Icons
                                                                      .visibility
                                                  : widget.fromObsecureText ==
                                                          "RESETPASS"
                                                      ? widget.index == "0"
                                                          ? Get.find<ResetpassController>()
                                                                  .obsecureNewPasswordText
                                                                  .value
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons.visibility
                                                          : widget.index == "1"
                                                              ? Get.find<ResetpassController>()
                                                                      .obsecureConfirmPasswordText
                                                                      .value
                                                                  ? Icons
                                                                      .visibility_off
                                                                  : Icons
                                                                      .visibility
                                                              : widget
                                                                      .obsecuretext
                                                                  ? Icons
                                                                      .visibility_off
                                                                  : Icons
                                                                      .visibility
                                                      : widget.obsecuretext
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                      color: grey,
                                      size: SizerUtil.deviceType ==
                                              DeviceType.mobile
                                          ? 20.sp
                                          : 15.sp,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      if (widget.onTap != null) {
                                        widget.onTap!();
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 0.w
                                              : 3.w),
                                      child: Icon(
                                        Icons.photo_size_select_actual_outlined,
                                        size: SizerUtil.deviceType ==
                                                DeviceType.mobile
                                            ? 20.sp
                                            : 15.sp,
                                      ),
                                    ),
                                  ),
                          ))
            : Container(
                width: 1,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
    );
  }

  void _togglePasswordView(BuildContext context) {
    setState(() {
      widget.obsecuretext = !widget.obsecuretext;
    });
  }

  void toggleLoginPasswordView(BuildContext context) {
    setState(() {
      widget.obsecuretext = !widget.obsecuretext;
    });
  }
}
