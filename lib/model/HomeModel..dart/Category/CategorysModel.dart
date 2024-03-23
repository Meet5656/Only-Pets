class Homemodel1 {
  String name;
  String image;

  Homemodel1(
      {
      // required this.title,
      required this.image,
      required this.name});
}

List<Homemodel1> face = [
  Homemodel1(
    image: 'asset/all pets/dogface1.jpg',
    name: 'Dog',
  ),
  Homemodel1(
    image: 'asset/all pets/OIP.jpg',
    name: 'Cat',
  ),
  Homemodel1(
    image: 'asset/all pets/R.jpg',
    name: 'Rabbit',
  ),
  Homemodel1(
    image: 'asset/all pets/clothes-removebg-preview (2).png',
    name: 'Clothes',
  ),
  Homemodel1(
    image: 'asset/all pets/toy.jpg',
    name: 'Toy',
  ),
  // Homemodel1(
  //   image: 'asset/all pets/food.jpg',
  //   name: 'Food',
  // )
];
