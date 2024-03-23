import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:only_pets/Screen/ProfileScreen.dart';
import 'package:only_pets/util/Color.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

// key
GlobalKey<FormState> formkey = GlobalKey<FormState>();

// Controller
TextEditingController email = TextEditingController();

class _EditProfileScreenState extends State<EditProfileScreen> {
  final double profileHeight = 144;
  Uint8? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                AppBar(
                  leading: Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  centerTitle: true,
                  title: Text(
                    "Edit Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 25.dp),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Stack(children: [
                  selectedImage != null
                      ? CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          radius: profileHeight / 2,
                          child: CircleAvatar(
                            radius: profileHeight / 2 - 5,
                            backgroundImage: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ).image,
                          ),
                        )
                      //  Container(
                      //   height: 5.h,
                      //   width: 22.w,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10.w),
                      //   ),
                      //   child: Image.file(selectedImage!,fit: BoxFit.cover,),
                      //  )
                      : CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          radius: profileHeight / 2,
                          child: CircleAvatar(
                            radius: profileHeight / 2 - 5,
                            backgroundImage: Image.asset(
                                    'asset/hand-drawn-paw-prints-background_23-2151132904.jpg')
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
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                              size: 4.w,
                              color: Colors.white,
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
                        'Name',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18.dp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.w)),
                            ),
                            hintText: 'Enter Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffc64d4c), width: 0.2.h),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'Lastname',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18.dp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.w)),
                            ),
                            hintText: 'Enter Lastname',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffc64d4c), width: 0.2.h),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'E-mail',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18.dp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Email id";
                            }
                            bool isValid =
                                RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                    .hasMatch(value);

                            if (!isValid) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.w)),
                            ),
                            hintText: 'Enter Email ',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffc64d4c), width: 0.2.h),
                              borderRadius: BorderRadius.circular(2.w),
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
                            fontSize: 18.dp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.w)),
                            ),
                            hintText: 'Enter Phone no.',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffc64d4c), width: 0.2.h),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.5.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ));
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
                                // Colors.brown.shade300,
                                Colors.black.withOpacity(0.6),
                                CustomColors.maincolor,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Save Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22.dp,
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
              height: MediaQuery.of(context).size.height / 12,
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
                                  color: Color(0xffc64d4c), fontSize: 10.dp),
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
                                  color: Color(0xffc64d4c), fontSize: 10.dp),
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
