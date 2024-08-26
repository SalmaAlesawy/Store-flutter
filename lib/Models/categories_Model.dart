import 'dart:convert';

CatgoryModel catgoryModelFromJson(String str) => CatgoryModel.fromJson(json.decode(str));

String catgoryModelToJson(CatgoryModel data) => json.encode(data.toJson());

class CatgoryModel {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  CatgoryModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory CatgoryModel.fromJson(Map<String, dynamic> json) => CatgoryModel(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    category: json["category"],
    price: json["price"]?.toDouble(),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "category": category,
    "price": price,
    "thumbnail": thumbnail,
  };
}
