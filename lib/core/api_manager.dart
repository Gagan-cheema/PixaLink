import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pixa_link/core/model.dart';
import 'package:pixa_link/utils/constants.dart';

class ApiManager {
  static Future<List<ImageModel>> fetchImages() async {
    final response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.apiKey}'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<dynamic> hits = responseData['hits'];
      return hits.map((json) => ImageModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
