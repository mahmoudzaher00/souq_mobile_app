import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/model/db/Favorites.dart';
import 'package:untitled1/model/db/db_helper.dart';
import 'package:untitled1/model/remote/Productprovider.dart';
import 'package:untitled1/view/widgets/custom_text.dart';
import 'package:untitled1/view_model/favorite_view_model.dart';

class ProductsWidget extends StatefulWidget {
  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  DbHelper _helper;
  List<Favorites> _list = [];

  @override
  void initState() {
    _helper=DbHelper();
    _helper.createDB();
    _ViewAllFavorites();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _ref =Provider.of<FavoriteViewModel>(context);
    ProductProvider product = Provider.of<ProductProvider>(context);
    product.fetchproduct();


    return  GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 2/2,
        ),
        shrinkWrap:true,
        physics: ScrollPhysics(),
        addRepaintBoundaries:true,
        itemCount: product.productResponse.data.data.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
            elevation: 4,
            child: Column(
             children: [
               ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.network(
                        '${product.productResponse.data.data[index].image}',
                        fit: BoxFit.fill,
                        height: 129,
                        width: double.infinity,
                      ),
                    ),

                   // Flexible(
                   //   child: Container(
                   //       width: double.infinity,
                   //     height: 20,
                   //     child: CustomText(
                   //        text: '${product.productResponse.data.data[index].name}',
                   //        fontSize: 16,
                   //      ),
                   //    ),
                   // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(text: '${product.productResponse.data.data[index].price}',),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.shopping_cart_rounded,color:Color.fromRGBO(42, 87, 128, 1) ,), onPressed: (){}),
                       product.productResponse.data.data[index].inFavorites?
                       IconButton(icon: Icon(Icons.favorite,color:Color.fromRGBO(42, 87, 128, 1) ,), onPressed: (){
                         Favorites fa=Favorites(
                           favoritesImage: '${product.productResponse.data.data[index].image}',
                           //favoritesName: '${product.productResponse.data.data[index].name}',
                           favoritesPrice: '${product.productResponse.data.data[index].price}'
                         );
                         _SaveFavorites(fa);
                         product.productResponse.data.data[index].inFavorites = _ref.isfav;
                         _ref.onclick();


                       }):
                       IconButton(icon: Icon(Icons.favorite_border,), onPressed: (){
                         product.productResponse.data.data[index].inFavorites = _ref.isfav;
                         _ref.onclick();
                       })
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      );

    }

  void _SaveFavorites(Favorites fa) {
    _helper.saveFavorites(fa).then((value) {
      print(value);
      _ViewAllFavorites();
    });

  }
  void _ViewAllFavorites() {
    _helper.viewFavorites().then((value) {
      setState(() {
        print(value);
        _list=value;
      });

    });
  }
  Widget ListDataView(List<Favorites>list){
    return Container(
      margin: EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.grey,
      child: ListView.builder(
        itemCount: _list.length,
        shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: double.infinity,
                  width: 160,
                  child: Image.network(
                    '${_list[index].favoritesImage}',
                    fit: BoxFit.fill,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${_list[index].favoritesName}'),
                  Text('${_list[index].favoritesPrice}'),
                ],
              ),
              IconButton(icon: Icon(Icons.favorite), onPressed: () {})
            ],
          );
        }),
    );
  }
}


