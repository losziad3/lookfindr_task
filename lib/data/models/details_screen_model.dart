class DetailScreenModel {
  final String name;
  final double rating;
  final int reviews;
  final String description;
  final List<String> facilities;
  final int price;
  final String image;

  DetailScreenModel({
    required this.name,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.facilities,
    required this.price,
    required this.image,
  });

  factory DetailScreenModel.fromJson(Map<String, dynamic> json) {
    return DetailScreenModel(
      name: json['name'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      description: json['description'],
      facilities: List<String>.from(json['facilities']),
      price: json['price'],
      image: json['image'],
    );
  }
}
