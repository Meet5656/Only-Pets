import 'package:flutter/material.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

styleTextFormFieldText({isWhite}) {
  logcat("isWHITE::", isWhite.toString());
  return TextStyle(
    fontFamily: fontRegular,
    color: black,
    fontWeight: FontWeight.w300,
    fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 9.sp,
  );
}

styleTextForFieldLabel(usernameNode) {
  return TextStyle(
    fontFamily: fontRegular,
    color: usernameNode.hasFocus ? primaryColor : black,
    fontSize: 12.sp,
  );
}

styleTextForErrorFieldHint() {
  return TextStyle(
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 10.sp,
      fontFamily: fontRegular,
      color: red);
}

styleTextHintFieldLabel({isWhite}) {
  return TextStyle(
      fontFamily: fontRegular,
      fontWeight: FontWeight.w500,
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 9.sp,
      color: const Color.fromARGB(255, 145, 145, 145));
}

styleTextForFieldHintDropDown() {
  return TextStyle(
      fontFamily: fontRegular,
      fontWeight: FontWeight.w500,
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 9.sp,
      color: const Color.fromARGB(255, 145, 145, 145));
}

styleTextForFieldHint() {
  return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 8.sp,
      color: const Color.fromARGB(255, 145, 145, 145));
}

styleTitle() {
  return TextStyle(
      fontFamily: fontExtraBold,
      color: headingTextColor,
      fontWeight: FontWeight.w900,
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 26.sp : 22.sp);
}

styleTitleSubtaxt() {
  return TextStyle(
      fontFamily: fontExtraBold,
      color: headingTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 11.sp);
}

styleForBottomTextOne(context) {
  return TextStyle(
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 8.sp,
      fontWeight: FontWeight.w100,
      fontFamily: fontRegular,
      color: secondaryColor);
}

styleForBottomTextTwo() {
  return TextStyle(
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 8.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontRegular,
      color: secondaryColor);
}

styleDidtReceiveOTP(context) {
  return TextStyle(
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 13.sp : 9.sp,
      fontWeight: FontWeight.w100,
      fontFamily: alegreya,
      color: labelTextColor);
}

styleResentButton() {
  return TextStyle(
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 11.5.sp : 9.sp,
      fontFamily: alegreya,
      color: secondaryColor);
}
