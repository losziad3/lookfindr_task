class PopularItemModel {
  final String name;
  final double rating;
  final String image;


  PopularItemModel({
    required this.name,
    required this.rating,
    required this.image,
  });

  factory PopularItemModel.fromJson(Map<String, dynamic> json) {
    return PopularItemModel(
      name: json['name'],
      rating: json['rating'].toDouble(),
      image: json['image'],
    );
  }
}
class RecommendedItemModel {
  final String name;
  final String duration;
  final String image;

  RecommendedItemModel({
    required this.name,
    required this.duration,
    required this.image,
  });

  factory RecommendedItemModel.fromJson(Map<String, dynamic> json) {
    return RecommendedItemModel(
      name: json['name'],
      duration: json['duration'],
      image: json['image'],
    );
  }
}
class HomeScreenModel {
  final List<PopularItemModel> popular;
  final List<RecommendedItemModel> recommended;

  HomeScreenModel({
    required this.popular,
    required this.recommended,
  });
}
