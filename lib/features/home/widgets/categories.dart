import 'package:flutter/material.dart';
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
      height: 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomItem(text: items[index]);
        },
      ),
    );
  }
}