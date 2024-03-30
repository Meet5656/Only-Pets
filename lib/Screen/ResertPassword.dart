import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:only_pets/Screen/OtpScreen.dart';
import 'package:only_pets/Screen/formButton.dart';
import 'package:only_pets/config/form_input.dart';
import 'package:only_pets/config/string_constant.dart';
import 'package:only_pets/config/style.dart';
import 'package:only_pets/config/widget.dart';
import 'package:only_pets/controller/resetPassword_controller.dart';
import 'package:only_pets/util/Color.dart';

class resertpassword extends StatefulWidget {
  const resertpassword({super.key});

  @override
  State<resertpassword> createState() => _resertpasswordState();
}

class _resertpasswordState extends State<resertpassword> {
  var controller = Get.put(PasswordController());

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: CustomColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: controller.passwordkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInDown(
                  child: Text(
                    ForgotPassScreenConstant.title,
                    style: styleTitle(),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                FadeInDown(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 1.6.h),
                    child: Text(
                      ForgotPassScreenConstant.desc,
                      style: styleTitleSubtaxt(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                getLable(LoginConst.phonenumber),
                FadeInDown(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: Obx(() {
                      return getReactiveFormField(
                          node: controller.numberNode,
                          controller: controller.numberCtr,
                          hintLabel: LoginConst.number,
                          onChanged: (val) {
                            controller.validatePhone(val);
                          },
                          obscuretext: false,
                          inputType: TextInputType.number,
                          errorText: controller.numberModel.value.error);
                    }),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                  ),
                  child: FadeInUp(
                    from: 50,
                    child: Obx(() {
                      return getSecondaryFormButton(() {
                        if (controller.isFormInvalidate.value == true) {
                          controller.getForgotOtp(
                            context,
                          );
                        }
                      },
                          isFromCart: true,
                          ForgotPassScreenConstant.btnLable,
                          isvalidate: controller.isFormInvalidate.value);
                    }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 1.0)
        ],
      ),

      // Form(
      //   key: _formkey,
      //   child: GestureDetector(
      //     onTap: () {
      //       FocusScope.of(context).unfocus();
      //     },
      //     child: Stack(
      //       children: [
      //         Positioned(
      //           top: 0,
      //           left: 0,
      //           right: 0,
      //           child: FadeInDown(
      //             duration: Duration(milliseconds: 700),
      //             child: Container(
      //               height: 20.h,
      //               width: double.infinity,
      //               decoration: BoxDecoration(
      //                   image: DecorationImage(
      //                       image: AssetImage(
      //                           "asset/hand-drawn-paw-prints-background_23-2151132904.jpg"),
      //                       fit: BoxFit.cover)),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(top: 20.h),
      //           child: FadeInUp(
      //             duration: Duration(milliseconds: 700),
      //             child: Container(
      //               height: double.infinity,
      //               width: double.infinity,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.only(
      //                     topLeft: Radius.circular(10.w),
      //                     topRight: Radius.circular(10.w)),
      //               ),
      //               child: SingleChildScrollView(
      //                 child: Column(
      //                   children: [
      //                     Image.asset(
      //                       "asset/all pets/7070629_3293465.jpg",
      //                       width: 35.h,
      //                     ),
      //                     Align(
      //                       alignment: Alignment.topLeft,
      //                       child: Padding(
      //                         padding: EdgeInsets.only(left: 6.w),
      //                         child: Container(
      //                           child: Text(
      //                             "Reset Password",
      //                             style: TextStyle(
      //                               fontSize: 30.dp,
      //                               fontFamily: "Alegreya",
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     Align(
      //                       alignment: Alignment.topLeft,
      //                       child: Padding(
      //                         padding: EdgeInsets.only(left: 6.w, top: 0.3.h),
      //                         child: Text(
      //                           "Entera new password",
      //                           style: TextStyle(
      //                               fontSize: 18.dp,
      //                               fontWeight: FontWeight.w400,
      //                               fontFamily: "Alegreya"),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 2.h,
      //                     ),
      //                     Padding(
      //                       padding: EdgeInsets.only(left: 6.w, right: 6.w),
      //                       child: Container(
      //                         child: TextFormField(
      //                           style: TextStyle(
      //                               fontFamily: "medium", fontSize: 17.dp),
      //                           obscureText: confirmpassword,
      //                           keyboardType: TextInputType.text,
      //                           decoration: InputDecoration(
      //                             contentPadding: EdgeInsets.symmetric(
      //                                 vertical: 4.w, horizontal: 5.w),
      //                             border: OutlineInputBorder(
      //                               borderRadius:
      //                                   BorderRadius.all(Radius.circular(10.w)),
      //                             ),
      //                             suffixIcon: IconButton(
      //                               icon: confirmpassword
      //                                   ? Icon(Icons.visibility)
      //                                   : Icon(Icons.visibility_off),
      //                               onPressed: () {
      //                                 setState(() {
      //                                   confirmpassword = !confirmpassword;
      //                                 });
      //                               },
      //                             ),
      //                             hintText: 'New Password',
      //                           ),
      //                           validator: (value) {
      //                             if (value == null || value.isEmpty) {
      //                               return "Enter New Password";
      //                             } else {
      //                               return null;
      //                             }
      //                           },
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 3.h,
      //                     ),
      //                     Padding(
      //                       padding: EdgeInsets.only(left: 6.w, right: 6.w),
      //                       child: Container(
      //                         child: TextFormField(
      //                           style: TextStyle(
      //                               fontFamily: "medium", fontSize: 17.dp),
      //                           obscureText: _isHidden,
      //                           keyboardType: TextInputType.text,
      //                           decoration: InputDecoration(
      //                             contentPadding: EdgeInsets.symmetric(
      //                                 vertical: 4.w, horizontal: 5.w),
      //                             border: OutlineInputBorder(
      //                               borderRadius:
      //                                   BorderRadius.all(Radius.circular(10.w)),
      //                             ),
      //                             suffixIcon: IconButton(
      //                               icon: _isHidden
      //                                   ? Icon(Icons.visibility)
      //                                   : Icon(Icons.visibility_off),
      //                               onPressed: () {
      //                                 setState(() {
      //                                   _isHidden = !_isHidden;
      //                                 });
      //                               },
      //                             ),
      //                             hintText: 'Confirm Password',
      //                           ),
      //                           validator: (value) {
      //                             if (value == null || value.isEmpty) {
      //                               return "Enter New Password";
      //                             } else {
      //                               return null;
      //                             }
      //                           },
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 4.h,
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         final isValid = _formkey.currentState!.validate();
      //                         if (!isValid) {
      //                           return;
      //                         } else {
      //                           Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                 builder: (context) => OtpScreen(),
      //                               ));
      //                         }
      //                       },
      //                       child: Container(
      //                         height: 5.5.h,
      //                         width: 87.w,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.all(
      //                             Radius.circular(5.w),
      //                           ),
      //                           gradient: LinearGradient(
      //                             begin: Alignment.topRight,
      //                             end: Alignment.topLeft,
      //                             colors: [
      //                               CustomColors.primaryColor,
      //                               Colors.black.withOpacity(0.6),
      //                             ],
      //                           ),
      //                         ),
      //                         child: Center(
      //                           child: Text(
      //                             "CHANGE PASSWORD",
      //                             style: TextStyle(
      //                                 fontSize: 17.dp,
      //                                 color: Colors.white,
      //                                 fontFamily: "Alegreya"),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
