import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:only_pets/Screen/formButton.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:sizer/sizer.dart';

setActionButton(context, String tag, bool? isEnable,
    {Function? onActionClick, Function? onClick}) {
  return Column(
    children: [
      SizedBox(
        width: SizerUtil.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {
                onActionClick!();
              },
              child: Container(
                margin: EdgeInsets.only(
                  right:
                      SizerUtil.deviceType == DeviceType.mobile ? 5.5.w : 6.w,
                ),
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                  color: white, // Change the background color
                  shape: BoxShape.circle, // Half of the height
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.2),
                        blurRadius: 5.0,
                        offset: const Offset(0, 1),
                        spreadRadius: 2)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: SizerUtil.deviceType == DeviceType.mobile
                          ? 4.h
                          : 3.h, // Size of the icon
                      color: black,
                    ),
                    getDynamicSizedBox(height: 0.1.h),
                    Text(
                      tag,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: black, // Color of the text
                        fontSize: SizerUtil.deviceType == DeviceType.mobile
                            ? 10.sp
                            : 9.sp, // Font size of the text
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      getDynamicSizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile ? 2.h : 1.5.h),
      FadeInUp(
          from: 50,
          child: getAddressButton(() {
            onClick!();
          }, AddressScreenTextConstant.payment, isvalidate: isEnable)),
    ],
  );
}
