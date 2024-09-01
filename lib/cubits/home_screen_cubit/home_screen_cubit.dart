import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomePageState> {
  HomeScreenCubit()
      : super(HomePageState(
    selectedLocation: 'Los Angeles, USA',
    locations: const ['Aspen, USA', 'New York, USA', 'Los Angeles, USA'],
    selectedCategoryIndex: 0,
  ));

  void selectLocation(String location) {
    emit(state.copyWith(selectedLocation: location));
  }

  void selectCategory(int index) {
    emit(state.copyWith(selectedCategoryIndex: index));
  }
}

