


import 'dart:core';

class Cart {
  bool status;
  String message;
  CartData data;

   Cart.fromJson(Map<String, dynamic> json) {
    status= json["status"];
    message= json["message"];
    data = CartData.fromJson(json['data']);
}
}

class CartData {
  int id;
  int quantity;
  CartProduct product;

  CartData.fromJson(Map<String, dynamic> json) {
    id= json["id"];
    quantity= json["quantity"];
    product = CartProduct.fromJson(json['product']);  }


}

class CartProduct {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;

  CartProduct.fromJson(Map<String, dynamic> json) {
    id= json["id"];
    price= json["price"];
    oldPrice= json["old_price"];
    discount= json["discount"];
    image= json["image"];
    name= json["name"];
    description= json["description"];
  }

}
