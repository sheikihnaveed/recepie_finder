
import 'package:http/http.dart' as http;
import '../utilities/constants.dart';


class apicall{

  var client = http.Client();

  Future<dynamic> getData(String api) async {
    var url = Uri.parse(baseUrlApi + api);
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        return response.body;

      } else {
        print(response.statusCode);
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


}