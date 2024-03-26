class ViewCategorysmodel {
  String name;
  String image;

  ViewCategorysmodel(
      {
      // required this.title,
      required this.image,
      required this.name});
}

List<ViewCategorysmodel> viewCategorys = [
  ViewCategorysmodel(
    image: 'asset/all pets/dogface1.jpg',
    name: 'Dog',
  ),
  ViewCategorysmodel(
    image: 'asset/all pets/OIP.jpg',
    name: 'Cat',
  ),
  ViewCategorysmodel(
    image: 'asset/all pets/R.jpg',
    name: 'Rabbit',
  ),
  ViewCategorysmodel(
    image: 'asset/all pets/clothes-removebg-preview (2).png',
    name: 'Clothes',
  ),
  ViewCategorysmodel(
    image: 'asset/all pets/toy.jpg',
    name: 'Toy',
  ),
  ViewCategorysmodel(
    image: 'asset/all pets/food.jpg',
    name: 'Food',
  ),
  ViewCategorysmodel(
    image: 'asset/all pets/category7.png',
    name: 'Grooming',
  ),
  ViewCategorysmodel(
      image: "asset/all pets/leash,collar,harness.png",
      name: "leash,collar,harness"),
  ViewCategorysmodel(
      image: "asset/all pets/beds2jpg.jpg", name: "Crates & Beds")
];
