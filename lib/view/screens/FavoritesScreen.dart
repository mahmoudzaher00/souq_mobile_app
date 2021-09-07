import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/view_model/favorite_view_model.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).padding.top;
    final appBar = AppBar().preferredSize.height;

    FavoriteViewModel _ref = Provider.of<FavoriteViewModel>(context);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _ref.viewAllFavorites();

    });
    return
      //_ref.filmList.isNotEmpty
     SafeArea(
       child: SingleChildScrollView(
         child: Container(
           child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - statusBar - appBar - 105,
                  child: ListView.builder(
                  itemCount: _ref.FavoritesList.length,
                  itemBuilder: (context,i){
                   return Card(
                     elevation: 10,
                     shape:  RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),),
                     child: ClipRRect(
                         borderRadius: BorderRadius.circular(16),
                     child: Container(
                        margin: EdgeInsets.all(12),
                        height: MediaQuery.of(context).size.height * 0.16,
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
                                  //scale: 1.5  ,
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${_ref.FavoritesList[i].favoritesName.substring(0,16)}",style: TextStyle(fontSize: 22),),
                                Text("${_ref.FavoritesList[i].favoritesPrice}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            IconButton(icon: Icon(Icons.delete,color: Colors.red,),

                                onPressed: () {
                              _ref.deletefav(_ref.FavoritesList[i], context);

                            })
                          ],
                        ),
                  ),
                   ));
                  }
                  ),
                ),

              ],
            ),
          ),
       ),
     );

        //:Container(child: Center(child: Text("No items")),);
  }
}
