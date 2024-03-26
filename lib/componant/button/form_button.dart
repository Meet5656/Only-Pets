import 'package:flutter/material.dart';
import 'package:only_pets/util/Color.dart';
import 'package:sizer/sizer.dart';

getFormButton(Function fun, str, {required bool isWhite}) {
  return InkWell(
    onTap: () {
      fun();
    },
    child: Container(
      padding: EdgeInsets.symmetric(
          vertical: SizerUtil.deviceType == DeviceType.mobile ? 1.4.h : 1.h,
          horizontal: SizerUtil.deviceType == DeviceType.mobile ? 5.h : 6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.h),
          gradient: LinearGradient(
              colors: isWhite == true
                  ? [CustomColors.white, CustomColors.white]
                  : [CustomColors.secondaryColor, CustomColors.primaryColor],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.8, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: Text(
        str,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: isWhite == true
                ? CustomColors.lightPrimaryColor
                : CustomColors.white,
            //fontFamily: fontBold,
            fontWeight: FontWeight.w900,
            fontSize: 11.sp),
      ),
    ),
  );
}

getMiniButton(Function fun, str, {bool? icon}) {
  return InkWell(
    onTap: () {
      fun();
    },
    child: Container(
      height: SizerUtil.deviceType == DeviceType.mobile ? 5.h : 4.5.h,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 1),
      width: SizerUtil.width / 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: CustomColors.primaryColor,
        boxShadow: [
          BoxShadow(
              color: CustomColors.primaryColor.withOpacity(0.2),
              blurRadius: 10.0,
              offset: const Offset(0, 1),
              spreadRadius: 3.0)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            str,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: CustomColors.white,
                //fontFamily: fontBold,
                fontSize:
                    SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 8.sp),
          ),
        ],
      ),
    ),
  );
}
