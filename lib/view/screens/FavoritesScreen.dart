import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/model/db/Favorites.dart';
import 'package:untitled1/model/db/db_helper.dart';
import 'package:untitled1/model/remote/Productprovider.dart';

class FavoritesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: double.infinity,
              width: 160,
              child: Image.asset(
                'images/slideshow/3.jpg',
                fit: BoxFit.fill,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Apple MacBook pro'),
              Text('4050 S'),
            ],
          ),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {})
        ],
      ),
    );
  }


}
