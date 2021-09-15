import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/model/db/Favorites.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:untitled1/view_model/Product_view_model.dart';
import 'package:untitled1/view/shared/components/components.dart';
import 'package:untitled1/view/widgets/custom_text.dart';
import 'package:untitled1/view_model/Cart_View_Model.dart';
import 'package:untitled1/view_model/favorite_view_model.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductsWidget extends StatefulWidget {

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  void initState() {
    ProductProvider.fetchproduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    FavoriteViewModel _ref = Provider.of<FavoriteViewModel>(context);
    CartViewModel cartModel = Provider.of<CartViewModel>(context);

    Future<void> sendorRemoveCartData(int id) async {
        if (await checkInternetConnectivity()) {
          cartModel.PostCartData(id: id);
          if(cartModel.postCart.status == true && cartModel.postCart.status != null){
            makeToast(cartModel.postCart.message);
          }else if (cartModel.postCart.status == false){
            makeToast(cartModel.postCart.message);
          }
          }
          else{
          makeToast("${LocaleKeys.Nointernet.tr()}");
        }
      }

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.9 / 2,
        ),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        addRepaintBoundaries: true,
        itemCount: ProductProvider.productResponse.data.products.length,
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
                    '${ProductProvider.productResponse.data.products[index]
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
                        '${ProductProvider.productResponse.data.products[index]
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
                      text: '${ProductProvider.productResponse.data
                          .products[index].price}',
                    ),
                    Row(
                      children: [
                        ProductProvider.productResponse.data.products[index]
                            .inCart ?
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart_rounded,
                              color: Color.fromRGBO(42, 87, 128, 1),
                            ),
                            onPressed: () {
                              print( ProductProvider.productResponse.data.products[0].name);
                              sendorRemoveCartData(
                                  ProductProvider.productResponse.data
                                      .products[index].id);
                            }) :
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart_rounded,

                            ),
                            onPressed: () {
                              print( ProductProvider.productResponse.data.products[index].id);
                              sendorRemoveCartData(
                                  ProductProvider.productResponse.data.products[index].id);
                            }),
                        ProductProvider.productResponse.data.products[index]
                            .inFavorites
                            ? IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Color.fromRGBO(42, 87, 128, 1),
                            ),
                            onPressed: () {
                              ProductProvider.productResponse.data.products
                                  [index]
                                  .inFavorites = _ref.isfav;
                              _ref.onclick();
                            })
                            : IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                            ),
                            onPressed: () {
                              Favorites f = Favorites(
                                favoritesId: ProductProvider.productResponse
                                    .data.products[index].id,
                                favoritesImage: ProductProvider.productResponse
                                    .data.products[index].image,
                                favoritesName: ProductProvider.productResponse
                                    .data.products[index].name,
                                favoritesPrice:
                                "${ProductProvider.productResponse.data
                                    .products[index].price}",
                              );
                              _ref.addFav(f, context);

                              print("${_ref.viewAllFavorites()}");
                              ProductProvider.productResponse.data.products[index].inFavorites = _ref.isfav;
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
    }
  }
