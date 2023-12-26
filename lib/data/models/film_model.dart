import 'package:flutter_application_4/domain/entities/film_entity.dart';

class FilmModel extends Film{
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String trailerUrl;

  FilmModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.trailerUrl,
  }) : super(id: id, title: title, description: description, imageUrl: imageUrl, trailerUrl: trailerUrl);

  factory FilmModel.fromJson(Map<String, dynamic> json) {
return FilmModel(
    id: json['_id'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    imageUrl: json['image_url'] ?? '',
    trailerUrl: json['trailer_url'] ?? '',
  );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'trailer_url': trailerUrl,
    };
  }
  static FilmModel fromEntity(Film film) {
  return FilmModel(
    id: film.id,
    title: film.title,
    description: film.description,
    imageUrl: film.imageUrl,
    trailerUrl: film.trailerUrl,
  );
}
}
