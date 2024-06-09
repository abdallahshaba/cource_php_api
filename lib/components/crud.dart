
import 'package:http/http.dart' as http;
import 'dart:convert';


class Crud {
  // Post Request
  getRequest(String url) async {
    try {
      var respons = await http.get(Uri.parse(url));
      if(respons.statusCode==200){
        var responsBody = jsonDecode(respons.body);
        return responsBody;
      }
      else{
        // ignore: avoid_print
        print(" Error : ${respons.statusCode}");
      }
    }
    catch(e){
      // ignore: avoid_print
      print("Error Catch $e");
    }
  }




  // Post Request
  postRequest(String url , Map data) async {
    await Future.delayed(Duration(seconds: 3));
    try {
      var respons = await http.post(Uri.parse(url) , body: data);
      if(respons.statusCode==200){
        var responsBody = jsonDecode(respons.body);
        return responsBody;
      }
      else{
        // ignore: avoid_print
        print(" Error : ${respons.statusCode}");
      }
    }
    catch(e){
      // ignore: avoid_print
      print("Error Catch $e");
    }
  }
}