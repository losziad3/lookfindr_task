import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_state.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomePageState>(
      builder: (context, state) {
        return DropdownButton<String>(
          icon: Transform.rotate(
            angle: 90 * 3.1415926535 / 180, // 90 degrees rotation to point downwards
            child: const Icon(Icons.arrow_forward_ios),
          ),
          iconSize: 15,
          underline: const SizedBox.shrink(), // To remove the line under the dropdown button
          iconEnabledColor: Colors.blue,
          value: state.selectedLocation, // The currently selected value
          items: state.locations.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              context.read<HomeScreenCubit>().selectLocation(newValue);
            }
          },
        );
      },
    );
  }
}

