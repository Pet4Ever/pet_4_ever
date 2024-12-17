class Pet {
  String id;
  String owner_id;
  String name;
  String? imageUrl;
  String? species;
  String? gender;
  int? age;
  String? size;
  String? special_notes;
  bool? visibility;
  String? introduction;

  Pet({
    required this.id,
    required this.owner_id,
    required this.name,
    required this.imageUrl,
    required this.species,
    required this.gender,
    required this.age,
    required this.size,
    required this.special_notes,
    required this.visibility,
    required this.introduction,
  });

  Pet.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          owner_id: map['owner_id'],
          name: map['name'],
          imageUrl: map['imageUrl'],
          species: map['species'],
          gender: map['gender'],
          age: map['age'],
          size: map['size'],
          special_notes: map['special_notes'],
          visibility: map['visibility'] ?? false,
          introduction: map['introduction'] ?? "",
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_id': owner_id,
      'name': name,
      'imageUrl': imageUrl,
      'species': species,
      'gender': gender,
      'age': age,
      'size': size,
      'special_notes': special_notes,
      'introduction': introduction,
      'visibility': visibility,
    };
  }

  Pet copyWith({
    String? id,
    String? owner_id,
    String? name,
    String? imageUrl,
    String? species,
    String? gender,
    int? age,
    String? size,
    String? special_notes,
    String? introduction,
    bool? visibility,
  }) {
    return Pet(
      id: id ?? this.id,
      owner_id: owner_id ?? this.owner_id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      size: size ?? this.size,
      special_notes: special_notes ?? this.special_notes,
      visibility: visibility ?? this.visibility,
      introduction: introduction ?? this.introduction,
    );
  }
}
