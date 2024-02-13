class Homemodel2 {
  String name;
  String image;
  // final String description;

  Homemodel2(
      {
      // required this.title,
      required this.image,
      required this.name
      // required this.description,
      });
}

List<Homemodel2> image = [
  Homemodel2(
    image: 'asset/all pets/istockphoto-959866606-612x612.jpg',
    name: 'Dog',
    // description: 'Everything for comfortable\nreading  of favorite\nbooks'
  ),
  Homemodel2(
    image: 'asset/all pets/list2(1).jpg',
    name: 'Cat',
//       description:
//           'Different formats for listening\nto books with labels and\nsubtitles'
  ),
  Homemodel2(
    image: 'asset/all pets/list2(3).jpg',
    name: 'Rabbit',
//       description:
//           'Easy search by all\ncategories and authors from\nall over the world'
  ),
   Homemodel2(
    image: 'asset/all pets/vecteezy_red-striped-cat-sits-in-a-white-sweater-on-a-yellow-sofa_29560229.jpg',
    name: 'Rabbit',
//       description:
//           'Easy search by all\ncategories and authors from\nall over the world'
  )
];
