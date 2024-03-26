import 'dart:convert';
import 'package:only_pets/model/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  var pref = SharedPreferences.getInstance();
  var userKey = "user";
  var tokenKey = "token";

  static const String favoriteKeyPrefix = 'favorite_';

  static Future<void> addToFavorites(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_getFavoriteKey(productId), true);
  }

  static Future<void> removeFromFavorites(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_getFavoriteKey(productId), false);
  }

  static Future<bool> isFavorite(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_getFavoriteKey(productId)) ?? false;
  }

  static String _getFavoriteKey(String productId) {
    return '$favoriteKeyPrefix$productId';
  }

  getPref() async {
    return await SharedPreferences.getInstance();
  }

  read() async {
    pref = SharedPreferences.getInstance();
  }

  void saveSignInInfo(UserData? data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('signIn', json.encode(data));
  }

  Future<UserData?> getSignInInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('signIn');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return UserData.fromJson(jsonMap);
    }
    return null;
  }

  Future<void> setIsGuestUser(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('guest', value);
  }

  Future<bool> getGuestUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('guest') ??
        true; // Default to false if the key is not found
  }

  Future<void> setIsGuestUserFromApi(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('api_guest', value);
  }

  Future<bool> getGuestUserFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('api_guest') ??
        true; // Default to false if the key is not found
  }

  Future<void> setToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, value);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey) ?? "";
  }

  Future<void> setUserType(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, value);
  }

  Future<String> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userKey) ?? "";
  }

  Future<void> setBoolValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('myBoolKey', value);
  }

  Future<bool> getBoolValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('myBoolKey') ??
        false; // Default to false if the key is not found
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Future<void> addToCart(CommonProductList product, int quantity,
  //     {bool isBuyNow = false}) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // Retrieve existing cart items
  //   String? cartItemsJson = prefs.getString('cartItems');
  //   List<CommonProductList> cartItems = [];

  //   if (cartItemsJson != null && cartItemsJson.isNotEmpty) {
  //     cartItems = (json.decode(cartItemsJson) as List<dynamic>)
  //         .map((item) => CommonProductList.fromJson(item))
  //         .toList();
  //   }

  //   // Check if the item is already in the cart
  //   int existingIndex = cartItems.indexWhere((item) => item.id == product.id);

  //   if (existingIndex != -1) {
  //     // Item already in the cart, update quantity
  //     if (quantity > 0) {
  //       // Increment quantity
  //       cartItems[existingIndex].quantity!.value += 1;
  //     } else {
  //       // Decrement quantity
  //       cartItems[existingIndex].quantity!.value -= 1;
  //       // Remove item if the quantity becomes 0
  //       if (cartItems[existingIndex].quantity!.value <= 0) {
  //         cartItems.removeAt(existingIndex);
  //       }
  //     }
  //   } else {
  //     // Item not in the cart, add it with quantity
  //     if (quantity > 0) {
  //       CommonProductList newProduct =
  //           product.copyWith(quantity: quantity, isInCart: true);
  //       cartItems.add(newProduct);
  //     }
  //   }
  //   // Save the updated cart back to preferences
  //   prefs.setString('cartItems', json.encode(cartItems));
  // }

  // Future<void> buyNow(CommonProductList product, int quantity) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // Retrieve existing buy now items
  //   String? buyNowItemsJson = prefs.getString('buyNowItems');
  //   List<CommonProductList> buyNowItems = [];

  //   if (buyNowItemsJson != null && buyNowItemsJson.isNotEmpty) {
  //     buyNowItems = (json.decode(buyNowItemsJson) as List<dynamic>)
  //         .map((item) => CommonProductList.fromJson(item))
  //         .toList();
  //   }

  //   // Check if the item is already in the buy now list
  //   int existingIndex = buyNowItems.indexWhere((item) => item.id == product.id);

  //   if (existingIndex != -1) {
  //     // Item already in the buy now list, update quantity
  //     buyNowItems[existingIndex].quantity!.value = quantity;
  //   } else {
  //     // Item not in the buy now list, add it with quantity
  //     CommonProductList newProduct =
  //         product.copyWith(quantity: quantity, isInCart: true);
  //     buyNowItems.add(newProduct);
  //   }

  //   // Save the updated buy now list back to preferences
  //   prefs.setString('buyNowItems', json.encode(buyNowItems));
  // }

  // Future<List<CommonProductList>> loadBuyNowItems() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? buyNowItemsJson = prefs.getString('buyNowItems');
  //   List<CommonProductList> buyNowItems = [];

  //   if (buyNowItemsJson != null && buyNowItemsJson.isNotEmpty) {
  //     List<Map<String, dynamic>> itemsList =
  //         json.decode(buyNowItemsJson).cast<Map<String, dynamic>>();

  //     buyNowItems =
  //         itemsList.map((item) => CommonProductList.fromJson(item)).toList();
  //   }

  //   return buyNowItems;
  // }

  // Future<List<CommonProductList>> loadCartItems() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? cartItemsJson = prefs.getString('cartItems');
  //   List<CommonProductList> cartItems = [];

  //   if (cartItemsJson != null && cartItemsJson.isNotEmpty) {
  //     List<Map<String, dynamic>> itemsList =
  //         json.decode(cartItemsJson).cast<Map<String, dynamic>>();

  //     cartItems =
  //         itemsList.map((item) => CommonProductList.fromJson(item)).toList();
  //   }
  //   return cartItems;
  // }

  // Function to remove a specific item from cart
  Future<void> removeCartItem(int productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartItemsJson = prefs.getString('cartItems');

    if (cartItemsJson != null && cartItemsJson.isNotEmpty) {
      List<Map<String, dynamic>> itemsList =
          json.decode(cartItemsJson).cast<Map<String, dynamic>>();

      // Remove the item with the specified ID
      itemsList.removeWhere((item) => item['id'] == productId);

      // Save the updated cart back to preferences
      prefs.setString('cartItems', json.encode(itemsList));
    }
  }

  Future<void> clearCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartItems');
  }

  Future<void> setGuestUserDialogVisible(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('guestUser', value);
  }

  Future<bool> getGuestUserDialogVisible() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('guestUser') ??
        false; // Default to false if the key is not found
  }
}
