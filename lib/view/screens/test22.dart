import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';

class Test22 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return Test22State();
  }
  
}
class Test22State extends State<Test22>{

  @override
  Widget build(BuildContext context) {
    CartViewModel ref = Provider.of<CartViewModel>(context);
    ref.getCartData();
    return Scaffold(
      body:ref.getCart != null? Center(
        child: Container(
          child: Text(ref.getCart.data.cartItems[0].product.name),
        ),
      ):Center(child: CircularProgressIndicator(),)
    );
  }
  
}