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
// class WeatherException{
//   String message;
//   WeatherException({this.message});
//   WeatherException.checkstatuscode(String statuscode){
//     switch(statuscode){
//       case '404':
//         throw WeatherException(message: 'file not found');
//       case '500':
//         throw WeatherException(message: 'Internal server error');
//     }
//   }
//
// }