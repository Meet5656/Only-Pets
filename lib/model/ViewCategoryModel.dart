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
    image: 'asset/all pets/clothes.jpg',
    name: 'Clothes',
  ),
  ViewCategorysmodel(
    image: 'asset/all pets/toy.jpg',
    name: 'Toy',
  ),
  ViewCategorysmodel(
    image: 'asset/all pets/food.jpg',
    name: 'Food',
  )
];
