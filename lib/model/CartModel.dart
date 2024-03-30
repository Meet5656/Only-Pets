class CartModel {
  String Image;
  String name;
  String prise;
  CartModel({required this.Image, required this.name, required this.prise});
}

List<CartModel> cart = [
  CartModel(
      Image: "asset/Trending_View/t-1.jpg", name: "clothes", prise: "₹100"),
  CartModel(
      Image: "asset/Trending_View/t-4.jpg", name: "clothes", prise: "₹200"),
  CartModel(Image: "asset/Food_Brand/drools.png", name: "food", prise: "₹100"),
  CartModel(
      Image: "asset/Trending_View/t-6.jpg", name: "clothes", prise: "₹300"),
  CartModel(
      Image: "asset/Trending_View/t-10.jpg", name: "clothes", prise: "₹400"),
  CartModel(
      Image: "asset/Trending_View/t-1.jpg", name: "clothes", prise: "₹100"),
  CartModel(
      Image: "asset/Trending_View/t-4.jpg", name: "clothes", prise: "₹200"),
  CartModel(Image: "asset/Food_Brand/drools.png", name: "food", prise: "₹100"),
  CartModel(
      Image: "asset/Trending_View/t-6.jpg", name: "clothes", prise: "₹300"),
  CartModel(
      Image: "asset/Trending_View/t-10.jpg", name: "clothes", prise: "₹400"),
];
