class TrendingModel {
  String image;
  String name;
  String size;
  String Prise;
  String Rate;
  TrendingModel(
      {required this.image,
      required this.name,
      required this.size,
      required this.Prise,
      required this.Rate});
}

List<TrendingModel> Trending = [
  TrendingModel(
      image: 'asset/all pets/first.avif',
      name: "Border Collie winter jacket clothes",
      size: "",
      Prise: "₹500",
      Rate: "4.5"),
  TrendingModel(
      image: 'asset/all pets/DSC_3838-Edit.webp',
      name: "HUFT Momma's Shepherd T-shirt",
      size: "",
      Prise: "₹750",
      Rate: "4.5"),
  TrendingModel(
      image: 'asset/all pets/three.avif',
      name: "Christmas golden retriever warm clothes",
      size: "",
      Prise: "₹930",
      Rate: "4.5"),
  TrendingModel(
      image: "asset/all pets/catfirst.jpg",
      name: "PETSIN Checkered Print Pet Hoodie",
      size: "",
      Prise: "₹630",
      Rate: "4.5"),
  TrendingModel(
      image: "asset/all pets/catfore.jpg",
      name: "Himalayan Checkered Pet Sweater",
      size: "",
      Prise: "₹250",
      Rate: "4.5"),
  TrendingModel(
      image: "asset/all pets/rabbit1.avif",
      name: "Rabbits Autumn Winter Clothes Harness Vest",
      size: "",
      Prise: "₹1000",
      Rate: "4.5"),
];
