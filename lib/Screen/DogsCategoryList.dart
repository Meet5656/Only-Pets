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
  final String color;
  final String title;

  Data2({
    required this.image,required this.color,required this.title
  });
}

List<Data2> Datas2 = [
  Data2(
    image: '',
    color: '',
    title: 'Food'
  ),
  Data2(
    image: '',
    color: '',
    title: 'Vag Food'
  ),
  Data2(
    image: '',
    color: '',
    title: 'Treats'
  ),
  Data2(
    image: '',
    color: '',
    title: 'Toy'
  ),
  Data2(
    image: '',
    color: '',
    title: 'Grooming'
  ),
  Data2(
    image: '',
    color: '',
    title: 'Clothing &\nAccessories'
  ),
];