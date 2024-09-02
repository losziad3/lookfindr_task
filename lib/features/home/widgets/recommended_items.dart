import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_state.dart';
import 'package:lookfindr_task/features/home/widgets/recommended_card.dart';

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomePageState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state.errorMessage != null) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }
        else if (state.homeScreenData == null || state.homeScreenData!.recommended.isEmpty) {
          return const Center(child: Text('No recommendations available'));
        }
        else{
          final recommendedItems = state.homeScreenData!.recommended;
          return Row(
            children: recommendedItems.map((item) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: RecommendedCard(
                  image: item.image,
                  title: item.name,
                  duration: item.duration,
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
