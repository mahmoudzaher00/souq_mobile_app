import 'package:flutter/material.dart';
import 'package:untitled1/model/local/ProductInfo.dart';
import 'package:untitled1/view/widgets/custom_text.dart';

class ProductsWidget extends StatelessWidget {
  List<ProductInfo> _productlist = [
    ProductInfo('LapTo', 'images/categoires/Electronics.jpg', '1400'),
    ProductInfo('LapTo', 'images/categoires/Electronics.jpg', '1400'),
    ProductInfo('LapTo', 'images/categoires/Electronics.jpg', '1400'),
    ProductInfo('LapTo', 'images/categoires/Electronics.jpg', '1400'),
    ProductInfo('LapTo', 'images/categoires/Electronics.jpg', '1400'),
    ProductInfo('LapTo', 'images/categoires/Electronics.jpg', '1400'),
    ProductInfo('LapTo', 'images/categoires/Electronics.jpg', '1400'),
    ProductInfo('LapTo', 'images/categoires/Electronics.jpg', '1400'),
  ];

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 2/2,
        ),
        shrinkWrap:true,
        physics: ScrollPhysics(),
        addRepaintBoundaries:true,
        itemCount: _productlist.length,
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
                      child: Image.asset(
                        '${_productlist[index].product_image}',
                        fit: BoxFit.fill,
                        height: 129,
                        width: double.infinity,
                      ),
                    ),

                   Container(
                       width: double.infinity,
                     height: 20,
                    child: Center(
                      child: CustomText(
                        text: '${_productlist[index].product_name}',
                        fontSize: 16,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(text: '${_productlist[index].product_prize}',),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.shopping_cart_rounded,color:Color.fromRGBO(42, 87, 128, 1) ,), onPressed: (){}),
                        IconButton(icon: Icon(Icons.favorite,color:Color.fromRGBO(42, 87, 128, 1) ,), onPressed: (){})
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
}

