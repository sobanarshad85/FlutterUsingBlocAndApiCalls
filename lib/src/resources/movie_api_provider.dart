import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<User> fetchMovieList1() async {
    final response =
        await client.get("https://jsonplaceholder.typicode.com/users");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
     print(User.fromJson(json.decode(response.body)));
     return User.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
        await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
