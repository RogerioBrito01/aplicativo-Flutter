import 'package:flutter_application_4/core/api_config.dart';
import 'package:flutter_application_4/data/datasorce/film_datasorce.dart';
import 'package:flutter_application_4/data/datasorce/film_datasorce_imp.dart';
import 'package:get/get.dart';

import 'package:flutter_application_4/data/repositories/film_repository_imp.dart';
import 'package:flutter_application_4/domain/repositories/film_repository.dart';
import 'package:flutter_application_4/domain/usecase/film_usecase.dart';
import 'package:flutter_application_4/domain/usecase/film_usecase_imp.dart';
import 'package:flutter_application_4/presentation/controllers/film_controller.dart';

class FilmBinding implements Bindings {
  @override
  void dependencies() {
  Get.lazyPut<FilmDataSource>(() => ApiFilmDataSource(ApiConfig.apiUrl));
    Get.lazyPut<FilmRepository>(() => FilmRepositoryImp(Get.find()));
    Get.lazyPut<FilmUseCase>(() => UsecaseFilmImp(Get.find()));
    Get.lazyPut<FilmController>(() => FilmController());
  }
}
