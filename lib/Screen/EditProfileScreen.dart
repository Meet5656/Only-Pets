import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:only_pets/Screen/ProfileScreen.dart';
import 'package:only_pets/util/Color.dart';

class EditProfileScreens extends StatefulWidget {
  const EditProfileScreens(loginData, {super.key});

  @override
  State<EditProfileScreens> createState() => _EditProfileScreensState();
}

// key
GlobalKey<FormState> formkey = GlobalKey<FormState>();

// Controller
TextEditingController email = TextEditingController();

class _EditProfileScreensState extends State<EditProfileScreens> {
  final double profileHeight = 144;
  Uint8? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.5.w, top: 0.5.h),
                      child: FadeInDown(
                        duration: Duration(milliseconds: 1800),
                        child: Container(
                          height: 4.h,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 30.sp,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 25.5.w, top: 1.h),
                                child: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22.sp,
                                      fontFamily: "Alegreya"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(children: [
                          selectedImage != null
                              ? CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  radius: profileHeight / 2,
                                  child: CircleAvatar(
                                    radius: profileHeight / 2 - 5,
                                    backgroundImage: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                    ).image,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  radius: profileHeight / 2,
                                  child: CircleAvatar(
                                    radius: profileHeight / 2 - 5,
                                    backgroundImage: Image.asset(
                                            'asset/paw-print_882909-3.jpg')
                                        .image,
                                  ),
                                ),
                          Padding(
                            padding: EdgeInsets.only(left: 23.w, top: 8.5.h),
                            child: Container(
                                height: 3.h,
                                width: 6.5.w,
                                decoration: BoxDecoration(
                                    color: Color(0xffc64d4c),
                                    borderRadius: BorderRadius.circular(20)),
                                child: IconButton(
                                    onPressed: () {
                                      shwoImagePickerOption(context);
                                    },
                                    icon: Center(
                                      child: Icon(
                                        Icons.edit,
                                        size: 3.5.w,
                                        color: Colors.white,
                                      ),
                                    ))),
                          )
                        ]),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'First Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 16.sp,
                                  ),
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Frist Name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 4.w),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.w)),
                                    ),
                                    hintText: 'First Name',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffc64d4c),
                                          width: 0.2.h),
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                'Last Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 16.sp,
                                  ),
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Last Name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 4.w),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.w)),
                                    ),
                                    hintText: 'Last Name',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffc64d4c),
                                          width: 0.2.h),
                                      borderRadius: BorderRadius.circular(4.w),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                'Email',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 16.sp,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    String pattern =
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                    RegExp regExp = new RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return 'Please enter Email';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter a valid Email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 4.w),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.w)),
                                    ),
                                    hintText: 'Email ',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffc64d4c),
                                          width: 0.2.h),
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                'Phone No.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 16.sp,
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
                                    RegExp regExp = new RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return 'Please enter Phone no.';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter a valid Phone no.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 4.w),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.w)),
                                    ),
                                    hintText: 'Phone no',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffc64d4c),
                                          width: 0.2.h),
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.5.h,
                              ),
                              InkWell(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProfileScreen(),
                                        ));
                                  }
                                },
                                child: Container(
                                  height: 5.7.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular((3.w)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        CustomColors.primaryColor,
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Save Details",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void shwoImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.all(10.w),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 11,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImagefromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo_outlined,
                              size: 15.w,
                              color: Color(0xffc64d4c),
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                  color: Color(0xffc64d4c), fontSize: 10.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImagefromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 15.w,
                              color: Color(0xffc64d4c),
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(
                                  color: Color(0xffc64d4c), fontSize: 10.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _pickImagefromGallery() async {
    Navigator.pop(context);
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      print("IMAGEPATH ${selectedImage!.path.toString()}");
    });
  }

  Future<void> _pickImagefromCamera() async {
    Navigator.pop(context);
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      print("IMAGEPATH ${selectedImage!.path.toString()}");
    });
  }
}
