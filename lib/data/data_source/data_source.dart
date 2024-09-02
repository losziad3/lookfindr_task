import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lookfindr_task/data/models/details_screen_model.dart';
import 'package:lookfindr_task/data/models/home_screen_model.dart'; // for loading assets in Flutter

class DataSource {

  Future<List<HomeScreenModel>> getPopularAndRecommended() async {
    final String response = await rootBundle.loadString('assets/data/home_screen_data.json');
    final data = json.decode(response);

    List<HomeScreenModel> popular = (data['popular'] as List)
        .map((item) => HomeScreenModel.fromJson(item))
        .toList();

    return popular;
  }

  Future<List<DetailScreenModel>> getDetails() async {
    final String response = await rootBundle.loadString('assets/data/detail_screen_data.json');
    final data = json.decode(response);

    return (data as List)
        .map((item) => DetailScreenModel.fromJson(item))
        .toList();
  }
}
