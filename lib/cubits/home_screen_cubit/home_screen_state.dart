import 'package:equatable/equatable.dart';
import '../../data/models/home_screen_model.dart';
import '../../data/models/details_screen_model.dart';

class HomePageState extends Equatable {
  final String selectedLocation;
  final List<String> locations;
  final int selectedCategoryIndex;
  final HomeScreenModel? homeScreenData;
  final List<DetailScreenModel>? detailScreenData;
  final bool isLoading;
  final String? errorMessage;

  HomePageState({
    required this.selectedLocation,
    required this.locations,
    required this.selectedCategoryIndex,
    this.homeScreenData,
    this.detailScreenData,
    this.isLoading = false,
    this.errorMessage,
  });

  HomePageState copyWith({
    String? selectedLocation,
    List<String>? locations,
    int? selectedCategoryIndex,
    HomeScreenModel? homeScreenData,
    List<DetailScreenModel>? detailScreenData,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomePageState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locations: locations ?? this.locations,
      selectedCategoryIndex: selectedCategoryIndex ?? this.selectedCategoryIndex,
      homeScreenData: homeScreenData ?? this.homeScreenData,
      detailScreenData: detailScreenData ?? this.detailScreenData,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    selectedLocation,
    locations,
    selectedCategoryIndex,
    homeScreenData,
    detailScreenData,
    isLoading,
    errorMessage,
  ];
}
