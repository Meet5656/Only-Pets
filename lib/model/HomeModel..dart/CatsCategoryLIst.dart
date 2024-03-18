import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data6 {
  final String image;

  Data6({
    required this.image,
  });
}

List<Data6> datas6 = [
  Data6(
    image: 'asset/Cat_Category_pic/bannerpic5.jpg',
  ),
  Data6(
    image: 'asset/Cat_Category_pic/bannerpic3.jpg',
  ),
  Data6(
    image: 'asset/Cat_Category_pic/bannerpic2.webp',
  ),
  Data6(
    image: 'asset/Cat_Category_pic/bannerpic4.jpg',
  ),
];

class Data7 {
  final String image;
  final Color gradientStartColor;
  final Color gradientEndColor;
  final String title;

  Data7(
      {required this.image,
      required this.title,
      required this.gradientStartColor,
      required this.gradientEndColor});
}

List<Data7> datas7 = [
  Data7(
      image: 'asset/all pets/clothes-removebg-preview.png',
      gradientStartColor: Color(0xfffaedcb),
      gradientEndColor: Colors.white,
      title: 'Clothing &\nAccessories'),
  Data7(
      image: 'asset/Food_Brand/drools.png',
      gradientStartColor: Color(0xffc9e4de),
      gradientEndColor: Colors.white,
      title: 'Food'),
  Data7(
      image: 'asset/all pets/toy.jpg',
      gradientStartColor: Color(0xffc6def1),
      gradientEndColor: Colors.white,
      title: 'Toys'),
  Data7(
      image: 'asset/all pets/category7.png',
      gradientStartColor: Color(0xffdbcdf0),
      gradientEndColor: Colors.white,
      title: 'Grooming'),
  Data7(
      image: 'asset/all pets/Crates.png',
      gradientStartColor: Color(0xfff2c6de),
      gradientEndColor: Colors.white,
      title: 'Crates\n& Beds'),
  Data7(
      image: 'asset/all pets/leash,collar,harness.png',
      gradientStartColor: Color(0xfff7d9c4),
      gradientEndColor: Colors.white,
      title: 'Leash,Collar\n&Accessories'),
];

class Data8 {
  final String image;
  final String title;
  final Color color1;
  final Color color2;

  Data8(
      {required this.image,
      required this.title,
      required this.color1,
      required this.color2});
}

List<Data8> datas8 = [
  Data8(
    image: 'asset/Dog_Category_pic/smallerDogpic.jpeg',
    title: 'Stater',
    color1: Colors.blue,
    color2: Colors.red,
  ),
  Data8(
    image: 'asset/Dog_Category_pic/MidsizeDogpic.jpeg',
    title: 'Mid',
    color1: Colors.yellow,
    color2: Colors.blue,
  ),
  Data8(
      image: 'asset/Dog_Category_pic/AdultDogpic.jpeg',
      title: 'Adult',
      color1: Colors.grey,
      color2: Colors.pink),
];

class Data9 {
  final String image;
  final Color color;
  final String title;
  final String title2;

  Data9(
      {required this.image,
      required this.color,
      required this.title,
      required this.title2});
}

List<Data9> datas9 = [
  Data9(
      image: 'asset/Dog_Category_pic/dog_cartoon_pic2.avif',
      color: Color.fromARGB(255, 149, 150, 241),
      title: 'Unlees new adventures\nwith our toy range!',
      title2: 'Discover toys'),
  Data9(
      image: 'asset/Dog_Category_pic/dog_cartoon_pic4.png',
      color: Color.fromARGB(255, 235, 212, 129),
      title: 'Pick the seasons\nfresh style!',
      title2: 'Discover accessories'),
  Data9(
      image: 'asset/Dog_Category_pic/dog_cartoon_pic1.jpg',
      color: const Color.fromARGB(255, 210, 134, 159),
      title: 'Find what is new\nin the Daggo world!',
      title2: 'Discover food'),
];

class Data10 {
  final String image;
  final String title;

  Data10({
    required this.image,
    required this.title,
  });
}

List<Data10> datas10 = [
  Data10(
    image: 'asset/Dog_Category_pic/labrador_dog_pic.webp',
    title: 'Labrador retriever',
  ),
  Data10(
    image: 'asset/Dog_Category_pic/Beagle_dog_pic.webp',
    title: 'Beagle',
  ),
  Data10(
    image: 'asset/Dog_Category_pic/Siberian huskiy_pic.webp',
    title: 'Siberian husky',
  ),
  Data10(
    image: 'asset/Dog_Category_pic/germanDog_pic.jpg',
    title: 'German shepherd',
  ),
  Data10(
    image: 'asset/Dog_Category_pic/GoldenRitrieverpic.jpeg',
    title: 'Golden retriever',
  ),
];
