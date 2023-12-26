import 'package:flutter/material.dart';
import 'package:flutter_application_4/domain/entities/film_entity.dart';
import 'package:flutter_application_4/presentation/controllers/film_controller.dart';
import 'package:flutter_application_4/presentation/views/film_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FilmList extends StatelessWidget {
  final List<Film> films;

  const FilmList({required this.films});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        final film = films[index];
        return ListTile(
          title: Container(
            child: Column(
              children: [
                Text(film.title),
                Text(film.description),
                Text(film.id),
                IconButton(
                  onPressed: () {
                    Get.find<FilmController>().deleteFilm(film.id);
                  },
                  icon: Icon(Icons.delete),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditFilmDialog(context, film);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditFilmDialog(BuildContext context, Film film) {
    TextEditingController titleController = TextEditingController(text: film.title);
    TextEditingController descriptionController = TextEditingController(text: film.description);
    TextEditingController imageUrlController = TextEditingController(text: film.imageUrl);
    TextEditingController trailerUrlController = TextEditingController(text: film.trailerUrl);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Filme'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'URL da Imagem'),
              ),
              TextField(
                controller: trailerUrlController,
                decoration: InputDecoration(labelText: 'URL do Trailer'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Coletar detalhes atualizados do filme e chamar a atualização
                Get.find<FilmController>().updateFilm(
                  film.id,
                  Film(
                    id: film.id,
                    title: titleController.text,
                    description: descriptionController.text,
                    imageUrl: imageUrlController.text,
                    trailerUrl: trailerUrlController.text,
                  ),
                );
                //  Get.find<FilmController>().loadFilms();
Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilmListView()),
            );
              //  Navigator.of(context).pop;
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}