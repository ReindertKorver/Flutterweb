import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageConnection {
  static Future<dynamic> GetImagesAsync() async{
    var key="unsplash API KEY ";
     var response = await http.get(
        "https://api.unsplash.com/search/photos?page=1/?per_page=1&query=landscape",
        headers: {
          "Authorization":
              "Client-ID $key"
        });
       
     
    return json.decode(response.body);
  }
}
