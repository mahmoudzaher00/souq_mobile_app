class ProductInfo{
  String _product_name;
  String _product_image;
  String _product_prize;

  String get product_name => _product_name;
  String get product_image => _product_image;
  String get product_prize => _product_prize;


  ProductInfo(this._product_name, this._product_image,this._product_prize);
}