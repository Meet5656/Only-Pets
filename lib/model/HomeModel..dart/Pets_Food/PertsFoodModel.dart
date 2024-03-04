class Petsfood {
  String image;
  String name;
  String size;
  String Prise;
  String Rate;
  Petsfood(
      {required this.image,
      required this.name,
      required this.size,
      required this.Prise,
      required this.Rate});
}

List<Petsfood> foodpets = [
  Petsfood(
      image: "asset/Pets_Food/petsfood1.jpg",
      name: "Pedigree Pro Mother & Pup Starter Large Breed, Dry Dog Food",
      size: "",
      Prise: "₹1,520",
      Rate: "4.1"),
  Petsfood(
      image: "asset/Pets_Food/petsfood2.jpg",
      name: "Pedigree Adult Dry Dog Food, Chicken & Vegetables",
      size: "",
      Prise: "2,143",
      Rate: "4.4"),
  Petsfood(
      image: "asset/Pets_Food/petsfood3.jpg",
      name: "Dry Dog Food,Complete & Balanced Nutrition for Puppy & Adult Dogs",
      size: "",
      Prise: "₹807",
      Rate: "4.4"),
  Petsfood(
      image: "asset/Pets_Food/petsfood4.jpg",
      name: "Drools Small Breed Puppy, Premium Dog Food",
      size: "",
      Prise: "₹410",
      Rate: "3.9"),
  Petsfood(
      image: "asset/Pets_Food/petsfood5.jpg",
      name: "Drools Optimum Performance Adult Dry Dog Food, Chicken Flavor",
      size: "",
      Prise: "₹2,635",
      Rate: "4.3"),
  Petsfood(
      image: "asset/Pets_Food/petsfood6.jpg",
      name: "Whiskas Adult (+1 year) Dry Cat Food, Mackerel Flavour",
      size: "",
      Prise: "₹2,065",
      Rate: "4.5"),
];
