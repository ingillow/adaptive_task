class RickMortyCharacter {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final String? image;

  RickMortyCharacter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory RickMortyCharacter.fromJson(Map<String, dynamic> json) {
    return RickMortyCharacter(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}