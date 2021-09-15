import 'dart:core';

class Product {
  bool status;
  dynamic message;
  Data data;

   Product.fromJson(Map<String, dynamic> json){
     status=json["status"];
     message= json["message"];
     data= json["data"] != null ? Data.fromJson(json["data"]) : null ;
   }


}

class Data {
  List<Banner> banners;
  List<ProductElement> products;
  String ad;

   Data.fromJson(Map<String, dynamic> json) {
    banners= List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x)));
    products= List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x)));
    ad= json["ad"];
   }


}

class Banner {
  Banner({
    this.id,
    this.image,
    this.category,
    this.product,
  });

  int id;
  String image;
  dynamic category;
  dynamic product;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    image: json["image"],
    category: json["category"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category": category,
    "product": product,
  };
}

class ProductElement {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

   ProductElement.fromJson(Map<String, dynamic> json){
    price= json["price"].toDouble();
    oldPrice= json["old_price"].toDouble();
    discount= json["discount"];
    image= json["image"];
    name= json["name"];
    description= json["description"];
    images= List<String>.from(json["images"].map((x) => x));
    inFavorites= json["in_favorites"];
    inCart= json["in_cart"];
  }

}
