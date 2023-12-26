import 'package:flutter_application_4/domain/entities/film_entity.dart';
import 'package:flutter_application_4/domain/repositories/film_repository.dart';
import 'package:flutter_application_4/domain/usecase/film_usecase.dart';

class UsecaseFilmImp implements FilmUseCase{
  final FilmRepository _filmRepository;
  UsecaseFilmImp(this._filmRepository);
  @override
  Future<void> createFilm(Film film)async{
    try {
       return _filmRepository.createFilm(film);
    } catch (e) {
       throw Exception('Erro ao criar filmes: USECASE $e');
    }
  
  }

  @override
  Future<void> deleteFilm(String id)async {
   return _filmRepository.deleteFilm(id);
  }

  @override
  Future<List< Film>> getFilms() async{
    try {
      return  await _filmRepository.getFilms();
    } catch (e) {
        throw Exception('Erro ao obter filmes: USECASE $e');
    }
    
  }

  @override
  Future<void> updateFilm(String id, Film film) async{
   return await _filmRepository.updateFilm(id, film);
  }

}