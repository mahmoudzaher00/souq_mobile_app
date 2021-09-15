
import 'dart:core';




class Cartgetmodel {
  bool status;
  dynamic message;
  Data data;

  Cartgetmodel.fromJson(Map<String, dynamic> json){
    status= json["status"] ;
    message= json["message"];
    data=  json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  List<CartItem> cartItems;
  double subTotal;
  double total;

   Data.fromJson(Map<String, dynamic> json) {
    cartItems= List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x)));
    subTotal= json["sub_total"].toDouble();
    total= json["total"].toDouble();
  }
}

class CartItem {
  int id;
  int quantity;
  Product product;

   CartItem.fromJson(Map<String, dynamic> json) {
     id = json["id"];
     quantity = json["quantity"];
     product = Product.fromJson(json["product"]);
   }
}

class Product {

  int id;
  double price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

   Product.fromJson(Map<String, dynamic> json){
    id=json["id"];
    price= json["price"].toDouble();
    oldPrice= json["old_price"];
    discount= json["discount"];
    image= json["image"];
    name= json["name"];
    description= json["description"];
    images= List<String>.from(json["images"].map((x) => x));
    inFavorites= json["in_favorites"];
    inCart= json["in_cart"];
  }


}
