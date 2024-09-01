import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  final String selectedLocation;
  final List<String> locations;
  final int selectedCategoryIndex;

  HomePageState({
    required this.selectedLocation,
    required this.locations,
    required this.selectedCategoryIndex,
  });

  HomePageState copyWith({
    String? selectedLocation,
    List<String>? locations,
    int? selectedCategoryIndex,
  }) {
    return HomePageState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locations: locations ?? this.locations,
      selectedCategoryIndex: selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }

  @override
  List<Object> get props => [selectedLocation, locations, selectedCategoryIndex];
}
