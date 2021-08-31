import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled1/view/shared/Network/remote/exception.dart';

import '../../../../model/Product.dart';
import 'api_service.dart';


class ProductProvider extends ChangeNotifier {
  ProductException productException;
  Product productResponse;

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
