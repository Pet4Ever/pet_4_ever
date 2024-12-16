class Pet {
  String id;
  String name;
  String? imageUrl;
  String? species;
  String? gender;
  int? age;
  String? size;
  String? special_notes;
  bool? visibility;

  Pet({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.species,
    required this.gender,
    required this.age,
    required this.size,
    required this.special_notes,
    required this.visibility,
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
          visibility: map['visibility'] ?? false,
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
      'visibility': visibility,
    };
  }

  Pet copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? species,
    String? gender,
    int? age,
    String? size,
    String? special_notes,
    bool? visibility,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      size: size ?? this.size,
      special_notes: special_notes ?? this.special_notes,
      visibility: visibility ?? this.visibility,
    );
  }
}
