import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data {
  final String image;

  Data({
    required this.image,
  });
}

List<Data> datas = [
  Data(
    image: 'asset/Dog_Category_pic/Banner_pic/bannerpic1.jpg',
  ),
  Data(
    image: 'asset/Dog_Category_pic/Banner_pic/bannerpic2.webp',
  ),
  Data(
    image: 'asset/Dog_Category_pic/Banner_pic/bannerpic3.jpg',
  ),
  Data(
    image: 'asset/Dog_Category_pic/Banner_pic/bannerpic4.webp',
  ),
   Data(
    image: 'asset/Dog_Category_pic/Banner_pic/bannerpic5.png',
  ),
];

class Data2 {
  final String image;
  final Color gradientStartColor;
  final Color gradientEndColor;
  final String title;

  Data2(
      {required this.image,
      required this.title,
      required this.gradientStartColor,
      required this.gradientEndColor});
}

List<Data2> datas2 = [
  Data2(
      image: 'asset/all pets/clothes-removebg-preview.png',
      gradientStartColor: Color(0xfffaedcb),
      gradientEndColor: Colors.white,
      title: 'Clothing &\nAccessories'),
  Data2(
      image: 'asset/Food_Brand/drools.png',
      gradientStartColor: Color(0xffc9e4de),
      gradientEndColor: Colors.white,
      title: 'Food'),
  Data2(
      image: 'asset/all pets/toy.jpg',
      gradientStartColor: Color(0xffc6def1),
      gradientEndColor: Colors.white,
      title: 'Toys'),
  Data2(
      image: 'asset/all pets/category7.png',
      gradientStartColor: Color(0xffdbcdf0),
      gradientEndColor: Colors.white,
      title: 'Grooming'),
  Data2(
      image: 'asset/all pets/Crates.png',
      gradientStartColor: Color(0xfff2c6de),
      gradientEndColor: Colors.white,
      title: 'Crates\n& Beds'),
  Data2(
      image: 'asset/all pets/leash,collar,harness.png',
      gradientStartColor: Color(0xfff7d9c4),
      gradientEndColor: Colors.white,
      title: 'Leash,Collar\n&Accessories'),
];

class Data3 {
  final String image;
  final String title;
  final Color color1;
  final Color color2;

  Data3(
      {required this.image,
      required this.title,
      required this.color1,
      required this.color2});
}

List<Data3> datas3 = [
  Data3(
    image: 'asset/Dog_Category_pic/smallerDogpic.jpeg',
    title: 'Stater',
    color1: Colors.blue,
    color2: Colors.red,
  ),
  Data3(
    image: 'asset/Dog_Category_pic/MidsizeDogpic.jpeg',
    title: 'Mid',
    color1: Colors.yellow,
    color2: Colors.blue,
  ),
  Data3(
      image: 'asset/Dog_Category_pic/AdultDogpic.jpeg',
      title: 'Adult',
      color1: Colors.grey,
      color2: Colors.pink),
];

class Data4 {
  final String image;
  final Color color;
  final String title;
  final String title2;

  Data4(
      {required this.image,
      required this.color,
      required this.title,
      required this.title2}); 
}

List<Data4> datas4 = [
  Data4(
      image: 'asset/Dog_Category_pic/dog_cartoon_pic2.avif',
      color: Color.fromARGB(255, 149, 150, 241),
      title: 'Unlees new adventures\nwith our toy range!',
      title2: 'Discover toys'),
  Data4(
      image: 'asset/Dog_Category_pic/dog_cartoon_pic4.png',
      color: Color.fromARGB(255, 235, 212, 129),
      title: 'Pick the seasons\nfresh style!',
      title2: 'Discover accessories'),
  Data4(
      image: 'asset/Dog_Category_pic/dog_cartoon_pic1.jpg',
      color: const Color.fromARGB(255, 210, 134, 159),
      title: 'Find what is new\nin the Daggo world!',
      title2: 'Discover food'),
];

class Data5 {
  final String image;
  final String title;

  Data5({
    required this.image,
    required this.title,
  });
}

List<Data5> datas5 = [
  Data5(
    image: 'asset/Dog_Category_pic/Breeds_pic/labrador_dog_pic.webp',
    title: 'Labrador retriever',
  ),
  Data5(
    image: 'asset/Dog_Category_pic/Breeds_pic/Beagle_dog_pic.webp',
    title: 'Beagle',
  ),
  Data5(
    image: 'asset/Dog_Category_pic/Breeds_pic/Siberian huskiy_pic.webp',
    title: 'Siberian husky',
  ),
  Data5(
    image: 'asset/Dog_Category_pic/Breeds_pic/germanDog_pic.jpg',
    title: 'German shepherd',
  ),
  Data5(
    image: 'asset/Dog_Category_pic/Breeds_pic/GoldenRitrieverpic.jpeg',
    title: 'Golden retriever',
  ),
];
