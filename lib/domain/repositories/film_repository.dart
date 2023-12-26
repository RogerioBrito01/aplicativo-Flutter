import 'package:flutter_application_4/domain/entities/film_entity.dart';

abstract class FilmRepository{
  Future<List<Film>>getFilms();
  Future<void> createFilm(Film film);
  Future<void> updateFilm(String id, Film film);
  Future<void> deleteFilm(String id);
}