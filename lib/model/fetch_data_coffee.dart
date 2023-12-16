import 'dart:convert';
import 'package:coffee_shop/model/coffeeLoliModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Repository {
  final String apiUrl =
      "https://restapikafe-default-rtdb.firebaseio.com/menucafe.json?auth=C73RzVdhsvYc4225ULZqolRjcOgbrDvLuSxft26B";

  Future<List<CoffeeLoli>> fetchData() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<CoffeeLoli> dataCafe;

    

    if (response.statusCode == 200) {
      // Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> listJson = json.decode(response.body)["menucafe"];
      dataCafe = listJson.map((e) => CoffeeLoli.fromJson(e)).toList();

      // dataCafe = jsonData.values.map((value) {
      //   return CoffeeLoli.fromJson(value);
      // }).toList();

      
      print(dataCafe);
      return dataCafe;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
