import 'dart:convert';
import 'package:countries_app/internals/country_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  String baseUrl = 'https://restcountries.com/v3.1/';

  Future<List<Country>> getAllCountries() async {
    var allApi = "all";
    http.Response res = await http.get(Uri.parse(baseUrl + allApi));
    try {
      if (res.statusCode == 200) {
        print("Connected");
        List<dynamic> list = json.decode(res.body);
        //list.removeLast();
        print("List Length: ${list.length}");
        return list.map((e) => Country.fromJson(e)).toList();
      } else {
        print("Failed");
        return <Country>[];
      }
    } catch (e) {
      return <Country>[];
    }
  }
}
