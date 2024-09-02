import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lookfindr_task/core/utils/assets.dart';
import 'package:lookfindr_task/data/models/details_screen_model.dart';
import 'package:lookfindr_task/data/models/home_screen_model.dart';

class DataSource {

  Future<HomeScreenModel> getPopularAndRecommended() async {
    final String response = await rootBundle.loadString(kHomeScreenData);
    final data = json.decode(response);

    List<PopularItemModel> popular = (data['popular'] as List)
        .map((item) => PopularItemModel.fromJson(item))
        .toList();

    List<RecommendedItemModel> recommended = (data['recommended'] as List)
        .map((item) => RecommendedItemModel.fromJson(item))
        .toList();

    return HomeScreenModel(
      popular: popular,
      recommended: recommended,
    );
  }

  Future<List<DetailScreenModel>> getDetails() async {
    final String response = await rootBundle.loadString(kDetailsScreenData);
    final data = json.decode(response);

    return (data as List)
        .map((item) => DetailScreenModel.fromJson(item))
        .toList();
  }
}
