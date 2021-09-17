import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/model/db/Favorites.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:untitled1/view/shared/Network/remote/exception.dart';
import 'package:untitled1/view_model/Product_view_model.dart';
import 'package:untitled1/view/shared/components/components.dart';
import 'package:untitled1/view/widgets/custom_text.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';
import 'package:untitled1/view_model/favorite_view_model.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FavoriteViewModel _ref = Provider.of<FavoriteViewModel>(context);
    CartViewModel cartModel = Provider.of<CartViewModel>(context);

    Future<void> sendorRemoveCartData(var id) async {
      if (await checkInternetConnectivity()) {
        cartModel.PostCartData(id:id);
        if(cartModel.postCart != null ){
          makeToast(cartModel.postCart.message);
        }else {
          makeToast("Failed to send data ");
        }
      }
      else{
        makeToast("${LocaleKeys.Nointernet.tr()}");
      }
    }

      return Consumer<ProductProvider>(
      builder: (context,ProductProvider productRef, child) {
        if(productRef.productResponse != null){
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.9 / 2,
            ),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            addRepaintBoundaries: true,
            itemCount: productRef.productResponse.data.products.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.network(
                        '${productRef.productResponse.data.products[index]
                            .image}',
                        fit: BoxFit.fill,
                        height: 125,
                        width: double.infinity,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: 28,
                        child: Center(
                          child: CustomText(
                            text:
                            '${productRef.productResponse.data.products[index]
                                .name.substring(0, 16)}',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText(
                          text: '${productRef.productResponse.data.products[index].price}',
                        ),
                        Row(
                          children: [
                            productRef.productResponse.data.products[index]
                                .inCart ?
                            IconButton(
                                icon: Icon(
                                  Icons.shopping_cart_rounded,
                                  color: Color.fromRGBO(42, 87, 128, 1),
                                ),
                                onPressed: () {
                                  print( productRef.productResponse.data.products[0].name);
                                  sendorRemoveCartData(productRef.productResponse.data.products[index].id);
                                }) :
                            IconButton(
                                icon: Icon(
                                  Icons.shopping_cart_rounded,

                                ),
                                onPressed: () {
                                  print( productRef.productResponse.data.products[index].id);
                                  sendorRemoveCartData(productRef.productResponse.data.products[index].id);
                                }
                                ),
                            productRef.productResponse.data.products[index].inFavorites ?
                            IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Color.fromRGBO(42, 87, 128, 1),
                                ),
                                onPressed: () {
                                  productRef.productResponse.data.products[index].inFavorites = _ref.isfav;
                                  _ref.onclick();
                                })
                                : IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                ),
                                onPressed: () {
                                  Favorites f = Favorites(
                                    favoritesId: productRef.productResponse
                                        .data.products[index].id,
                                    favoritesImage: productRef.productResponse
                                        .data.products[index].image,
                                    favoritesName: productRef.productResponse
                                        .data.products[index].name,
                                    favoritesPrice:
                                    "${productRef.productResponse.data
                                        .products[index].price}",
                                  );
                                  _ref.addFav(f, context);

                                  print("${_ref.viewAllFavorites()}");
                                  productRef.productResponse.data.products[index].inFavorites = _ref.isfav;
                                  _ref.onclick();
                                })
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else if(productRef.productException != null){
          return Text(productRef.productException.message);
        }else {

            return Center(child: CircularProgressIndicator(),);
        }

    },
   );
  }
}
