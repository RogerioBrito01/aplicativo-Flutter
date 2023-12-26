

import 'package:flutter_application_4/domain/entities/film_entity.dart';
import 'package:flutter_application_4/domain/usecase/film_usecase.dart';
import 'package:get/get.dart';

class FilmController extends GetxController {
  final FilmUseCase _filmUseCase = Get.find();
  final films = <Film>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFilms();
  }

  Future<void> loadFilms() async {
    try {
      final filmsData = await _filmUseCase.getFilms();
      films.assignAll(filmsData);

    } catch (e) {
      // Lidar com o erro conforme necessário
      print('Erro ao carregar filmes: $e');
    }
  }

  Future<bool> createFilm(Film film) async {
    try {
      await _filmUseCase.createFilm(film);
      loadFilms();
       return true;
    } catch (e) {
      // Lidar com o erro conforme necessário
      print('Erro ao criar filme: $e');
        return false;
    }
  }

  Future<void> updateFilm(String id, Film film) async {
  try {
    await _filmUseCase.updateFilm(id, film);  

  } catch (e) {
    // Lidar com o erro conforme necessário
    print('Erro ao atualizar filme: $e');
  }
}
  Future<void> deleteFilm(String id) async {
    try {
      await _filmUseCase.deleteFilm(id);
      loadFilms();
    } catch (e) {
      // Lidar com o erro conforme necessário
      print('Erro ao excluir filme: $e');
    }
  }
}