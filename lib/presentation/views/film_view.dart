import 'package:flutter/material.dart';
import 'package:flutter_application_4/domain/entities/film_entity.dart';
import 'package:flutter_application_4/presentation/controllers/film_controller.dart';
import 'package:flutter_application_4/presentation/views/film_list.dart';
import 'package:flutter_application_4/presentation/views/form_widgt.dart';
import 'package:get/get.dart';

class FilmListView extends StatefulWidget {
  @override
  State<FilmListView> createState() => _FilmListViewState();
}

class _FilmListViewState extends State<FilmListView> {
  final FilmController filmController = Get.find();

  @override
  void initState() {
    filmController.loadFilms();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film App'),
        actions: [
        ElevatedButton(onPressed: (){
          filmController.loadFilms();
        }, child: Icon(Icons.autorenew))
        ],
      ),
      body: Obx(
        () {
          if (filmController.films.isEmpty) {
            return Center(
              child: Text('No films available.'),
            );
          } else {
            return FilmList(films: filmController.films);
          }
        },
        

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormWidget()),
            );
              //  
      },tooltip: "ADD",
      child: Icon(Icons.add),),
    );
  }
}

