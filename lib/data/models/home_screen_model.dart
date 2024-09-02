class HomeScreenModel {
  final String name;
  final double rating;
  final String image;

  HomeScreenModel({required this.name, required this.rating, required this.image});

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenModel(
      name: json['name'],
      rating: json['rating'].toDouble(),
      image: json['image'],
    );
  }
}