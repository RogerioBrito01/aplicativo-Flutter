import 'package:flutter_application_4/data/datasorce/film_datasorce.dart';

import 'package:flutter_application_4/data/models/film_model.dart';
import 'package:flutter_application_4/domain/entities/film_entity.dart';
import 'package:flutter_application_4/domain/repositories/film_repository.dart';

class FilmRepositoryImp implements FilmRepository {
  final FilmDataSource _dataSource;

  FilmRepositoryImp(this._dataSource);

  @override
  Future<void> createFilm(Film film) async {
    if (film is FilmModel) {
      final filmJson = film.toJson();
      await _dataSource.createFilm(filmJson);
    } else {
      // Lidar com o erro ou converter para FilmModel, dependendo da lógica do seu aplicativo
      throw Exception('Film must be of type FilmModel for creating');
    }
  }

  @override
  Future<void> deleteFilm(String id) async {
    await _dataSource.deleteFilm(id);
  }

  @override
  Future<List<Film>> getFilms() async {
    try {
       final List<Map<String, dynamic>> filmJsonList = await _dataSource.getFilms();
    final List<Film> films = filmJsonList.map((json) => FilmModel.fromJson(json)).toList();
    return films;
    } catch (e) {
     
      throw Exception('Erro ao obter filmes: repositori$e');
    }
    
  }

  @override
   Future<void> updateFilm(String id, Film film) async {
     final filmModel = FilmModel.fromEntity(film);
    final updatedFilmJson = filmModel.toJson();
    await _dataSource.updateFilm(id, updatedFilmJson);
}
}