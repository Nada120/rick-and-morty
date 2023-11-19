class CharacterModel {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String origin;
  final String image;

  CharacterModel({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.image,
  });

  factory CharacterModel.fromJSON(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      origin: json['origin']['name'],
      image: json['image'],
    );
  }
}
