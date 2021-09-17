import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:untitled1/view/shared/Network/local/shared_pref.dart';

class ApiServices{
  static ApiServices _apiServices;
  ApiServices._getInstance();
  factory ApiServices(){
    if(_apiServices==null){
      return _apiServices=ApiServices._getInstance();
    }else return _apiServices;
  }
  Future<http.Response>fetchproduct()async{
    String Url='https://student.valuxapps.com/api/home';
    Response response = await http.get(
        Uri.parse(Url),
        headers: {
          'Authorization': MySharedPreferences.getData(key: "token"),
        }
        );
    
   // print(response.body);
    return response;
  }
}