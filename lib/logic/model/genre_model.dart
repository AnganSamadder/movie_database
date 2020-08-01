class GenreModel {
  final int id;
  final String name;

  const GenreModel(this.id, this.name);

  GenreModel.fromJson(Map<String, dynamic> genreJson):
        this.id = genreJson['id'],
        this.name = genreJson['name'];

}