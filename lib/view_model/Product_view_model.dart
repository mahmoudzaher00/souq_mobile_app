import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled1/model/Products.dart';
import 'package:untitled1/view/shared/Network/remote/exception.dart';

import '../model/Product.dart';
import '../view/shared/Network/remote/api_service.dart';


class ProductProvider extends ChangeNotifier {
  static ProductException productException;
  static Products productResponse;

static  fetchproduct() {
    ApiServices().fetchproduct().then((value) {
      if (value.statusCode == 200) {
        productResponse = Products.fromJson(json.decode(value.body));
        print(productResponse.data.data);
      } else
        productException = ProductException.checkstatuscode(value.statusCode);

    });
  }
}
