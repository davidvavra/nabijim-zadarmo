import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class Mapotic {
  static Future<List<Charger>> getChargers() async {
    var response =
        await http.get("https://www.mapotic.com/nabijim-zadarmo/opendata.json");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var places = List.from(json["places"]);
      return places.map((e) => Charger.fromJson(e)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
