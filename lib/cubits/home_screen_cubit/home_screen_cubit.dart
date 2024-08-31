import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomePageState> {
  HomeScreenCubit()
      : super(LocationState(
      selectedLocation: 'Los Angeles, USA',
      locations: const ['Aspen, USA', 'New York, USA', 'Los Angeles, USA']));

  void selectLocation(String location) {
    final currentState = state;
    if (currentState is LocationState) {
      emit(currentState.copyWith(selectedLocation: location));
    }
  }
  // To Select Categories
  void selectItem(int index) => emit(CategoriesState(index));
}
