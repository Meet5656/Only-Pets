import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/EditProfile/EditProfileScreen.dart';
import 'package:only_pets/Screen/OrderScreen/OrderScreen.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/font_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/controller/profile_controller.dart';
import 'package:only_pets/util/helper.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(ProfileController());

  @override
  void initState() {
    controller.setData();
    getUserDataApi();
    super.initState();
  }

  getUserDataApi() async {
    try {
      if (mounted) {
        futureDelay(() {
          controller.getUserById(context);
        });
      }
    } catch (e) {
      logcat("ERROR", e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 4.5.w,
            right: 4.5.w,
          ),
          child: Column(
            children: [
              FadeInDown(
                duration: Duration(milliseconds: 1200),
                child: Center(
                  child: Text(
                    "Profile Screen",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Alegreya",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: FadeInLeft(child: Obx(
                    () {
                      return controller.userName.value.isNotEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                        SizerUtil.deviceType ==
                                                DeviceType.mobile
                                            ? 2
                                            : 3),
                                    decoration: BoxDecoration(
                                      color: transparent,
                                      border: Border.all(
                                        color: black,
                                        width: 1.5, // Set the border width
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(70)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(70)),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          height: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 12.h
                                              : 10.h,
                                          width: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 12.h
                                              : 10.h,
                                          imageUrl: controller.profilePic.value,
                                          placeholder: (context, url) =>
                                              SizedBox(
                                                height: SizerUtil.deviceType ==
                                                        DeviceType.mobile
                                                    ? 8.h
                                                    : 7.h,
                                                width: SizerUtil.deviceType ==
                                                        DeviceType.mobile
                                                    ? 8.h
                                                    : 7.h,
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child:
                                                        CircularProgressIndicator(
                                                            color:
                                                                primaryColor),
                                                  ),
                                                ),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              SvgPicture.asset(
                                                Asset.profile,
                                                fit: BoxFit.cover,
                                                // ignore: deprecated_member_use
                                                color: black,
                                                height: SizerUtil.deviceType ==
                                                        DeviceType.mobile
                                                    ? 8.h
                                                    : 7.h,
                                                width: SizerUtil.deviceType ==
                                                        DeviceType.mobile
                                                    ? 8.h
                                                    : 7.h,
                                              )),
                                    ),
                                  ),
                                  getDynamicSizedBox(width: 4.w),
                                  Text(
                                    controller.userName.value,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: SizerUtil.deviceType ==
                                                DeviceType.mobile
                                            ? 16.sp
                                            : 14.sp,
                                        color: black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: alegreya),
                                  ),
                                  Text(
                                    controller.email.value,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: SizerUtil.deviceType ==
                                                DeviceType.mobile
                                            ? 12.sp
                                            : 10.sp,
                                        color: black,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: alegreya),
                                  ),
                                ])
                          : Container();
                    },
                  )),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Column(
                  children: [
                    controller.getTabs(
                        'Edit Profile', CupertinoIcons.phone_circle_fill, () {
                      Get.to(EditProfileScreen(controller.loginData))!
                          .then((value) {
                        Statusbar().trasparentStatusbarProfile(false);
                        if (value == true) {
                          getUserDataApi();
                        }
                      });
                    }),
                    SizedBox(
                      height: 1.h,
                    ),
                    controller.getTabs('Orders', CupertinoIcons.gift_fill, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderScreen(),
                          ));
                    }),
                    SizedBox(
                      height: 1.h,
                    ),
                    controller.getTabs('Sign out', Icons.logout_outlined, () {
                      PopupDialogs(context, false);
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
