import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repository/repository.dart';
import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomePageState> {
  final Repository repository;

  HomeScreenCubit(this.repository)
      : super(HomePageState(
    selectedLocation: 'Los Angeles, USA',
    locations: const ['Aspen, USA', 'New York, USA', 'Los Angeles, USA'],
    selectedCategoryIndex: 0,
  ));

  // To Select Location from Drop down button
  void selectLocation(String location) {
    emit(state.copyWith(selectedLocation: location));
  }
  // To choose category
  void selectCategory(int index) {
    emit(state.copyWith(selectedCategoryIndex: index));
  }

  Future<void> fetchPopularAndRecommended() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final data = await repository.fetchPopularAndRecommended();
      emit(state.copyWith(homeScreenData: data, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> fetchDetails() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final data = await repository.fetchDetails();
      emit(state.copyWith(detailScreenData: data, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
