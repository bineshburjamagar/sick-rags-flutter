class ProductModel {
  final int id;
  final String? name;
  final int price;
  final List<dynamic> availableSize;
  final bool isPopular;
  final bool isRecent;
  final List<dynamic> images;
  final String? description;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.availableSize,
      required this.isPopular,
      required this.isRecent,
      required this.images,
      required this.description});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      availableSize: List<String>.from(json["available_size"].map((x) => x)),
      isPopular: json["is_popular"],
      isRecent: json["is_recent"],
      images: List<String>.from(json["images"].map((x) => x)),
      description: json["description"]);

  get heroTag => "${isPopular ? "popular" : ""}${isRecent ? "Rec" : ""}$id";

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "available_size": List<dynamic>.from(availableSize.map((x) => x)),
        "is_popular": isPopular,
        "is_recent": isRecent,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
