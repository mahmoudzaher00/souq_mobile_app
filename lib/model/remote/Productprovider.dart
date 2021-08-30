import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled1/model/local/exception.dart';
import 'package:untitled1/model/remote/Product.dart';
import 'api_service.dart';


class ProductProvider extends ChangeNotifier {
  ProductException? productException;
  Product? productResponse;

  fetchproduct() {
    ApiServices().fetchproduct().then((value) {
      if (value.statusCode == 200) {
        productResponse = Product.fromJson(json.decode(value.body));
      } else
        productException = ProductException.checkstatuscode(value.statusCode);
      notifyListeners();
    });
  }
}
