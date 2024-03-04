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
    image: 'asset/dogs_banner_pic1.jpeg',
  ),
  Data(
    image: 'asset/dogs_banner_pic2.jpg',
  ),
  Data(
    image: 'asset/dogs_banner_pic3.jpg',
  ),
  Data(
    image: 'asset/dogs_banner_pic4.jpeg',
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
      image: 'asset\Foodpic.jpg',
      gradientStartColor: Color.fromARGB(255, 173, 200, 194).withOpacity(0.8),
      gradientEndColor: Colors.white,
      title: 'Clothing &\nAccessories'),
  Data2(
      image: 'asset\Toyspic.webp',
      gradientStartColor: Color(0xff4ac1e1).withOpacity(0.6),
      gradientEndColor: Colors.white,
      title: 'Food'),
  Data2(
      image: '',
      gradientStartColor: Color(0xffffe5d4).withOpacity(0.6),
      gradientEndColor: Colors.white,
      title: 'Toys'),
  Data2(
      image: '',
      gradientStartColor: Color.fromARGB(255, 254, 237, 0).withOpacity(0.6),
      gradientEndColor: Colors.white,
      title: 'Grooming'),
  Data2(
      image: '',
      gradientStartColor: Color(0xff4ac1e1).withOpacity(0.6),
      gradientEndColor: Colors.white,
      title: 'Crates\n& Beds'),
  Data2(
      image: '',
      gradientStartColor: Color.fromARGB(255, 254, 237, 0).withOpacity(0.6),
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
      image: 'asset/Dog_Category_pic/Dog_Cartun_pic1.jpeg',
      color: Color(0xff5054fe),
      title: 'Unlees new adventures\nwith our toy range!',
      title2: 'Discover toys'),
  Data4(
      image: 'asset/Dog_Category_pic/dog_cartoon_pic3.jpeg',
      color: Colors.amberAccent,
      title: 'Pick the seasons\n fresh style!',
      title2: 'Discover accessories'),
  Data4(
      image: 'asset/Dog_Category_pic/dog_cartoon_pic1.jpeg',
      color: Colors.pinkAccent,
      title: 'Find what is new\nin the Daggo world!',
      title2: 'Discover'),
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
    image: 'asset/Dog_Category_pic/labrador_dog_pic.webp',
    title: 'Labrador retriever',
  ),
  Data5(
    image: 'asset/Dog_Category_pic/Beagle_dog_pic.webp',
    title: 'Beagle',
  ),
  Data5(
    image: 'asset/Dog_Category_pic/Siberian huskiy_pic.webp',
    title: 'Siberian husky',
  ),
  Data5(
    image: 'asset/Dog_Category_pic/germanDog_pic.jpg',
    title: 'German shepherd',
  ),
  Data5(
    image: 'asset/Dog_Category_pic/GoldenRitrieverpic.jpeg',
    title: 'Golden retriever',
  ),
];
