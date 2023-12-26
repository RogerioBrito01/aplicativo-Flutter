import 'package:flutter/material.dart';
import 'package:flutter_application_4/data/models/film_model.dart';

import 'package:flutter_application_4/presentation/controllers/film_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FormWidget extends StatelessWidget {
FormWidget({super.key});
 final FilmController filmController = Get.find();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ),
        ElevatedButton(
  onPressed: () async{
    final title = _titleController.text;
    final description = _descriptionController.text;
    
    if (title.isNotEmpty && description.isNotEmpty) {
      final FilmModel newFilm = FilmModel(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        imageUrl: '',  // Coloque a URL de imagem real ou lógica de criação
        trailerUrl: '',  // Coloque a URL do trailer real ou lógica de criação
      );

      final success =await filmController.createFilm(newFilm);

      if(success){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Film created successfully")));
         await Future.delayed(Duration(seconds: 2));
          Navigator.pop(context);
      }
    }
  },
  child: Text('Add Film'),

      
),
         
       
        ],
      ),
    );
  }
}