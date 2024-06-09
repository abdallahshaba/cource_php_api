
import 'package:http/http.dart' as http;
import 'dart:convert';


class Crud {
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
}