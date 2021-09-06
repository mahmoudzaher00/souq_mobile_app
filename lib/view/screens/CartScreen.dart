import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/MainAppbar.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .86,
                child: ListView.builder(
                    itemCount:CartViewModel.getCart.data.cartItems.length,
                    itemBuilder: (context, i) {
                      return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              margin: EdgeInsets.all(12),
                              height: MediaQuery.of(context).size.height * 0.16,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: double.infinity,
                                      width: 160,
                                      child: Image.network(
                                        "${CartViewModel.getCart.data.cartItems[i].product.image}",
                                        //fit: BoxFit.fill,
                                        //scale: 1.5  ,
                                        // height: 50,
                                        // width: 50,
                                      )
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${CartViewModel.getCart.data.cartItems[i].product.name.substring(0,16)}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "${CartViewModel.getCart.data.cartItems[i].product.price}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {

                                      })
                                ],
                              ),
                            ),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
