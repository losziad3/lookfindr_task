import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_state.dart';
import 'package:lookfindr_task/features/home/widgets/cutom_item.dart';

class Categories extends StatelessWidget {
  final List<String> items = [
    'Location',
    'Hotels',
    'Food',
    'Adventure',
    'Location',
    'Hotels',
    'Food',
    'Adventure',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: BlocBuilder<HomeScreenCubit, HomePageState>(
        builder: (context, state) {
          final selectedIndex = state.selectedCategoryIndex;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  context.read<HomeScreenCubit>().selectCategory(index);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFf3f8fe) : Colors.transparent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

