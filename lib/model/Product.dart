import 'dart:core';

class Product {
  bool status;
  dynamic message;
  Data data;

   Product.fromJson(Map<String, dynamic> json){
     status= json["status"];
     message= json["message"];
     data= (json["data"]) != null ? Data.fromJson(json["data"]) : null ;
   }
}

class Data {
  List<ProductElement> products;
  String ad;

   Data.fromJson(Map<String, dynamic> json)
   {
     products= List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x)));
     ad= json["ad"];
   }

}

class ProductElement {
  ProductElement({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

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

   ProductElement.fromJson(Map<String, dynamic> json)
   {
     id= json["id"];
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
