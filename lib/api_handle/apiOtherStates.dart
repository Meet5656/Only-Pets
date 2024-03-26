import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:only_pets/componant/button/form_button.dart';
import 'package:only_pets/util/Color.dart';
import 'package:only_pets/util/enum.dart';
import 'package:sizer/sizer.dart';

Widget apiOtherStates(
    state, controller, RxList<dynamic> list, Function onClick) {
  if (state == ScreenState.apiLoading) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
          height: 30,
          width: 30,
          child: LoadingAnimationWidget.discreteCircle(
            color: CustomColors.primaryColor,
            size: 35,
          ),
        ),
      ),
    );
  }

  Widget? button;
  if (list.isEmpty) {
    Container();
  }
  if (state == ScreenState.noDataFound) {
    button = getMiniButton(() {
      Get.back();
    }, "Back");
  }
  if (state == ScreenState.noNetwork) {
    button = getMiniButton(() {
      onClick();
    }, "Try Again");
  }

  if (state == ScreenState.apiError) {
    button = getMiniButton(() {
      Get.back();
    }, "Back");
  }
  return Center(
    child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: controller.message.value.isNotEmpty
            ? Text(
                controller.message.value,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.sp, color: CustomColors.secondaryColor),
              )
            : button),
  );
}
