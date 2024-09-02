import '../../domain/repository/repository.dart';
import '../data_source/data_source.dart';
import '../models/details_screen_model.dart';
import '../models/home_screen_model.dart';

class RepositoryImplementation implements Repository {
  final DataSource dataSource;

  RepositoryImplementation(this.dataSource);

  @override
  Future<HomeScreenModel> fetchPopularAndRecommended() async {
    return await dataSource.getPopularAndRecommended();
  }

  @override
  Future<List<DetailScreenModel>> fetchDetails() async {
    return await dataSource.getDetails();
  }
}
