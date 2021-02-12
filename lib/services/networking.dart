import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final String data = response.body;
      //print(data);
      final decodedData = jsonDecode(data);

      return decodedData;
    } else {}
  }
}
