import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:only_pets/Screen/EditProfile/EditProfileScreen.dart';
import 'package:only_pets/config/assets_constant.dart';
import 'package:only_pets/config/colors_constant.dart';
import 'package:only_pets/config/statusbar.dart';
import 'package:only_pets/config/toolbar.dart';
import 'package:only_pets/controller/profile_controller.dart';
import 'package:only_pets/util/log.dart';
import 'package:sizer/sizer.dart';
import 'package:only_pets/Screen/LoginScreen.dart';
import 'package:only_pets/Screen/OrderScreen.dart';

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
        await Future.delayed(const Duration(seconds: 1)).then((value) {
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
      statusBarColor: Colors.transparent,
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
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 6.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.w,
                      ),
                      child: Text(
                        "Profile Screen",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            fontFamily: "Alegreya"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: double.infinity,
                height: 12.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: FadeInLeft(child: Obx(
                    () {
                      return controller.userName.value.isNotEmpty
                          ? Row(
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
                                          Radius.circular(50)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          height: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 8.h
                                              : 7.h,
                                          width: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 8.h
                                              : 7.h,
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
                                                child: const Center(
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
                                            ? 15.sp
                                            : 13.sp,
                                        color: black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ])
                          : Container();
                    },
                  )),
                  // Row(
                  //   children: [
                  //     Stack(
                  //       children: [
                  //         Container(
                  //           height: 8.h,
                  //           width: 18.w,
                  //           decoration: BoxDecoration(
                  //               color: Colors.amber,
                  //               borderRadius: BorderRadius.circular(13.w)),
                  //           child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(13.w),
                  //               child: Image.asset(
                  //                 'asset/hand-drawn-paw-prints-background_23-2151132904.jpg',
                  //                 fit: BoxFit.cover,
                  //               )),
                  //         ),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       width: 3.w,
                  //     ),
                  //     Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           controller.userName.value.toString() ?? "User Name",
                  //           style: TextStyle(
                  //             fontFamily: "medium",
                  //             fontSize: 23.sp,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(EditProfileScreen(controller.loginData))!
                            .then((value) {
                          Statusbar().trasparentStatusbarProfile(false);
                          if (value == true) {
                            getUserDataApi();
                          }
                        });
                      },
                      child: Container(
                        height: 7.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.phone_circle_fill,
                                  size: 20.sp, color: Color(0xffc64d4c)),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontFamily: "medium",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                    color: Color(0xffc64d4c)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 2.w,
                      endIndent: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderScreen(),
                            ));
                      },
                      child: Container(
                        height: 7.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.gift_fill,
                                  size: 20.sp, color: Color(0xffc64d4c)),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Orders',
                                    style: TextStyle(
                                        fontFamily: "medium",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp,
                                        color: Color(0xffc64d4c)),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right,
                                  size: 20.sp, color: Color(0xffc64d4c))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 2.w,
                      endIndent: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginscreen(),
                            ));
                      },
                      child: Container(
                        height: 7.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Row(
                            children: [
                              Icon(Icons.logout_outlined,
                                  size: 25.sp, color: Color(0xffc64d4c)),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign out',
                                    style: TextStyle(
                                        fontFamily: "medium",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp,
                                        color: Color(0xffc64d4c)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1.w,
                      indent: 2.w,
                      endIndent: 2.w,
                    ),
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
