import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:marquee/marquee.dart';
import 'package:only_pets/Screen/BottomNavBar.dart';
import 'package:only_pets/config/apicall_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:pinput/pinput.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

Widget getRow(title, desc, {isComplaint = false}) {
  return Container(
    margin: EdgeInsets.only(left: 2.w, right: 2.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.w,
          child: Text(
            title,
            style: TextStyle(
                fontFamily: fontMedium,
                fontSize: 11.sp,
                fontWeight: FontWeight.w900),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
              fontFamily: fontMedium,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 1.w,
        ),
        isComplaint
            ? Expanded(
                child: ReadMoreText(
                  desc,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: TextStyle(
                      fontFamily: fontMedium,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                  lessStyle: TextStyle(
                      color: primaryColor,
                      fontFamily: fontMedium,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold),
                  moreStyle: TextStyle(
                      color: primaryColor,
                      fontFamily: fontMedium,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Expanded(
                child: Text(
                  desc,
                  style: TextStyle(
                      fontFamily: fontMedium,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
      ],
    ),
  );
}

Widget getLoginFooter() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        LoginConst.dontHaveAccount,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: headingTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 11.sp),
      ),
      SizedBox(
        width: 1.h,
      ),
      Text(
        LoginConst.signup,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: headingTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp),
      ),
    ],
  );
}

void showCustomToast(BuildContext context, String message) {
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 10.h,
      width: SizerUtil.width,
      child: Material(
        color: transparent,
        child: Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          padding:
              EdgeInsets.only(top: 1.5.h, bottom: 1.5.h, left: 5.w, right: 5.w),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: white,
                fontSize:
                    SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 10.sp),
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);
  // Close the overlay after a certain duration
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}

Widget getRadio(String title, String groupValue, Function onChange) {
  return RadioListTile(
    activeColor: primaryColor,
    contentPadding: EdgeInsets.only(
        left: SizerUtil.deviceType == DeviceType.mobile ? 5.5.w : 15.w),
    visualDensity: const VisualDensity(horizontal: -4),
    title: Text(
      title,
      style: TextStyle(
          fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 10.sp),
    ),
    value: title,
    groupValue: groupValue,
    onChanged: (value) {
      onChange(value);
    },
  );
}

Widget getFooter(isLogin) {
  return RichText(
    overflow: TextOverflow.clip,
    textAlign: TextAlign.start,
    softWrap: true,
    text: TextSpan(
      text: isLogin == true
          ? LoginConst.dontHaveAccount
          : SignupConstant.haveAnAccount,
      style: TextStyle(
          color: lableColor, fontWeight: FontWeight.w500, fontSize: 11.sp),
      children: [
        TextSpan(
          text: isLogin == true
              ? " ${LoginConst.signup}"
              : " ${LoginConst.signIn}",
          style: TextStyle(
              fontFamily: fontBold,
              color: primaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w800),
        )
      ],
    ),
    // textScaler: const TextScaler.linear(1),
  );
}

Widget getRichText(title, desc) {
  return RichText(
    overflow: TextOverflow.clip,
    textAlign: TextAlign.start,
    softWrap: true,
    maxLines: 16,
    text: TextSpan(
      text: title,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: black,
          fontFamily: fontExtraBold,
          fontSize: 11.sp),
      children: [
        TextSpan(
          text: desc,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontFamily: fontRegular,
              color: black,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400),
        )
      ],
    ),
    //  textScaler: const TextScaler.linear(1),
  );
}

Widget getHomeLable(String title, Function onCLick) {
  return FadeInRight(
    child: Container(
      margin: EdgeInsets.only(left: 3.w, right: 2.w),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                color: black,
                fontFamily: fontBold,
                fontWeight: FontWeight.w800,
                fontSize:
                    SizerUtil.deviceType == DeviceType.mobile ? 16.sp : 13.sp,
              )),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  onCLick();
                },
                child: Text(DashboardText.seeAll,
                    style: TextStyle(
                      color: primaryColor,
                      fontFamily: fontRegular,
                      fontWeight: FontWeight.w500,
                      fontSize: SizerUtil.deviceType == DeviceType.mobile
                          ? 12.sp
                          : 10.sp,
                    )),
              ),
              getDynamicSizedBox(width: 0.3.w),
              Icon(
                Icons.chevron_right_sharp,
                color: primaryColor,
                size: SizerUtil.deviceType == DeviceType.mobile ? 6.w : 5.w,
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget getLable(String title, {bool? isFromFilter}) {
  return FadeInDown(
    child: Container(
      margin: EdgeInsets.only(left: 5.w),
      width: SizerUtil.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.2.h,
          ),
          Text(title,
              style: TextStyle(
                color: black,
                fontFamily: isFromFilter == true ? fontExtraBold : fontBold,
                fontWeight: FontWeight.w500,
                fontSize: isFromFilter == true
                    ? 13.sp
                    : SizerUtil.deviceType == DeviceType.mobile
                        ? 11.sp
                        : 9.sp,
              )),
        ],
      ),
    ),
  );
}

// Widget getLogo(islogo) {
//   return Container(
//     margin: EdgeInsets.only(left: 3.w),
//     child: GestureDetector(
//       onTap: () {
//         islogo();
//       },
//       child: Container(
//           padding: EdgeInsets.only(left: 1.w, right: 1.w),
//           margin: EdgeInsets.only(right: 5.w, left: 4.w),
//           height: 3.5.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//           ),
//           // gradient: LinearGradient(
//           //     colors: [primaryColor, primaryColor.withOpacity(0.5)],
//           //     begin: const FractionalOffset(1.0, 0.0),
//           //     end: const FractionalOffset(0.0, 0.0),
//           //     stops: const [0.0, 1.0],
//           //     tileMode: TileMode.clamp)),
//           child: const Image(image: AssetImage(Asset.logoIcon))),
//     ),
//   );
// }

Widget getPriceLable(String startPrice, String endPrice) {
  return Container(
    margin: EdgeInsets.only(left: 5.5.w),
    width: SizerUtil.width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Prices: ',
            style: TextStyle(
              color: black,
              fontFamily: fontBold,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            )),
        // getDynamicSizedBox(width: 1.w),
        Text("${IndiaRupeeConstant.inrCode}$startPrice",
            style: TextStyle(
              color: primaryColor,
              fontFamily: fontBold,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            )),
        Text("-",
            style: TextStyle(
              color: primaryColor,
              fontFamily: fontRegular,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            )),
        Text("${IndiaRupeeConstant.inrCode}$endPrice",
            style: TextStyle(
              color: primaryColor,
              fontFamily: fontBold,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            )),
      ],
    ),
  );
}

Widget getComplaintRow(title, desc) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontFamily: fontMedium,
            fontSize: 11.sp,
            fontWeight: FontWeight.w900),
      ),
      Text(
        ":",
        style: TextStyle(
            fontFamily: fontMedium,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        width: 1.w,
      ),
      ReadMoreText(
        desc,
        trimLines: 3,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        style: TextStyle(
            fontFamily: fontMedium,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400),
        lessStyle: TextStyle(
            color: primaryColor,
            fontFamily: fontMedium,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold),
        moreStyle: TextStyle(
            color: primaryColor,
            fontFamily: fontMedium,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget getCommonContainer(title, isFromAddCart, icon,
    {Function? addCartClick, Function? buyNowClick, bool? isEnable}) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        isFromAddCart == true ? addCartClick!() : buyNowClick!();
      },
      child: Container(
        decoration: BoxDecoration(
          color: isFromAddCart == true ? secondaryColor : white,
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.6),
              blurRadius: 2.0, // Adjust the blur radius as needed
              offset:
                  const Offset(0, -2), // Negative offset to create a top shadow
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: isFromAddCart == true
                ? Radius.circular(7.w)
                : const Radius.circular(0),
            topRight: isFromAddCart == true
                ? const Radius.circular(0)
                : Radius.circular(7.w),
          ),
        ),
        padding: EdgeInsets.only(top: 1.8.h, bottom: 1.8.h),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: black,
              ),
              getDynamicSizedBox(width: 2.w),
              Text(
                title,
                style: TextStyle(
                  color: black,
                  fontFamily: fontBold,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.5.sp,
                ),
              ),
            ]),
      ),
    ),
  );
}

Widget getAddToCartBtn(title, icon,
    {Function? addCartClick, RxBool? isAddToCartClicked, bool? isEnable}) {
  return GestureDetector(
    onTap: () {
      addCartClick!();
    },
    child: Container(
      decoration: BoxDecoration(
        color: isAddToCartClicked != null && isAddToCartClicked.value == true
            ? grey
            : bottomNavBackground,
        borderRadius: BorderRadius.all(
          Radius.circular(7.w),
        ),
      ),
      margin: EdgeInsets.only(left: 0.2.w, right: 0.2.w),
      padding:
          EdgeInsets.only(top: 0.6.h, bottom: 0.6.h, left: 1.5.w, right: 1.5.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 1.5.h,
            color: black,
          ),
          getDynamicSizedBox(width: 0.5.w),
          Text(
            title,
            style: TextStyle(
              color: black,
              fontFamily: fontBold,
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    ),
  );
}

// getGuestUserAlertDialog(BuildContext context, String screenName) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return CustomLoginAlertRoundedDialog(
//           screenName); // Use your custom dialog widget
//     },
//   );
// }

// getGuestUserAlertDialog(BuildContext context, String screenName) async {
//   return await showGeneralDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//     barrierColor: Colors.black54,
//     transitionDuration: const Duration(milliseconds: 600),
//     pageBuilder: (BuildContext buildContext, Animation<double> animation,
//         Animation<double> secondaryAnimation) {
//       return Align(
//         alignment: Alignment.bottomCenter,
//         child: CustomLoginAlertRoundedDialog(screenName),
//       );
//     },
//     transitionBuilder: (BuildContext buildContext, Animation<double> animation,
//         Animation<double> secondaryAnimation, Widget child) {
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(0, 1),
//           end: Offset.zero,
//         ).animate(animation),
//         child: child,
//       );
//     },
//   );
// }

getTab(String str, bool isSelected, Function onCLick) {
  return GestureDetector(
    onTap: () {
      onCLick();
    },
    child: AnimatedContainer(
      width: 25.w,
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(
        top: 1.h,
        bottom: 1.5.h,
        left: SizerUtil.deviceType == DeviceType.mobile ? 1.2.w : 1.0.w,
        right: SizerUtil.deviceType == DeviceType.mobile ? 1.2.w : 1.0.w,
      ),
      padding: EdgeInsets.only(
          top: SizerUtil.deviceType == DeviceType.mobile ? 1.5.h : 1.h,
          bottom: SizerUtil.deviceType == DeviceType.mobile ? 1.5.h : 1.h,
          left: 1.2.w,
          right: 1.2.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0.1,
            color: black.withOpacity(.1),
          )
        ],
        border: Border.all(
          color: grey, // Border color
          width: 0.2, // Border width
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: str.length > 9
            ? SizedBox(
                height:
                    SizerUtil.deviceType == DeviceType.mobile ? 2.2.h : 3.1.h,
                child: Marquee(
                  style: TextStyle(
                    fontFamily: fontBold,
                    color: isSelected ? white : black,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                  ),
                  text: str,
                  scrollAxis: Axis
                      .horizontal, // Use Axis.vertical for vertical scrolling
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Adjust as needed
                  blankSpace: 20.0, // Adjust the space between text repetitions
                  velocity: 50.0, // Adjust the scrolling speed
                  pauseAfterRound: const Duration(
                      seconds: 1), // Time to pause after each scroll
                  startPadding: 2.0, // Adjust the initial padding
                  accelerationDuration:
                      const Duration(seconds: 1), // Duration for acceleration
                  accelerationCurve: Curves.linear, // Acceleration curve
                  decelerationDuration: const Duration(
                      milliseconds: 500), // Duration for deceleration
                  decelerationCurve: Curves.easeOut, // Deceleration curve
                ),
              )
            : Text(
                str,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 11.sp,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: fontBold,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? white : black,
                ),
              ),
      ),
    ),
  );
}

getPinTheme() {
  return PinTheme(
    width: 56,
    height: 60,
    textStyle: TextStyle(
      fontFamily: fontMedium,
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 18.sp : 16.sp,
      color: const Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(222, 231, 240, .57),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: transparent),
    ),
  );
}

Widget getCounterUi() {
  return Container(
      padding:
          EdgeInsets.only(left: 2.7.w, right: 2.7.w, top: 0.4.h, bottom: 0.4.h),
      decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.2),
                blurRadius: 1.0,
                offset: const Offset(0, 1),
                spreadRadius: 1.0)
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5.h),
          )),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // if (data.quantity.value > 1) {
              //   data.quantity--;
              // }
              // update();
            },
            child: Icon(
              Icons.remove,
              size: 3.h,
            ),
          ),
          getDynamicSizedBox(width: 0.8.w),
          getVerticalDivider(),
          getDynamicSizedBox(width: 1.8.w),
          Text(
            "data.quantity.toString()",
            style: TextStyle(
              //fontFamily: fontBold,
              color: black,
              fontWeight: FontWeight.w600,
              fontSize:
                  SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 13.sp,
            ),
          ),
          getDynamicSizedBox(width: 1.8.w),
          getVerticalDivider(),
          GestureDetector(
            onTap: () {
              // data.quantity++;
            },
            child: Icon(
              Icons.add,
              size: 3.h,
            ),
          ),
        ],
      ));
}

Widget cartIncDecUi({String? qty, Function? increment, Function? decrement}) {
  return Container(
    padding:
        EdgeInsets.only(left: 2.5.w, right: 2.5.w, top: 0.3.h, bottom: 0.3.h),
    decoration: BoxDecoration(
        color: darkGrey,
        boxShadow: [
          BoxShadow(
              color: grey.withOpacity(0.2),
              blurRadius: 1.0,
              offset: const Offset(0, 1),
              spreadRadius: 1.0)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(5.h),
        )),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            decrement!();
          },
          child: Icon(
            Icons.remove,
            size: 2.h,
            color: black,
          ),
        ),
        getDynamicSizedBox(width: 0.8.w),
        getVerticalDivider(),
        getDynamicSizedBox(width: 1.5.w),
        Text(
          qty.toString(),
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w600,
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 13.sp,
          ),
        ),
        getDynamicSizedBox(width: 2.w),
        getVerticalDivider(),
        getDynamicSizedBox(width: 0.5.w),
        GestureDetector(
          onTap: () async {
            increment!();
          },
          child: Icon(
            Icons.add,
            size: 2.h,
            color: black,
          ),
        ),
      ],
    ),
  );
}

Widget homeCartIncDecUi(
    {String? qty,
    Function? increment,
    Function? decrement,
    bool? isFromPopular}) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(
          left: isFromPopular == true ? 3.w : 1.w,
          right: isFromPopular == true ? 3.w : 1.w),
      padding: EdgeInsets.only(
          left: isFromPopular == true ? 3.w : 1.0.w,
          right: isFromPopular == true ? 3.w : 1.0.w,
          top: 0.2.h,
          bottom: 0.2.h),
      decoration: BoxDecoration(
          color: darkGrey,
          boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.2),
                blurRadius: 1.0,
                offset: const Offset(0, 1),
                spreadRadius: 1.0)
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5.h),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () async {
              decrement!();
            },
            child: Icon(
              Icons.remove,
              size: 3.h,
              color: black,
            ),
          ),
          getDynamicSizedBox(width: isFromPopular == true ? 0.5.w : 1.w),
          getVerticalDivider(),
          getDynamicSizedBox(width: isFromPopular == true ? 0.5.w : 1.w),
          Text(
            qty.toString(),
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
              fontSize:
                  SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 13.sp,
            ),
          ),
          getDynamicSizedBox(width: isFromPopular == true ? 0.5.w : 2.w),
          getVerticalDivider(),
          getDynamicSizedBox(width: isFromPopular == true ? 1.w : 2.w),
          GestureDetector(
            onTap: () async {
              increment!();
            },
            child: Icon(
              Icons.add,
              size: 3.h,
              color: black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cartIncrDcrUi(
    {String? qty,
    Function? incrementOnTap,
    Function? decrementOnTap,
    bool? isFromPopular}) {
  return Container(
    padding: EdgeInsets.only(
        left: SizerUtil.deviceType == DeviceType.mobile ? 2.7.w : 2.5.w,
        right: SizerUtil.deviceType == DeviceType.mobile ? 2.7.w : 2.5.w,
        top: 0.4.h,
        bottom: 0.4.h),
    decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
              color: grey.withOpacity(0.2),
              blurRadius: 1.0,
              offset: const Offset(0, 1),
              spreadRadius: 1.0)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(5.h),
        )),
    child: Row(
      children: [
        GestureDetector(
          onTap: () async {
            decrementOnTap!();
          },
          child: Icon(
            Icons.remove,
            size: 3.h,
          ),
        ),
        getDynamicSizedBox(
            width: SizerUtil.deviceType == DeviceType.mobile ? 0.8.w : 1.w),
        getVerticalDivider(),
        getDynamicSizedBox(
            width: SizerUtil.deviceType == DeviceType.mobile ? 1.8.w : 2.w),
        Text(
          qty!,
          style: TextStyle(
              color: black, fontWeight: FontWeight.w600, fontSize: 12.sp),
        ),
        getDynamicSizedBox(
            width: SizerUtil.deviceType == DeviceType.mobile ? 1.8.w : 2.w),
        getVerticalDivider(),
        getDynamicSizedBox(
            width: SizerUtil.deviceType == DeviceType.mobile ? 1.8.w : 1.w),
        GestureDetector(
          onTap: () async {
            incrementOnTap!();
          },
          child: Icon(
            Icons.add,
            size: 3.h,
          ),
        ),
      ],
    ),
  );
}

Widget noDataFoundWidget({bool? isFromBlog}) {
  return SizedBox(
    height:
        isFromBlog == true ? SizerUtil.height / 1.4 : SizerUtil.height / 1.2,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Common.datanotfound,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: fontMedium, fontSize: 12.sp, color: black),
          ),
        ],
      ),
    ),
  );
}

Widget homeOfferBanner(String item) {
  return Container(
    width: SizerUtil.deviceType == DeviceType.mobile
        ? SizerUtil.width / 1 - 30
        : SizerUtil.width / 1 - 50,
    height: 15.h,
    padding: EdgeInsets.all(0.2.h),
    margin: EdgeInsets.only(
      right: 4.w,
      bottom: 0.5.h,
    ),
    decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
              color: grey,
              blurRadius: 1.0,
              offset: const Offset(0, 2),
              spreadRadius: 0.5)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(2.h),
        )),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(2.h)),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: 15.h,
        imageUrl: ApiUrl.imageUrl + item.toString(),
        placeholder: (context, url) => SizedBox(
          height: 15.h,
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: primaryColor),
            ),
          ),
        ),
        // errorWidget: (context, url, error) => SvgPicture.asset(
        //       Asset.productPlaceholder,
        //       fit: BoxFit.cover,
        //       // ignore: deprecated_member_use
        //       color: black,
        //     )
      ),
    ),

    //  ClipRRect(
    //     borderRadius: BorderRadius.circular(2.h),
    //     child: Image.asset(
    //       Asset.homeBanner,
    //       fit: BoxFit.cover,
    //     )),
  );
}

Widget getBannerLeftRightSwiper(isLeft) {
  return Positioned(
    left: isLeft == true ? 0 : null,
    right: isLeft == true ? null : 0,
    top: 0,
    bottom: 0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10.h,
          width: 10.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: white,
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: lightGreyBlueColor),
            child: Icon(
              color: secondaryColor,
              isLeft == true
                  ? Icons.chevron_left_sharp
                  : Icons.chevron_right_sharp,
              size: 5.h,
            ),
          ),
        ),
      ],
    ),
  );
}

// Widget getPoliciesWeb(String text, String icon) {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//         height: 5.h,
//         width: 5.w,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: bgprimaryColor,
//         ),
//         padding: EdgeInsets.all(1.4.h),
//         child: SvgPicture.asset(
//           icon,
//         ),
//       ),
//       getDynamicSizedBox(width: 0.5.w),
//       Text(
//         text,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             fontFamily: fontBold,
//             color: headingTextColor,
//             fontWeight: FontWeight.w500,
//             fontSize: 4.sp),
//       ),
//     ],
//   );
// }

Widget getDivider() {
  return Divider(
    height: 0.1.h,
    color: grey,
  );
}

Widget headerDivider() {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: grey,
    ),
    height: 5.h,
    width: 0.1.w,
  );
}

// Widget getHomeLableWeb(String title, Function onCLick) {
//   return FadeInRight(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(title,
//                 style: TextStyle(
//                   color: isDarkMode() ? white : black,
//                   fontFamily: fontBold,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 6.sp,
//                 )),
//             const Spacer(),
//             GestureDetector(
//               onTap: () {
//                 onCLick();
//               },
//               child: Text(Common.viewAll,
//                   style: TextStyle(
//                     color: isDarkMode() ? white : primaryColor,
//                     fontFamily: fontRegular,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 4.sp,
//                   )),
//             ),
//             getDynamicSizedBox(width: 0.3.w),
//             Icon(
//               Icons.chevron_right_sharp,
//               color: isDarkMode() ? white : secondaryColor,
//               size: 4.h,
//             )
//           ],
//         ),
//         getDynamicSizedBox(height: 1.h),
//         getBgDividerWeb(lineColor)
//       ],
//     ),
//   );
// }

// getBgDividerWeb(Color? selectedColor, {size}) {
//   return Container(
//     width: size,
//     height: 0.3.h,
//     decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(15)),
//         color: selectedColor),
//   );
// }

// Widget getFooterLogoWeb() {
//   return FadeInLeft(
//     child: SvgPicture.asset(
//       Asset.logo,
//       width: 120,
//     ),
//   );
// }

// Widget footerCommonUi(title, List<FooterModel> list, selectedSize,
//     {isContactList}) {
//   return SizedBox(
//     width: 20.w,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           textAlign: TextAlign.start,
//           style: TextStyle(
//             fontSize: 4.sp,
//             color: isDarkMode() ? white : black,
//             fontFamily: fontBold,
//             fontStyle: FontStyle.normal,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         getBgDividerWeb(black, size: selectedSize),
//         getDynamicSizedBox(height: 2.h),
//         Expanded(
//           child: ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               clipBehavior: Clip.antiAlias,
//               itemBuilder: (context, index) {
//                 FooterModel data = list[index];
//                 return isContactList == true
//                     ? footerContactItem(data.title, data.subTitle, data.icon)
//                     : footerItem(data.title);
//               },
//               itemCount: list.length),
//         )
//       ],
//     ),
//   );
// }

getEmptyListUi(bool? isFromSaved, {bool? isGuestUser, Function? onClick}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            isGuestUser == true
                ? isFromSaved == true
                    ? SavedScreenText.informLoginFromFavText
                    : SavedScreenText.informLoginFromOrderText
                : isFromSaved == true
                    ? SavedScreenText.emptyList
                    : OrderScreenConstant.emptyList,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: fontMedium, fontSize: 12.sp, color: black)),
        SizedBox(height: 1.h),
        FadeInUp(
          from: 30,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(black)),
            onPressed: () {
              if (isGuestUser == true) {
                onClick!();
              } else {
                Get.to(Bottomnavigatorbar());
                //Get.to(const CategoryScreen())!.then((value) {});
              }

              // if (isFromSaved == true) {
              //   Get.to(const CategoryScreen())!.then((value) {});
              // } else {
              //   Get.to(DetailScreen())!.then((value) {});
              // }
            },
            child: Text(
                isGuestUser == true
                    ? LoginConst.buttonLabel
                    : SavedScreenText.exoploreCategory,
                // isFromSaved == true
                //     ? SavedScreenText.exoploreCategory
                //     : OrderScreenConstant.exoploreProduct,
                style: TextStyle(
                    fontFamily: fontMedium, fontSize: 12.sp, color: white)),
          ),
        ),
      ],
    ),
  );
}

Widget footerItem(title) {
  return Padding(
    padding: EdgeInsets.only(top: 1.h),
    child: Row(
      children: [
        Container(
          height: 0.5.h,
          width: 0.5.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: black,
          ),
        ),
        getDynamicSizedBox(width: 1.w),
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 3.sp,
            color: black,
            fontFamily: fontBold,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
}

// Widget footerContactItem(title, subTitle, icon) {
//   return Padding(
//     padding: EdgeInsets.only(top: 1.h),
//     child: Row(
//       children: [
//         SvgPicture.asset(icon, fit: BoxFit.cover, width: 3.h),
//         getDynamicSizedBox(width: 0.5.w),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 fontSize: 3.sp,
//                 color: isDarkMode() ? white : black,
//                 fontFamily: fontBold,
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//             getDynamicSizedBox(height: 0.2.h),
//             Text(
//               subTitle,
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 fontSize: 3.sp,
//                 color: isDarkMode() ? white : black,
//                 fontFamily: fontBold,
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
