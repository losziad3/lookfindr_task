import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {
@override
List<Object> get props => [];
}

class LocationState extends HomePageState {
  final String selectedLocation;
  final List<String> locations;

  LocationState({
    required this.selectedLocation,
    required this.locations,
  });

  LocationState copyWith({
    String? selectedLocation,
    List<String>? locations,
  }) {
    return LocationState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object> get props => [selectedLocation, locations];
}


class CategoriesState extends HomePageState{
  final int selectedIndex;

  CategoriesState(this.selectedIndex);
}
