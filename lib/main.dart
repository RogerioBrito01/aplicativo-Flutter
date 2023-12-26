import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/api_config.dart';
import 'package:flutter_application_4/data/datasorce/film_datasorce.dart';
import 'package:flutter_application_4/data/datasorce/film_datasorce_imp.dart';
import 'package:flutter_application_4/data/repositories/film_repository_imp.dart';
import 'package:flutter_application_4/domain/repositories/film_repository.dart';
import 'package:flutter_application_4/domain/usecase/film_usecase.dart';
import 'package:flutter_application_4/domain/usecase/film_usecase_imp.dart';
import 'package:flutter_application_4/presentation/controllers/film_binding.dart';
import 'package:flutter_application_4/presentation/controllers/film_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_4/presentation/views/film_view.dart';


void main() {
   
    WidgetsFlutterBinding.ensureInitialized();
  final FilmDataSource dataSource = ApiFilmDataSource(ApiConfig.apiUrl);
  final FilmRepository filmRepository = FilmRepositoryImp(dataSource);
  final FilmUseCase filmUseCase = UsecaseFilmImp(filmRepository);

  Get.put<FilmDataSource>(dataSource);
  Get.put<FilmRepository>(filmRepository);
  Get.put<FilmUseCase>(filmUseCase);
  Get.put<FilmController>(FilmController());
   
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      
    return GetMaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: FilmBinding(), // Adicione a instância de FilmBinding aqui
      home: FilmListView(), // Substitua pelo widget inicial do seu aplicativo
    );
  }
}
