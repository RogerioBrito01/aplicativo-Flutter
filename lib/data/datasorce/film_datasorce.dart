
abstract class FilmDataSource {
  Future<List<Map<String, dynamic>>> getFilms();
  Future<void> createFilm(Map<String, dynamic> filmJson);
  Future<void> updateFilm(String id, Map<String, dynamic> updatedFilmJson);
  Future<void> deleteFilm(String id);
}

