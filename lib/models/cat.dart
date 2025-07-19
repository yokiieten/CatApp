class Cat {
  final String id;
  final String url;
  final int width;
  final int height;
  final List<CatBreed>? breeds;

  Cat({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    this.breeds,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      breeds: json['breeds'] != null
          ? List<CatBreed>.from(
              json['breeds'].map((x) => CatBreed.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'width': width,
      'height': height,
      'breeds': breeds?.map((x) => x.toJson()).toList(),
    };
  }
}

class CatBreed {
  final String id;
  final String name;
  final String? description;
  final String? temperament;
  final String? origin;
  final String? lifeSpan;
  final String? weight;
  final String? wikipediaUrl;

  CatBreed({
    required this.id,
    required this.name,
    this.description,
    this.temperament,
    this.origin,
    this.lifeSpan,
    this.weight,
    this.wikipediaUrl,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      temperament: json['temperament'],
      origin: json['origin'],
      lifeSpan: json['life_span'],
      weight: json['weight']?['metric'],
      wikipediaUrl: json['wikipedia_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'temperament': temperament,
      'origin': origin,
      'life_span': lifeSpan,
      'weight': weight,
      'wikipedia_url': wikipediaUrl,
    };
  }
} 