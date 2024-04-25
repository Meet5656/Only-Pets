
import 'dart:convert';

import 'package:only_pets/model/UpdateDashboardModel.dart';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  int status;
  String message;
  List<CommonProductList> data;

  SearchModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        message: json["message"],
        data: List<CommonProductList>.from(
            json["data"].map((x) => CommonProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
    int id;
    String name;
    String categoryId;
    String subcategoryId;
    String innerSubcategoryId;
    String brandId;
    dynamic sku;
    List<String> images;
    List<String> thumbnailUrl;
    String isActive;
    dynamic tags;
    String price;
    String discount;
    DiscountUnit discountUnit;
    String instockQty;
    String? description;
    dynamic minQty;
    String isFreeShipping;
    String isReturnPolicy;
    String returnPolicyDays;
    String shippingCharge;
    dynamic shippingChargeUnit;
    String isFeatured;
    String isTrending;
    String isHotDeals;
    dynamic tax;
    dynamic taxUnit;
    String isVariations;
    ProductCategoryName productCategoryName;
    ProductCategoryThumbnailUrl productCategoryThumbnailUrl;
    String productSubCategoryName;
    String productSubCategoryThumbnailUrl;
    String productInnerSubCategoryName;
    String productInnerSubCategoryThumbnailUrl;
    String brandName;
    String brandThumbnailUrl;
    String? averageRating;

    Datum({
        required this.id,
        required this.name,
        required this.categoryId,
        required this.subcategoryId,
        required this.innerSubcategoryId,
        required this.brandId,
        required this.sku,
        required this.images,
        required this.thumbnailUrl,
        required this.isActive,
        required this.tags,
        required this.price,
        required this.discount,
        required this.discountUnit,
        required this.instockQty,
        required this.description,
        required this.minQty,
        required this.isFreeShipping,
        required this.isReturnPolicy,
        required this.returnPolicyDays,
        required this.shippingCharge,
        required this.shippingChargeUnit,
        required this.isFeatured,
        required this.isTrending,
        required this.isHotDeals,
        required this.tax,
        required this.taxUnit,
        required this.isVariations,
        required this.productCategoryName,
        required this.productCategoryThumbnailUrl,
        required this.productSubCategoryName,
        required this.productSubCategoryThumbnailUrl,
        required this.productInnerSubCategoryName,
        required this.productInnerSubCategoryThumbnailUrl,
        required this.brandName,
        required this.brandThumbnailUrl,
        required this.averageRating,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        innerSubcategoryId: json["inner_subcategory_id"],
        brandId: json["brand_id"],
        sku: json["sku"],
        images: List<String>.from(json["images"].map((x) => x)),
        thumbnailUrl: List<String>.from(json["thumbnail_url"].map((x) => x)),
        isActive: json["is_active"],
        tags: json["tags"],
        price: json["price"],
        discount: json["discount"],
        discountUnit: discountUnitValues.map[json["discount_unit"]]!,
        instockQty: json["instock_qty"],
        description: json["description"],
        minQty: json["min_qty"],
        isFreeShipping: json["is_free_shipping"],
        isReturnPolicy: json["is_return_policy"],
        returnPolicyDays: json["return_policy_days"],
        shippingCharge: json["shipping_charge"],
        shippingChargeUnit: json["shipping_charge_unit"],
        isFeatured: json["is_featured"],
        isTrending: json["is_trending"],
        isHotDeals: json["is_hot_deals"],
        tax: json["tax"],
        taxUnit: json["tax_unit"],
        isVariations: json["is_variations"],
        productCategoryName: productCategoryNameValues.map[json["product_category_name"]]!,
        productCategoryThumbnailUrl: productCategoryThumbnailUrlValues.map[json["product_category_thumbnail_url"]]!,
        productSubCategoryName: json["product_sub_category_name"],
        productSubCategoryThumbnailUrl: json["product_sub_category_thumbnail_url"],
        productInnerSubCategoryName: json["product_inner_sub_category_name"],
        productInnerSubCategoryThumbnailUrl: json["product_inner_sub_category_thumbnail_url"],
        brandName: json["brand_name"],
        brandThumbnailUrl: json["brand_thumbnail_url"],
        averageRating: json["average_rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "inner_subcategory_id": innerSubcategoryId,
        "brand_id": brandId,
        "sku": sku,
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail_url": List<dynamic>.from(thumbnailUrl.map((x) => x)),
        "is_active": isActive,
        "tags": tags,
        "price": price,
        "discount": discount,
        "discount_unit": discountUnitValues.reverse[discountUnit],
        "instock_qty": instockQty,
        "description": description,
        "min_qty": minQty,
        "is_free_shipping": isFreeShipping,
        "is_return_policy": isReturnPolicy,
        "return_policy_days": returnPolicyDays,
        "shipping_charge": shippingCharge,
        "shipping_charge_unit": shippingChargeUnit,
        "is_featured": isFeatured,
        "is_trending": isTrending,
        "is_hot_deals": isHotDeals,
        "tax": tax,
        "tax_unit": taxUnit,
        "is_variations": isVariations,
        "product_category_name": productCategoryNameValues.reverse[productCategoryName],
        "product_category_thumbnail_url": productCategoryThumbnailUrlValues.reverse[productCategoryThumbnailUrl],
        "product_sub_category_name": productSubCategoryName,
        "product_sub_category_thumbnail_url": productSubCategoryThumbnailUrl,
        "product_inner_sub_category_name": productInnerSubCategoryName,
        "product_inner_sub_category_thumbnail_url": productInnerSubCategoryThumbnailUrl,
        "brand_name": brandName,
        "brand_thumbnail_url": brandThumbnailUrl,
        "average_rating": averageRating,
    };
}

enum DiscountUnit {
    FLAT
}

final discountUnitValues = EnumValues({
    "flat": DiscountUnit.FLAT
});

enum ProductCategoryName {
    CAT,
    DOG,
    RABBIT,
    TOYS
}

final productCategoryNameValues = EnumValues({
    "Cat": ProductCategoryName.CAT,
    "Dog": ProductCategoryName.DOG,
    "Rabbit": ProductCategoryName.RABBIT,
    "Toys": ProductCategoryName.TOYS
});

enum ProductCategoryThumbnailUrl {
    CATEGORY_QFS_ECOMMERCE_1711709305_JPG,
    CATEGORY_QFS_ECOMMERCE_1711709382_JPG,
    CATEGORY_QFS_ECOMMERCE_1711709399_JPG,
    CATEGORY_QFS_ECOMMERCE_1711709430_JPG
}

final productCategoryThumbnailUrlValues = EnumValues({
    "/category/qfs_ecommerce_1711709305.jpg": ProductCategoryThumbnailUrl.CATEGORY_QFS_ECOMMERCE_1711709305_JPG,
    "/category/qfs_ecommerce_1711709382.jpg": ProductCategoryThumbnailUrl.CATEGORY_QFS_ECOMMERCE_1711709382_JPG,
    "/category/qfs_ecommerce_1711709399.jpg": ProductCategoryThumbnailUrl.CATEGORY_QFS_ECOMMERCE_1711709399_JPG,
    "/category/qfs_ecommerce_1711709430.jpg": ProductCategoryThumbnailUrl.CATEGORY_QFS_ECOMMERCE_1711709430_JPG
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
