import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/view/shared/components/components.dart';
import 'package:untitled1/view/widgets/MainAppbar.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled1/view_model/Product_view_model.dart';

class CartScreen extends StatefulWidget {


  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    CartViewModel ref = Provider.of<CartViewModel>(context);

    Future<void> removeCartData(int id) async {
      if (await checkInternetConnectivity()) {
        ref.PostCartData(id: id);
        if(ref.postCart.status == true && ref.postCart.status != null){
          makeToast(ref.postCart.message);
        }else if (ref.postCart.status == false){
          makeToast(ref.postCart.message);
        }
      }
      else{
        makeToast("${LocaleKeys.Nointernet.tr()}");
      }
    }
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .86,
                child: ListView.builder(
                    itemCount: ref.getCart.data.cartItems.length,
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
                                         "",
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
                                        "",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // IconButton(
                                  //     icon: Icon(
                                  //       Icons.remove_shopping_cart,
                                  //       color: Colors.red,
                                  //     ),
                                  //     onPressed: () {
                                  //       ref.x.removeAt(i);
                                  //       removeCartData(ProductProvider.productResponse.data.data[i].id);
                                  //
                                  //     })
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
