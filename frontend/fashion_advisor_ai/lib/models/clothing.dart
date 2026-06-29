class Clothing {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String brand;
  final String priceRange;
  final List<String> styleTags;
  final List<String> colors;
  final List<String> items;
  final String mainCategory;
final String targetAudience;

  Clothing({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.brand,
    required this.priceRange,
    required this.styleTags,
    required this.colors,
    required this.items,
    required this.mainCategory,
    required this.targetAudience,
  });

  factory Clothing.fromJson(Map<String, dynamic> json) {
    return Clothing(
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      brand: json["brand"] ?? "",
      priceRange: json["priceRange"] ?? "",
      styleTags: List<String>.from(json["styleTags"] ?? []),
      colors: List<String>.from(json["colors"] ?? []),
      items: List<String>.from(json["items"] ?? []),
      mainCategory: json["mainCategory"] ?? "",
      targetAudience: json["targetAudience"] ?? "",
    );
  }
}