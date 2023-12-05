class FoodType {
  final String createdAt;
  final String name;
  final String ocasiao;
  final int avaliation;
  final String country;
  final bool especial;
  final String image;
  final String description;
  final List<String> ingredients;
  final String time;
  final String id;

  FoodType({
    required this.createdAt,
    required this.name,
    required this.ocasiao,
    required this.avaliation,
    required this.country,
    required this.especial,
    required this.image,
    required this.description,
    required this.ingredients,
    required this.time,
    required this.id,
  });

  factory FoodType.fromJson(Map<String, dynamic> json) {
    return FoodType(
      createdAt: json['createdAt'],
      name: json['name'],
      ocasiao: json['ocasiao'],
      avaliation: json['avaliation'],
      country: json['country'],
      especial: json['especial'],
      image: json['image'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      time: json['time'],
      id: json['id'],
    );
  }
}
