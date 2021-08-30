class Favorites {
  int? favoritesId;
  String? favoritesImage;
  String? favoritesName;
  String? favoritesPrice;

  Favorites({this.favoritesId, this.favoritesImage, this.favoritesName, this.favoritesPrice});


  Map<String, dynamic> toMap() {
    return {'favoritesId': favoritesId, 'favoritesImage': favoritesImage, 'favoritesName': favoritesName,'favoritesPrice':favoritesPrice};
  }

  Favorites.fromMap(Map<String, dynamic> map){
    favoritesId = map['favoritesId'];
    favoritesImage = map['favoritesImage'];
    favoritesName = map['favoritesName'];
    favoritesPrice = map['favoritesPrice'];
  }
}
