class ProductException{
  String message;
  ProductException({this.message});
  ProductException.checkstatuscode(int statuscode){
    switch(statuscode){
      case 404:
        throw ProductException(message: 'file not found');
      case 500:
        throw ProductException(message: 'Internal server error');
    }
}

}
