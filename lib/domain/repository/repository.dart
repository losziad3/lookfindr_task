import '../../data/models/details_screen_model.dart';
import '../../data/models/home_screen_model.dart';

abstract class Repository {
  Future<List<HomeScreenModel>> fetchPopularAndRecommended();
  Future<List<DetailScreenModel>> fetchDetails();
}
