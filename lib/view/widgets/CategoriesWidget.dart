import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/model/local/CategoriesInfo.dart';
import 'package:untitled1/view/widgets/custom_text.dart';

class CategoriesWidget extends StatelessWidget {
  List<CategoriesInfo> _Categorieslist=[
    CategoriesInfo('images/categoires/Electronics.jpg', 'Electronics'),
    CategoriesInfo('images/categoires/supermarhet.jpg', 'Super Market'),
    CategoriesInfo('images/categoires/HealthBeauty.jpg', 'Health & Beauty'),
    CategoriesInfo('images/categoires/Sports.jpg', 'Sports'),
    CategoriesInfo('images/categoires/Toys.jpg', 'Toys'),


  ] ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      child: ListView.builder(
       scrollDirection:Axis.horizontal ,
        itemCount: _Categorieslist.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    '${_Categorieslist[index].category_image}',
                      fit: BoxFit.fill,
                      height: 130,
                      width: 150,),
                  Container(
                    color: Colors.grey.shade600,
                      width: 150,
                      height: 20,
                      child: Center(child: CustomText(text: '${_Categorieslist[index].category_name}',color: Colors.white,fontSize: 18,))),

                ],
              ),
            ),
          );
         }
       ),
    );
  }
}
