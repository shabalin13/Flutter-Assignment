import 'dart:convert';
import 'package:http/http.dart' as http;


class HttpService {
  static Future<List<String>> getRandomJoke({String? category}) async {
    String withCategory = (category == null) ? '' : '?category=$category';
    final response = await http
        .get(Uri.parse('https://api.chucknorris.io/jokes/random/$withCategory'));
    var responseData = json.decode(response.body);
    return [responseData['icon_url'], responseData['value'], responseData['url']];
  }

  static Future<List<String>> getCategories() async {
    final response = await http
        .get(Uri.parse('https://api.chucknorris.io/jokes/categories'));
    var responseData = json.decode(response.body);
    List<String> categories = [];
    for (var el in responseData) {
      categories.add(el.toString());
    }
    return categories;
  }

  static Future<List<List<String>>> search(String query) async {
    final response = await http
        .get(Uri.parse('https://api.chucknorris.io/jokes/search?query=$query'));
    var responseData = json.decode(response.body);
    List<List<String>> searchResult = [];
    for (var el in responseData['result']) {
      searchResult.add([el['icon_url'], el['value'], el['url']]);
    }
    return searchResult;
  }
}