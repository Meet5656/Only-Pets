import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/BottomNavBar.dart';
import 'package:only_pets/Screen/formButton.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/config/widget.dart';
import 'package:sizer/sizer.dart';

class CustomRoundedDialog extends StatelessWidget {
  const CustomRoundedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Adjust the radius as needed
      ),
      elevation: 0.0, // No shadow
      backgroundColor: transparent, // Transparent background
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h), // Adjust the margin as needed
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20.0), // Same radius as above
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: const Offset(0, 1),
                    spreadRadius: 3.0)
              ],
            ),
            padding:
                EdgeInsets.only(top: 3.h, bottom: 2.h, left: 4.w, right: 4.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getDynamicSizedBox(height: 4.h),
                Text(
                  AddressScreenTextConstant.orderSuccess,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getDynamicSizedBox(height: 2.h),
                Text(
                  textAlign: TextAlign.center,
                  AddressScreenTextConstant.orderPlaced,
                  style: TextStyle(
                    color: black,
                    fontFamily: fontBold,
                    fontSize: 11.5.sp,
                  ),
                ),
                getDynamicSizedBox(height: 4.h),
                Container(
                  margin: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                  ),
                  child: FadeInUp(
                    from: 50,
                    child: getSecondaryFormButton(() {
                      Navigator.of(context).pop();
                      Get.offAll(const Bottomnavigatorbar());
                    }, Button.continueShopping,
                        isvalidate: true, isFromDialog: true),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: FadeInDown(
              from: 50,
              child: SvgPicture.asset(
                Asset.gift,
                height: SizerUtil.deviceType == DeviceType.mobile ? 15.h : 5.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomCartItemDetailDialog extends StatelessWidget {
  CustomCartItemDetailDialog(
      this.imageUrl, this.title, this.price, this.description,
      {super.key});

  String imageUrl;
  String title;
  String price;
  String description;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Adjust the radius as needed
      ),
      elevation: 0.0, // No shadow
      //clipBehavior: Clip.antiAlias,
      backgroundColor: transparent, // Transparent background
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h), // Adjust the margin as needed
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20.0), // Same radius as above
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: const Offset(0, 1),
                    spreadRadius: 3.0)
              ],
            ),
            padding:
                EdgeInsets.only(top: 3.h, bottom: 2.h, left: 4.w, right: 4.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getDynamicSizedBox(height: 4.h),
                Text(
                  'Product Name: $title',
                  maxLines: 3,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15.sp,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getDynamicSizedBox(height: 0.7.h),
                getRichText('Price: ', '${IndiaRupeeConstant.inrCode}$price'),
                getDynamicSizedBox(height: 0.5.h),
                getRichText('Description: ', description),
                getDynamicSizedBox(height: 2.h),
                Container(
                  margin: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                  ),
                  child: FadeInUp(
                    from: 50,
                    child: getSecondaryFormButton(() {
                      Navigator.of(context).pop();
                    }, Common.continues, isvalidate: true, isFromDialog: true),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: FadeInDown(
              from: 50,
              child: Container(
                //padding: EdgeInsets.all(0.3.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey, // Border color
                    width: 0.8, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      SizerUtil.deviceType == DeviceType.mobile ? 3.w : 2.2.w),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      SizerUtil.deviceType == DeviceType.mobile ? 3.w : 2.2.w),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 15.h,
                    width: 40.w,
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      Asset.productPlaceholder,
                      height: 11.h,
                      fit: BoxFit.cover,
                    ),
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      height: 11.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomLoginAlertRoundedDialog extends StatelessWidget {
  CustomLoginAlertRoundedDialog(this.screenName, {super.key});
  String screenName;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Adjust the radius as needed
      ),
      elevation: 0.0, // No shadow
      backgroundColor: transparent, // Transparent background
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h), // Adjust the margin as needed
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20.0), // Same radius as above
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: const Offset(0, 1),
                    spreadRadius: 3.0)
              ],
            ),
            padding:
                EdgeInsets.only(top: 3.h, bottom: 2.h, left: 4.w, right: 4.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getDynamicSizedBox(height: 4.h),
                Text(
                  LoginDialogText.loginTitle,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getDynamicSizedBox(height: 2.h),
                Text(
                  textAlign: TextAlign.center,
                  LoginDialogText.msg,
                  style: TextStyle(
                    color: black,
                    fontFamily: fontBold,
                    fontSize: 11.5.sp,
                  ),
                ),
                getDynamicSizedBox(height: 4.h),
                Container(
                  margin: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                  ),
                  child: FadeInUp(
                    from: 50,
                    child: getSecondaryFormButton(() {
                      Get.back();
                    }, LoginConst.buttonLabel, isvalidate: true),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 1.5.h,
            child: FadeInDown(
              from: 50,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  Asset.alertLogin,
                  //color: isDarkMode() ? white : black,
                  height:
                      SizerUtil.deviceType == DeviceType.mobile ? 15.h : 10.h,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.5.h,
            right: 2.w,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: FadeInDown(
                  from: 50,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.clear_outlined,
                      color: white,
                      size:
                          SizerUtil.deviceType == DeviceType.mobile ? 3.h : 5.h,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
