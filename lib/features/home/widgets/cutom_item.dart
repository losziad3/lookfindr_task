import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  final String text;

  const CustomItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
         color: Colors.grey,
        ),
      ),
    );
  }
}