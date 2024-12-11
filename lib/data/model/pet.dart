class Pet {
  String id;
  String name;
  String? imageUrl;
  String? species;
  String? gender;
  int? age;
  String? size;
  String? special_notes;

  Pet({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.species,
    required this.gender,
    required this.age,
    required this.size,
    required this.special_notes,
  });

  Pet.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          name: map['name'],
          imageUrl: map['imageUrl'],
          species: map['species'],
          gender: map['gender'],
          age: map['age'],
          size: map['size'],
          special_notes: map['special_notes'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'species': species,
      'gender': gender,
      'age': age,
      'size': size,
      'special_notes': special_notes,
    };
  }
}
