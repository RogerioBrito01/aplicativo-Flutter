import 'dart:convert';

import 'package:flutter_application_4/data/datasorce/film_datasorce.dart';
import 'package:http/http.dart'as http;

class ApiFilmDataSource implements FilmDataSource {
  final String apiUrl;

  ApiFilmDataSource(this.apiUrl);

  @override
  Future<List<Map<String, dynamic>>> getFilms() async {
    final response = await http.get(Uri.parse('$apiUrl/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> createFilm(Map<String, dynamic> filmJson) async {
    await http.post(
      Uri.parse('$apiUrl/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(filmJson),
    );
  }

  @override
  Future<void> deleteFilm(String id) async {
    await http.delete(Uri.parse('$apiUrl/$id'));
  }

  @override
  Future<void> updateFilm(String id, Map<String, dynamic> updatedFilmJson) async {
    await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedFilmJson),
    );
  }
}
