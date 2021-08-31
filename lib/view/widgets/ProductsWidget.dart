import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/model/db/Favorites.dart';
import 'package:untitled1/view/shared/Network/remote/Productprovider.dart';

import 'package:untitled1/view/widgets/custom_text.dart';
import 'package:untitled1/view_model/favorite_view_model.dart';

class ProductsWidget extends StatefulWidget {
  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    FavoriteViewModel _ref = Provider.of<FavoriteViewModel>(context);
    ProductProvider product = Provider.of<ProductProvider>(context);
    product.fetchproduct();
    return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.9/2,
      ),
      shrinkWrap:true,
      physics: ScrollPhysics(),
      addRepaintBoundaries:true,
      itemCount: product.productResponse!.data!.data!.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
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
                  '${product.productResponse!.data!.data![index].image}',
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
                       text: '${product.productResponse!.data!.data![index].name!.substring(0,16)}',
                       fontSize: 16,
                     ),
                  ),
                 ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(text: '${product.productResponse!.data!.data![index].price}',),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.shopping_cart_rounded,color:Color.fromRGBO(42, 87, 128, 1) ,), onPressed: (){}),
                      product.productResponse!.data!.data![index].inFavorites!?
                      IconButton(icon: Icon(Icons.favorite,color:Color.fromRGBO(42, 87, 128, 1) ,),
                          onPressed: (){
                             product.productResponse!.data!.data![index].inFavorites = _ref.isfav;
                            _ref.onclick();
                          }):
                      IconButton(icon: Icon(Icons.favorite_border,), onPressed: (){

                          Favorites f = Favorites(
                            favoritesId:product.productResponse!.data!.data![index].id,
                            favoritesImage: product.productResponse!.data!.data![index].image,
                            favoritesName: product.productResponse!.data!.data![index].name,
                            favoritesPrice: "${product.productResponse!.data!.data![index].price}",
                          );
                          _ref.addFav(f ,context);


                        print("${_ref.viewAllFavorites()}");
                        product.productResponse!.data!.data![index].inFavorites = _ref.isfav;
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



