import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/clothing.dart';

class ApiService {

static const String server =
    "http://10.0.2.2:5000";

static const String clothingApi =
    "$server/clothing";

  //----------------------------------------------------
  // GET ALL CLOTHING
  //----------------------------------------------------
Future<List<Clothing>> getAllClothing() async {

  final response = await http.get(
    Uri.parse(clothingApi),
  );

  

  final decoded = jsonDecode(response.body);

  
  final List<dynamic> data = decoded;

  return data
      .map((item) {

        print(item);

        return Clothing.fromJson(item);

      })
      .toList();
}
  //----------------------------------------------------
  // GET CLOTHING BY ID
  //----------------------------------------------------

  Future<Clothing> getClothingById(
      String id) async {

    final response = await http.get(
      Uri.parse("$clothingApi/$id"),
    );

    if (response.statusCode == 200) {

      return Clothing.fromJson(
        jsonDecode(response.body),
      );

    }

    throw Exception("Failed to load clothing.");

  }

  //----------------------------------------------------
  // SEARCH CLOTHING
  //----------------------------------------------------

  Future<List<Clothing>> searchClothing(
      String query) async {

    final response = await http.get(

      Uri.parse(
          "$clothingApi/search?q=${Uri.encodeComponent(query)}"),

    );

    if (response.statusCode == 200) {

      final Map<String, dynamic> json =
          jsonDecode(response.body);

      final List<dynamic> data = json["data"];

      return data
          .map((item) => Clothing.fromJson(item))
          .toList();

    }

    throw Exception("Search failed.");

  }

  //----------------------------------------------------
  // FILTER CLOTHING
  //----------------------------------------------------

  Future<List<Clothing>> filterClothing({

    String? gender,
    String? category,
    String? season,
    String? occasion,

  }) async {

    final queryParameters = <String, String>{};

    if (gender != null)
      queryParameters["gender"] = gender;

    if (category != null)
      queryParameters["category"] = category;

    if (season != null)
      queryParameters["season"] = season;

    if (occasion != null)
      queryParameters["occasion"] = occasion;

    final uri = Uri.parse(
      "$clothingApi/filter",
    ).replace(
      queryParameters: queryParameters,
    );

    final response =
        await http.get(uri);

    if (response.statusCode == 200) {

      final Map<String, dynamic> json =
          jsonDecode(response.body);

      final List<dynamic> data =
          json["data"];

      return data
          .map((item) =>
              Clothing.fromJson(item))
          .toList();

    }

    throw Exception("Filter failed.");

  }

  //----------------------------------------------------
  // INCREMENT VIEW COUNT
  //----------------------------------------------------

  Future<void> incrementView(
      String id) async {

    final response = await http.post(

      Uri.parse(
        "$clothingApi/$id/view",
      ),

    );

    if (response.statusCode != 200) {

      throw Exception(
          "Failed to increment view count.");

    }

  }

}