import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/view_model/favorite_view_model.dart';

class FavoritesScreen extends StatefulWidget {

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {
    FavoriteViewModel _ref = Provider.of<FavoriteViewModel>(context);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _ref.viewAllFavorites();

    });
    return
      //_ref.filmList.isNotEmpty?
    Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.78,
            child: ListView.builder(
            itemCount: _ref.FavoritesList.length,
            itemBuilder: (context,i){
             return Container(
                margin: EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.grey,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: double.infinity,
                        width: 160,
                        child: Image.network(
                          _ref.FavoritesList[i].favoritesImage,
                          fit: BoxFit.fill,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${_ref.FavoritesList[i].favoritesId}"),
                        Text("${_ref.FavoritesList[i].favoritesPrice}"),
                      ],
                    ),
                    IconButton(icon: Icon(Icons.favorite), onPressed: () {})
                  ],
                ),
            );
            }
            ),
          ),

        ],
      ),
    );
        //:Container(child: Center(child: Text("No items")),);
  }
}
